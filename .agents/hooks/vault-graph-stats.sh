#!/usr/bin/env bash
# Atlas — Vault Graph Statistics
# Phân tích cấu trúc graph của vault: orphans, hubs, broken links, MOC coverage.
# Output: JSON-like report + human-readable summary.
#
# Usage: ./vault-graph-stats.sh [--json] [--scope <path>]

set -uo pipefail

JSON_OUTPUT=0
SCOPE="."

while [ $# -gt 0 ]; do
  case "$1" in
    --json) JSON_OUTPUT=1; shift;;
    --scope) SCOPE="$2"; shift 2;;
    *) echo "Unknown: $1" >&2; exit 1;;
  esac
done

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT"

# Find helper: tránh globbing issue bằng cách dùng prune pattern
find_md() {
  find "$1" -type d \( -name .git -o -name .gemini -o -name .obsidian \
    -o -name .trash -o -name node_modules \) -prune -o \
    -type f -name '*.md' -print 2>/dev/null
}

echo "🔍 Vault Graph Statistics"
echo "─────────────────────────"

# 1. Note count by folder
TOTAL=$(find_md "$SCOPE" | wc -l)
RAW=$([ -d ./00_Raw ] && find_md ./00_Raw | wc -l || echo 0)
PROJECTS=$([ -d ./01_Projects ] && find_md ./01_Projects | wc -l || echo 0)
AREAS=$([ -d ./02_Areas ] && find_md ./02_Areas | wc -l || echo 0)
RESOURCES=$([ -d ./03_Resources ] && find_md ./03_Resources | wc -l || echo 0)
MOCS=$(find ./MOCs -name 'MOC_*.md' 2>/dev/null | wc -l)

echo
echo "📊 Note count:"
echo "  Total:      $TOTAL"
echo "  00_Raw:     $RAW"
echo "  01_Projects: $PROJECTS"
echo "  02_Areas:   $AREAS"
echo "  03_Resources: $RESOURCES"
echo "  MOCs:       $MOCS"

# 2. Wiki-links extraction
TMP_LINKS=$(mktemp)
TMP_NOTES=$(mktemp)
trap 'rm -f "$TMP_LINKS" "$TMP_NOTES"' EXIT

find_md "$SCOPE" | while read -r f; do
  grep -oE '\[\[[^]|#]+' "$f" 2>/dev/null | sed 's/\[\[//' >> "$TMP_LINKS"
done

# Build index of all note basenames (without extension)
find_md "$SCOPE" | xargs -I{} basename {} .md 2>/dev/null | sort -u > "$TMP_NOTES"

TOTAL_LINKS=$(wc -l < "$TMP_LINKS")
UNIQUE_LINKS=$(sort -u "$TMP_LINKS" | wc -l)

echo
echo "🔗 Wiki-links:"
echo "  Total occurrences:  $TOTAL_LINKS"
echo "  Unique targets:     $UNIQUE_LINKS"

# 3. Broken links (target not found in vault)
BROKEN=$(sort -u "$TMP_LINKS" | while read -r link; do
  grep -qFx "$link" "$TMP_NOTES" || echo "$link"
done)
BROKEN_COUNT=$(echo "$BROKEN" | grep -cv '^$' || true)

echo "  ❌ Broken links:     $BROKEN_COUNT"
if [ "$BROKEN_COUNT" -gt 0 ] && [ "$BROKEN_COUNT" -le 15 ]; then
  echo "$BROKEN" | sed 's/^/    - /' | head -15
fi

# 4. Orphans (notes không được link bởi note nào khác)
ORPHANS=$(find_md "$SCOPE" | xargs -I{} basename {} .md | sort -u | while read -r note; do
  if [ "$note" = "MOC_Index" ] || [ "$note" = "README" ]; then continue; fi
  refs=$(grep -rlF "[[${note}]]" --include='*.md' \
    --exclude-dir=.git --exclude-dir=.gemini \
    --exclude-dir=.obsidian --exclude-dir=node_modules \
    "$SCOPE" 2>/dev/null | wc -l)
  if [ "$refs" -eq 0 ]; then
    echo "$note"
  fi
done)
ORPHAN_COUNT=$(echo "$ORPHANS" | grep -cv '^$' || true)

echo
echo "🌱 Orphans (không được note nào link đến):"
echo "  Count: $ORPHAN_COUNT"
if [ "$ORPHAN_COUNT" -gt 0 ] && [ "$ORPHAN_COUNT" -le 10 ]; then
  echo "$ORPHANS" | sed 's/^/    - /' | head -10
elif [ "$ORPHAN_COUNT" -gt 10 ]; then
  echo "$ORPHANS" | sed 's/^/    - /' | head -10
  echo "    ... và $((ORPHAN_COUNT - 10)) note khác"
fi

# 5. Hubs (notes được nhiều note khác link tới)
echo
echo "⭐ Top 10 Hubs (most linked-to):"
sort "$TMP_LINKS" | uniq -c | sort -rn | head -10 | awk '{printf "  %3d × [[%s]]\n", $1, $2}'

# 6. MOC stats
echo
echo "📑 MOC stats:"
for moc in ./MOCs/MOC_*.md; do
  [ ! -f "$moc" ] && continue
  links=$(grep -oE '\[\[[^]|#]+' "$moc" 2>/dev/null | wc -l)
  printf "  %-30s %3d links\n" "$(basename "$moc")" "$links"
done

# 7. MOC coverage (% notes được link bởi >= 1 MOC)
echo
TOTAL_LINKED_BY_MOC=$(grep -rohE '\[\[[^]|#]+' ./MOCs/ 2>/dev/null | sed 's/\[\[//' | sort -u | wc -l)
if [ "$TOTAL" -gt 0 ]; then
  COVERAGE=$((TOTAL_LINKED_BY_MOC * 100 / TOTAL))
  echo "📐 MOC Coverage: ${TOTAL_LINKED_BY_MOC}/${TOTAL} (${COVERAGE}%)"
fi

# 8. Folder vi phạm Vault Diet (node_modules trong projects)
echo
LEAKS=$(find ./01_Projects -path '*node_modules*' -name '*.md' 2>/dev/null | wc -l)
if [ "$LEAKS" -gt 0 ]; then
  echo "⚠️  CRITICAL: $LEAKS markdown files trong node_modules/ (cần .gitignore)"
fi

echo
echo "✅ Stats done."
echo
echo "💡 Next steps:"
[ "$ORPHAN_COUNT" -gt 5 ] && echo "  - bash .gemini/hooks/vault-cleanup.sh orphans"
[ "$BROKEN_COUNT" -gt 0 ] && echo "  - /moc-sync để fix broken links"
[ "$LEAKS" -gt 0 ] && echo "  - Update .gitignore + git rm -r --cached node_modules/"
