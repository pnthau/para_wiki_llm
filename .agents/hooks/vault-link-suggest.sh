#!/usr/bin/env bash
# Atlas — Wiki-Link Suggester (Co-occurrence based)
# Phân tích note input → tìm concept → grep across vault → suggest wiki-links.
#
# Usage: ./vault-link-suggest.sh <note-path> [--min-occurrences 2]

set -uo pipefail

NOTE="${1:?Usage: $0 <note-path> [--min-occurrences N]}"
shift
MIN_OCC=2

while [ $# -gt 0 ]; do
  case "$1" in
    --min-occurrences) MIN_OCC="$2"; shift 2;;
    *) echo "Unknown: $1" >&2; exit 1;;
  esac
done

if [ ! -f "$NOTE" ]; then
  echo "❌ Note không tồn tại: $NOTE" >&2
  exit 1
fi

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT"

NOTE_NAME=$(basename "$NOTE" .md)

echo "🔗 Wiki-Link Suggestion"
echo "──────────────────────"
echo "  Note: $NOTE"
echo "  Min co-occurrences: $MIN_OCC"
echo

# 1. Extract candidate concepts from note
#    - Bold terms (**term**)
#    - Capitalized multi-word (Java Concurrency, Spring Boot)
#    - Kanji compound (3+ kanji)
#    - Already-linked terms (skip — đã có rồi)

EXISTING_LINKS=$(grep -oE '\[\[[^]|#]+' "$NOTE" 2>/dev/null | sed 's/\[\[//' | sort -u)

TMP_CONCEPTS=$(mktemp)
trap 'rm -f "$TMP_CONCEPTS"' EXIT

# Bold terms
grep -oE '\*\*[A-Z][^*]{2,30}\*\*' "$NOTE" 2>/dev/null | \
  sed 's/\*\*//g' | sort -u >> "$TMP_CONCEPTS"

# Capitalized multi-word (2-3 words)
grep -oE '[A-Z][a-z]+ [A-Z][a-z]+( [A-Z][a-z]+)?' "$NOTE" 2>/dev/null | \
  sort -u >> "$TMP_CONCEPTS"

# Kanji compounds (3+ kanji liên tiếp)
grep -oE '[一-龯]{3,}' "$NOTE" 2>/dev/null | sort -u >> "$TMP_CONCEPTS"

# Deduplicate
sort -u "$TMP_CONCEPTS" -o "$TMP_CONCEPTS"

CANDIDATES=$(wc -l < "$TMP_CONCEPTS")
echo "📌 Candidate concepts: $CANDIDATES"

if [ "$CANDIDATES" -eq 0 ]; then
  echo "  (không tìm thấy candidate — note có thể quá ngắn hoặc không có bold/proper noun)"
  exit 0
fi

# 2. Foreach concept, count occurrences across vault
echo
echo "🔍 Co-occurrence search:"

SUGGESTIONS=$(mktemp)
trap 'rm -f "$TMP_CONCEPTS" "$SUGGESTIONS"' EXIT

while IFS= read -r concept; do
  [ -z "$concept" ] && continue
  # Skip if already linked
  if echo "$EXISTING_LINKS" | grep -qFx "$concept"; then continue; fi

  # Search across vault (exclude current note + .gemini/)
  count=$(grep -rlF "$concept" --include='*.md' \
    --exclude-dir='.git' --exclude-dir='.gemini' \
    --exclude-dir='.obsidian' --exclude-dir='node_modules' \
    . 2>/dev/null | grep -v "$NOTE" | wc -l)

  if [ "$count" -ge "$MIN_OCC" ]; then
    # Find best target: note có tên gần khớp với concept
    target=$(find . -name "*.md" \
      -not -path './.git/*' -not -path './.gemini/*' \
      -not -path './.obsidian/*' -not -path './node_modules/*' \
      -printf '%f\n' 2>/dev/null | sed 's/\.md$//' | \
      grep -i -F "$concept" | head -1)

    if [ -n "$target" ]; then
      echo "$count|$concept|$target" >> "$SUGGESTIONS"
    fi
  fi
done < "$TMP_CONCEPTS"

if [ ! -s "$SUGGESTIONS" ]; then
  echo "  (không tìm thấy concept nào đáp ứng ngưỡng $MIN_OCC co-occurrences)"
  exit 0
fi

# 3. Output suggestions
echo
echo "💡 Suggested wiki-links (sorted by confidence):"
echo
sort -t'|' -k1 -rn "$SUGGESTIONS" | head -15 | while IFS='|' read -r count concept target; do
  printf "  [%2d co-occ] %-30s → [[%s]]\n" "$count" "$concept" "$target"
done

echo
echo "📝 Đề xuất action:"
echo "  1. Thêm các wiki-link relevant vào section '## 📌 Cue' hoặc '## Related' của note"
echo "  2. Verify backlinks: sau khi thêm, ensure target note cũng link back về [[$NOTE_NAME]]"
echo
echo "  Hoặc chạy interactive trong Gemini CLI:"
echo "    @vault-curator suggest links cho $NOTE"
