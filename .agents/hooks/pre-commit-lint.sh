#!/usr/bin/env bash
# Pre-commit lint cho Atlas vault
# Check: YAML frontmatter, forbidden patterns (secrets), Vault Diet
# Exit 1 = block commit. Exit 0 = pass (có thể có warning).

set -uo pipefail

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

EXIT_CODE=0
WARNINGS=0
ERRORS=0

red()    { printf "\033[31m%s\033[0m\n" "$*"; }
yellow() { printf "\033[33m%s\033[0m\n" "$*"; }
green()  { printf "\033[32m%s\033[0m\n" "$*"; }

echo "🔍 Atlas pre-commit lint"
echo

# 1. Secret scan (CRITICAL)
echo "1️⃣  Scan secrets..."
SECRETS=$(git diff --cached -U0 | grep -iE "(api[_-]?key|secret|password|private[_-]?key|token)\s*[:=]\s*['\"]?[A-Za-z0-9_\-]{12,}" || true)
if [ -n "$SECRETS" ]; then
  red "❌ CRITICAL: phát hiện secret-like pattern trong diff:"
  echo "$SECRETS"
  ERRORS=$((ERRORS+1))
else
  green "  OK"
fi

# 2. YAML frontmatter cho note mới
echo "2️⃣  Check YAML frontmatter cho .md mới..."
NEW_MD=$(git diff --cached --name-only --diff-filter=A | grep -E '\.md$' | grep -vE '^(MOCs/|\.gemini/|\.github/|README|CHANGELOG)' || true)
if [ -n "$NEW_MD" ]; then
  while IFS= read -r f; do
    if [ -f "$f" ]; then
      first_line=$(head -1 "$f")
      if [ "$first_line" != "---" ]; then
        yellow "  ⚠️  $f thiếu YAML frontmatter"
        WARNINGS=$((WARNINGS+1))
      fi
    fi
  done <<< "$NEW_MD"
fi
[ "$WARNINGS" -eq 0 ] && green "  OK"

# 3. Vault Diet — block binary lớn
echo "3️⃣  Vault Diet check..."
LARGE=$(git diff --cached --name-only --diff-filter=A | while IFS= read -r f; do
  if [ -f "$f" ]; then
    size=$(wc -c < "$f")
    if [ "$size" -gt 1048576 ]; then  # >1MB
      echo "  $f ($((size/1024))KB)"
    fi
  fi
done)
if [ -n "$LARGE" ]; then
  yellow "⚠️  File >1MB trong staging (cân nhắc Vault Diet):"
  echo "$LARGE"
  WARNINGS=$((WARNINGS+1))
fi

# 4. Forbidden absolute paths
echo "4️⃣  Forbidden patterns..."
FORBIDDEN=$(git diff --cached -U0 | grep -E '^\+' | grep -E '(/Users/|C:\\Users\\|/home/[a-z]+/)' | grep -v 'Atlas-Setup-Guide' || true)
if [ -n "$FORBIDDEN" ]; then
  yellow "⚠️  Phát hiện đường dẫn tuyệt đối user-system trong diff."
  WARNINGS=$((WARNINGS+1))
fi
[ -z "$FORBIDDEN" ] && green "  OK"

echo
echo "─────────────────────────"
echo "Errors: $ERRORS | Warnings: $WARNINGS"

if [ "$ERRORS" -gt 0 ]; then
  red "❌ Commit blocked. Fix CRITICAL trước."
  exit 1
fi

green "✅ Pre-commit pass."
exit 0
