#!/usr/bin/env bash
# MOC Link Health — tìm broken wiki-links
# Exit 0 luôn (warn-only). Dùng cho /vault-audit hoặc periodic check.

set -uo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT"

echo "🔗 MOC Link Health Check"
echo "────────────────────────"

# Build index of all .md note names (without extension)
TMP=$(mktemp)
find . -type f -name "*.md" ! -path "./.git/*" ! -path "./node_modules/*" -printf '%f\n' \
  | sed 's/\.md$//' | sort -u > "$TMP"

BROKEN=0
TOTAL=0

# Scan wiki-links
grep -rohE '\[\[[^\]|#]+' --include="*.md" \
  --exclude-dir=.git --exclude-dir=node_modules \
  --exclude-dir=.obsidian . 2>/dev/null \
  | sed 's/^\[\[//' | sort -u | while read -r link; do
    TOTAL=$((TOTAL+1))
    if ! grep -qFx "$link" "$TMP"; then
      echo "  ❌ Broken: [[$link]]"
      BROKEN=$((BROKEN+1))
    fi
  done

rm -f "$TMP"

echo
echo "✅ Check done. (Note: counters chạy trong subshell — output đầy đủ ở trên.)"
