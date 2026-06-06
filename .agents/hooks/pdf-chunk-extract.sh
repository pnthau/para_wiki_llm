#!/usr/bin/env bash
# Atlas — PDF chunk extractor
# Usage: ./pdf-chunk-extract.sh <input.pdf> [chunk_size=5] [dpi=200]
#
# Chia PDF scan thành chunks JPG để Gemini Vision đọc.
# KHÔNG tự gọi Gemini — chỉ chuẩn bị images. Agent đọc tiếp theo.
#
# Output:
#   02_Areas/Japanese_N5/<name>_extracted/
#     _images/page-001.jpg, page-002.jpg, ...
#     CHUNKS.txt          ← danh sách chunk (page ranges)
#     PROGRESS.md         ← tracker

set -euo pipefail

PDF="${1:?Usage: $0 <input.pdf> [chunk_size] [dpi]}"
CHUNK_SIZE="${2:-5}"
DPI="${3:-200}"

if [ ! -f "$PDF" ]; then
  echo "❌ File không tồn tại: $PDF" >&2
  exit 1
fi

# Verify tools
for cmd in pdfinfo pdftoppm; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "❌ Cần cài: $cmd (gói poppler-utils)" >&2
    exit 1
  fi
done

NAME=$(basename "$PDF" .pdf | tr ' ' '_' | tr -cd 'A-Za-z0-9._-')
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
WORKDIR="$ROOT/02_Areas/Japanese_N5/${NAME}_extracted"
IMAGEDIR="$WORKDIR/_images"

mkdir -p "$IMAGEDIR"

echo "📚 PDF Chunk Extractor"
echo "──────────────────────"
echo "  File:        $PDF"
echo "  Workdir:     $WORKDIR"
echo "  Chunk size:  $CHUNK_SIZE pages"
echo "  DPI:         $DPI"
echo

# 1. Info
TOTAL=$(pdfinfo "$PDF" 2>/dev/null | awk '/^Pages:/ {print $2}')
echo "  Total pages: $TOTAL"

# 2. Check text layer
HAS_TEXT=0
if command -v pdftotext >/dev/null 2>&1; then
  TXT=$(pdftotext -l 3 "$PDF" - 2>/dev/null | tr -d '[:space:]' | head -c 100 || true)
  [ -n "$TXT" ] && HAS_TEXT=1
fi
echo "  Text layer:  $([ $HAS_TEXT -eq 1 ] && echo 'YES (có thể dùng pdftotext)' || echo 'NO (cần OCR Vision)')"

# 3. Convert (skip pages đã tồn tại)
echo
echo "🖼️  Converting pages → JPG @ ${DPI}dpi ..."
EXISTING=$(ls "$IMAGEDIR"/page-*.jpg 2>/dev/null | wc -l)
if [ "$EXISTING" -eq "$TOTAL" ]; then
  echo "  ✓ All $TOTAL pages already converted, skipping pdftoppm."
else
  # Detect padding width
  WIDTH=${#TOTAL}
  [ "$WIDTH" -lt 3 ] && WIDTH=3
  pdftoppm -r "$DPI" -jpeg -jpegopt quality=85 "$PDF" "$IMAGEDIR/page" 2>&1 | tail -3
  echo "  ✓ Converted $TOTAL pages to $IMAGEDIR/"
fi

# 4. Build chunk index
CHUNKS_FILE="$WORKDIR/CHUNKS.txt"
> "$CHUNKS_FILE"
n_chunks=0
for ((start=1; start<=TOTAL; start+=CHUNK_SIZE)); do
  end=$((start + CHUNK_SIZE - 1))
  [ $end -gt $TOTAL ] && end=$TOTAL
  printf "%03d-%03d\n" $start $end >> "$CHUNKS_FILE"
  n_chunks=$((n_chunks+1))
done
echo "  ✓ Index built: $n_chunks chunks → $CHUNKS_FILE"

# 5. Progress tracker
PROGRESS="$WORKDIR/PROGRESS.md"
if [ ! -f "$PROGRESS" ]; then
  cat > "$PROGRESS" <<EOF
---
type: pdf-ingest-progress
source: $(basename "$PDF")
total_pages: $TOTAL
chunks_total: $n_chunks
chunks_done: 0
last_updated: $(date -Iseconds)
---

# Progress: $(basename "$PDF" .pdf)

## Status
- [ ] Convert PDF → JPG ($([ -d "$IMAGEDIR" ] && echo "✓" || echo "pending"))
- [ ] Extract chunks ($n_chunks total)
- [ ] Build MOC

## Chunks
$(awk '{print "- [ ] pages_" $0}' "$CHUNKS_FILE")

## Notes
- DPI: $DPI
- Chunk size: $CHUNK_SIZE pages
- Anti-hallucination: mỗi chunk lưu kèm \`verified: false\`. Cross-check rồi mới đổi sang \`true\`.
EOF
  echo "  ✓ Progress tracker: $PROGRESS"
fi

echo
echo "✅ Pre-processing complete."
echo
echo "📋 Next steps (chạy trong Gemini CLI):"
echo "   /pdf-ingest \"$PDF\""
echo
echo "   Hoặc thủ công cho từng chunk:"
echo "   @pdf-investigator extract chunk 001-005 from $WORKDIR"
