---
name: security-reviewer
version: 1.0
description: Knowledge base về AppSec — OWASP Top 10, CWE patterns, defensive coding. Bổ sung cho agent `security-reviewer`.
target_user: John
integration: Gemini CLI + agent security-reviewer
last_updated: 2026-05-17
---

# Security Reviewer Skill — Knowledge Base

## 1. OWASP Top 10 (2021) Quick Reference

| ID | Title | Java-specific Pattern |
|---|---|---|
| A01 | Broken Access Control | Thiếu `@PreAuthorize`, IDOR trong REST endpoint |
| A02 | Cryptographic Failures | MD5/SHA1 cho password, hardcoded IV |
| A03 | Injection | Concatenate SQL, `Runtime.exec("...$input...")` |
| A04 | Insecure Design | Thiếu rate limit, business logic bypass |
| A05 | Security Misconfiguration | `debug=true` prod, CORS `*`, X-Frame-Options thiếu |
| A06 | Vulnerable Components | Log4j 2.x <2.17, Jackson <2.13 với polymorphic |
| A07 | Identification Failures | JWT secret yếu, session không invalidate |
| A08 | Software/Data Integrity | Insecure deserialization, npm without lockfile |
| A09 | Logging Failures | Thiếu audit log, log secret, không có alerting |
| A10 | SSRF | URL fetch user-input không validate domain |

## 2. CWE Cheat Sheet

- CWE-79 (XSS): output không encode trong template
- CWE-89 (SQL Injection): `Statement` thay `PreparedStatement`
- CWE-22 (Path Traversal): `..` trong file path
- CWE-352 (CSRF): thiếu CSRF token cho state-changing endpoint
- CWE-918 (SSRF): server fetch URL từ user input
- CWE-502 (Insecure Deserialization): `ObjectInputStream` cho untrusted source

## 3. Defensive Patterns

### Input Validation
```java
// Bad
String query = "SELECT * FROM users WHERE name='" + name + "'";

// Good
PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM users WHERE name = ?");
ps.setString(1, name);
```

### Authentication
- Password: BCrypt/Argon2 (cost factor ≥10)
- Session: HttpOnly + Secure + SameSite=Strict
- JWT: HS256 nếu shared secret, RS256 nếu public verify; rotate keys
- Refresh token: long-lived, server-side revocation

### Secrets Management
- Local dev: `.env` (gitignored) + `application-local.yml`
- CI/Prod: Vault / AWS Secrets Manager / GCP Secret Manager
- KHÔNG BAO GIỜ commit secret kể cả trong test fixture

### Logging
- KHÔNG log: password, token, JWT, full credit card, PII
- LOG: userId (không PII), action, timestamp, IP (anonymized nếu cần GDPR)
- Format: structured JSON cho dễ alerting

## 4. Audit Commands

```bash
# Java
mvn dependency-check:check
mvn dependency:tree | grep -i log4j

# Node
npm audit --production
npx audit-ci --moderate

# Git history
git log --all -p -S 'password='
git log --all -p -S 'apiKey'

# Find files with secrets pattern
grep -rEn "(api[_-]?key|secret|token|password)\s*[:=]" \
  --include='*.java' --include='*.ts' --include='*.yml' \
  --include='*.properties' --include='*.env' .
```

## 5. Threat Modeling (lightweight)

Trước khi review, hỏi 4 câu (STRIDE giản lược):
1. **What** — Feature này làm gì?
2. **Who** — Ai dùng? Anonymous / authenticated / privileged?
3. **Data** — Xử lý PII/secret/financial?
4. **Trust boundary** — Input đến từ đâu? (user, internal, external API)

Ra threat candidate:
- Spoofing → Auth
- Tampering → Input validation, integrity
- Repudiation → Audit log
- Information Disclosure → Output filter, error message
- Denial of Service → Rate limit, resource quota
- Elevation of Privilege → Least privilege, role check

## 6. Emergency Response

Khi phát hiện secret đã trong Git history:

```bash
# 1. STOP push immediately
# 2. Rotate secret tại provider
# 3. Rewrite history
# Option A: git-filter-repo (recommended)
pip install git-filter-repo
git filter-repo --replace-text expressions.txt

# Option B: BFG Repo-Cleaner
java -jar bfg.jar --replace-text expressions.txt repo.git

# 4. Force push (coordinate với team!)
git push --force-with-lease

# 5. Tell all contributors to re-clone
```

## 7. Khi cần escalate

- Phát hiện CVE trong dependency → `docs-lookup` để verify patch
- Refactor cần thiết → `code-architect` (chưa có, tham khảo `code-reviewer`)
