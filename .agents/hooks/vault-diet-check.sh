#!/usr/bin/env bash
# Vault Diet check — cảnh báo file binary/large trong vault
# Standalone — không liên quan Git. Chạy độc lập để audit.

set -uo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT"

echo "🥗 Vault Diet Audit"
echo "──────────────────"

# 1. File >1MB không phải MD
echo
echo "📦 File >1MB không phải markdown:"
find . -type f -size +1M ! -name "*.md" \
  ! -path "./.git/*" ! -path "./node_modules/*" ! -path "./.obsidian/*" \
  -exec ls -lh {} \; 2>/dev/null | awk '{print "  " $5 "\t" $9}'

# 2. File trong .geminiignore patterns mà vẫn track
echo
echo "🚫 File khớp .geminiignore nhưng vẫn track Git:"
git ls-files | while IFS= read -r f; do
  case "$f" in
    *.pdf|*.mp3|*.mp4|*.zip|*.7z|*.jpg|*.png|*.gif)
      echo "  $f"
      ;;
  esac
done | head -20

# 3. Top 10 file lớn nhất
echo
echo "📊 Top 10 file lớn nhất trong vault:"
find . -type f ! -path "./.git/*" ! -path "./node_modules/*" -printf '%s %p\n' 2>/dev/null \
  | sort -rn | head -10 | awk '{ printf "  %.2f MB\t%s\n", $1/1048576, $2 }'

echo
echo "✅ Audit hoàn tất."
