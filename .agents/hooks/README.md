---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [needs-review]
created: 2026-05-27
updated: 2026-05-27
nexus_version: 6.0
---
# Atlas Hooks â€” Git Time Machine + Quality Guards

## Hook Concept (Gemini CLI)

Gemini CLI há»— trá»£ **hooks** thÃ´ng qua extension manifest (chÆ°a stable 100% nhÆ° Claude Code, nhÆ°ng pattern tÆ°Æ¡ng tá»±). CÃ¡c script trong folder nÃ y Ä‘Æ°á»£c thiáº¿t káº¿ Ä‘á»ƒ:

1. Cháº¡y thá»§ cÃ´ng qua slash command (vd: `/checkpoint` gá»i `git-snapshot.sh`)
2. Gáº¯n vÃ o Git hook (`.git/hooks/pre-commit`) náº¿u muá»‘n enforce
3. Tham kháº£o cho subagent khi quyáº¿t Ä‘á»‹nh verification command

## Files

| File | Má»¥c Ä‘Ã­ch | Trigger |
|---|---|---|
| `git-snapshot.sh` | Git Time Machine â€” atomic commit | `/checkpoint`, manual |
| `pre-commit-lint.sh` | Lint YAML frontmatter + check forbidden patterns | Pre-commit (optional symlink) |
| `vault-diet-check.sh` | Cáº£nh bÃ¡o binary lá»›n vÃ o staging | Pre-commit |
| `moc-link-check.sh` | Verify wiki-links khÃ´ng gÃ£y | Pre-commit (warn-only) |

## CÃ i Ä‘áº·t Git hooks (tÃ¹y chá»n)

```bash
# Symlink (Linux/WSL/Mac)
ln -sf "$(pwd)/.gemini/hooks/pre-commit-lint.sh" .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

# Windows PowerShell
Copy-Item -Path ".gemini\hooks\pre-commit-lint.sh" -Destination ".git\hooks\pre-commit"
```

## Mandate

- Hook KHÃ”NG Ä‘Æ°á»£c tá»± `git push`.
- Hook chá»‰ exit 1 khi block intentional (CRITICAL issue).
- Má»i WARNING dÃ¹ng exit 0 + stderr message.
