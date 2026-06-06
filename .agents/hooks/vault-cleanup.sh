#!/usr/bin/env bash
# Atlas — Vault Cleanup
# Smart cleanup: dedup detection, auto-archive completed projects, list orphans.
# KHÔNG tự xóa/move — chỉ report + đề xuất commands cho user approve.
#
# Usage: ./vault-cleanup.sh <mode>
#   mode: dedup | archive | orphans | all

set -uo pipefail

MODE="${1:?Usage: $0 <dedup|archive|orphans|all>}"

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT"

find_md() {
  find "${1:-.}" -type d \( -name .git -o -name .gemini -o -name .obsidian \
    -o -name .trash -o -name node_modules \) -prune -o \
    -type f -name '*.md' -print 2>/dev/null
}

mode_dedup() {
  echo "🔄 Dedup Detection"
  echo "─────────────────"

  # Strategy: same title OR same first-100-char hash
  TMP=$(mktemp)
  trap "rm -f $TMP" EXIT

  find_md . | while read -r f; do
    # Skip MOC and README
    case "$(basename "$f")" in MOC_*|README.md) continue;; esac
    # Get title (first H1) and first-100-char hash
    title=$(grep -m1 '^# ' "$f" 2>/dev/null | sed 's/^# //' | tr -d '\r\n')
    [ -z "$title" ] && title="(no title)"
    hash=$(sed -n '/^---$/,/^---$/!p' "$f" 2>/dev/null | head -c 200 | md5sum | cut -c1-8)
    size=$(stat -c%s "$f" 2>/dev/null || echo 0)
    echo "${hash}|${size}|${title}|${f}" >> "$TMP"
  done

  echo
  echo "Candidates by content hash (first 200 chars):"
  awk -F'|' '{print $1}' "$TMP" | sort | uniq -c | awk '$1 > 1' | head -10 | \
  while read count hash; do
    echo "  Hash $hash ($count files):"
    grep "^${hash}|" "$TMP" | awk -F'|' '{printf "    %s  (size=%s)  %s\n", $4, $2, $3}' | head -5
  done

  echo
  echo "Candidates by exact title:"
  awk -F'|' '{print $3}' "$TMP" | sort | uniq -c | awk '$1 > 1' | head -10 | \
  while read count title_rest; do
    echo "  \"$title_rest\" ($count files):"
    grep -F "|${title_rest}|" "$TMP" | awk -F'|' '{printf "    %s\n", $4}' | head -5
  done

  echo
  echo "💡 Action: Review từng nhóm → merge content tốt nhất → archive còn lại."
  echo "   KHÔNG có auto-merge — luôn manual review."
}

mode_archive() {
  echo "📦 Auto-Archive Candidates"
  echo "─────────────────────────"

  # Tìm note status: completed trong 01_Projects/
  CANDIDATES=$(find_md ./01_Projects | while read -r f; do
    if grep -qE '^status:\s*"?completed' "$f" 2>/dev/null; then
      echo "$f"
    fi
  done)

  CCOUNT=$(echo "$CANDIDATES" | grep -cv '^$' || true)
  echo "  Notes status: completed trong 01_Projects/: $CCOUNT"

  if [ "$CCOUNT" -gt 0 ]; then
    YEAR=$(date +%Y)
    ARCHIVE_DIR="./03_Resources/04_Archives/${YEAR}"
    echo
    echo "📋 Đề xuất move (chạy thủ công để approve):"
    echo "    mkdir -p $ARCHIVE_DIR"
    echo "$CANDIDATES" | while read -r f; do
      [ -z "$f" ] && continue
      echo "    git mv \"$f\" \"$ARCHIVE_DIR/$(basename "$f")\""
    done | head -10
    [ "$CCOUNT" -gt 10 ] && echo "    ... và $((CCOUNT - 10)) file khác"
  fi

  # Stale notes (>180 ngày, status: active)
  echo
  echo "📅 Stale notes (>180 ngày, status: active):"
  STALE=$(find_md . | while read -r f; do
    age_days=$(( ($(date +%s) - $(stat -c %Y "$f" 2>/dev/null || echo 0)) / 86400 ))
    [ "$age_days" -lt 180 ] && continue
    grep -qE '^status:\s*"?active' "$f" 2>/dev/null && echo "$f"
  done)
  SCOUNT=$(echo "$STALE" | grep -cv '^$' || true)
  echo "  Total: $SCOUNT"
  if [ "$SCOUNT" -gt 0 ] && [ "$SCOUNT" -le 10 ]; then
    echo "$STALE" | sed 's/^/    - /'
  elif [ "$SCOUNT" -gt 10 ]; then
    echo "$STALE" | head -10 | sed 's/^/    - /'
    echo "    ... và $((SCOUNT - 10)) note khác"
  fi
  echo
  echo "💡 Action: review từng note → đổi status sang \`needs-review\` hoặc \`archived\`."
}

mode_orphans() {
  echo "🌱 Orphan Detection"
  echo "──────────────────"

  TMP_LINKS=$(mktemp)
  TMP_NOTES=$(mktemp)
  trap "rm -f $TMP_LINKS $TMP_NOTES" EXIT

  # All wiki-link targets
  find_md . | xargs grep -ohE '\[\[[^]|#]+' 2>/dev/null | \
    sed 's/\[\[//' | sort -u > "$TMP_LINKS"

  # All note names
  find_md . | xargs -I{} basename {} .md 2>/dev/null | sort -u > "$TMP_NOTES"

  # Orphans = notes không xuất hiện trong TMP_LINKS
  ORPHANS=$(comm -23 "$TMP_NOTES" "$TMP_LINKS")
  ORPHAN_COUNT=$(echo "$ORPHANS" | grep -cv '^$' || true)

  echo "  Total orphans (không note nào link đến): $ORPHAN_COUNT"
  echo
  if [ "$ORPHAN_COUNT" -gt 0 ]; then
    echo "  Sample (20 đầu):"
    echo "$ORPHANS" | head -20 | sed 's/^/    - /'
    [ "$ORPHAN_COUNT" -gt 20 ] && echo "    ... và $((ORPHAN_COUNT - 20)) note khác"
  fi

  echo
  echo "💡 Action options cho mỗi orphan:"
  echo "    (a) Link vào MOC: edit MOCs/MOC_<Domain>.md → thêm [[<note>]]"
  echo "    (b) Archive: đổi status sang \`archived\` + move"
  echo "    (c) Delete: nếu không còn relevant (manual)"
}

case "$MODE" in
  dedup) mode_dedup;;
  archive) mode_archive;;
  orphans) mode_orphans;;
  all)
    mode_dedup; echo; echo
    mode_archive; echo; echo
    mode_orphans
    ;;
  *) echo "❌ Unknown mode: $MODE" >&2; exit 1;;
esac
