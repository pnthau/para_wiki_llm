#!/usr/bin/env bash
# Atlas — PDF Stream Extractor (OOM-safe)
# Usage: ./pdf-stream-extract.sh <input.pdf> [options]
#
# Khắc phục lỗi "JavaScript heap out of memory" khi Gemini Vision đọc PDF lớn:
#   1. CONVERT PDF → JPG ở DPI thấp (default 120 thay vì 200)
#   2. SPLIT double-page scan thành 2 single page (left, right)
#   3. RESIZE ảnh xuống max-width 1200px (giữ aspect ratio)
#   4. JPG quality 75 (giảm size 30%)
#   5. Output single-page chunks vào _chunks/sheet-XXX-{L,R}.jpg
#   6. Cleanup raw ngay sau khi process → đỡ tốn disk
#
# Workflow Vision sau đó: process 1 sheet / lần, write extract, drop context, lặp.
#
# Options:
#   --dpi N          (default 120) DPI khi pdftoppm
#   --max-width N    (default 1200) px, resize ảnh xuống
#   --quality N      (default 75) JPG quality (1-100)
#   --no-split       không tách double-page (giữ ảnh nguyên)
#   --grayscale      convert sang grayscale (giảm tensor 3x)
#   --from N         page đầu tiên (default 1)
#   --to N           page cuối (default total)
#   --out DIR        output directory (default 02_Areas/Japanese_N5/<name>_extracted/_chunks)

set -euo pipefail

PDF="${1:?Usage: $0 <input.pdf> [--dpi 120] [--max-width 1200] [--quality 75] [--no-split] [--grayscale] [--from N] [--to N] [--out DIR]}"
shift

DPI=120
MAX_WIDTH=1200
QUALITY=75
SPLIT_DOUBLE=1
GRAYSCALE=0
FROM=1
TO=""
OUT_DIR=""

while [ $# -gt 0 ]; do
  case "$1" in
    --dpi) DPI="$2"; shift 2;;
    --max-width) MAX_WIDTH="$2"; shift 2;;
    --quality) QUALITY="$2"; shift 2;;
    --no-split) SPLIT_DOUBLE=0; shift;;
    --grayscale) GRAYSCALE=1; shift;;
    --from) FROM="$2"; shift 2;;
    --to) TO="$2"; shift 2;;
    --out) OUT_DIR="$2"; shift 2;;
    *) echo "Unknown option: $1" >&2; exit 1;;
  esac
done

# Verify tools
# Note: ImageMagick 7 uses 'magick' to avoid conflict with Windows 'convert'
IMG_CONVERT="convert"
IMG_IDENTIFY="identify"
if command -v magick >/dev/null; then
  IMG_CONVERT="magick"
  IMG_IDENTIFY="magick identify"
fi

for cmd in pdfinfo pdftoppm "$IMG_CONVERT" "$IMG_IDENTIFY"; do
  # Check only the first part of the command (e.g., 'magick' instead of 'magick identify')
  actual_cmd=$(echo "$cmd" | awk '{print $1}')
  command -v "$actual_cmd" >/dev/null || { echo "❌ Missing: $actual_cmd"; exit 1; }
done

# Setup paths
NAME=$(basename "$PDF" .pdf | tr ' ' '_' | tr -cd 'A-Za-z0-9._-')
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
WORKDIR="$ROOT/02_Areas/Japanese_N5/${NAME}_extracted"
[ -z "$OUT_DIR" ] && OUT_DIR="$WORKDIR/_chunks"
TMP_DIR="$ROOT/.gemini/tmp/pdfstream_$(date +%s)"
mkdir -p "$TMP_DIR"
trap 'rm -rf "$TMP_DIR"' EXIT

mkdir -p "$OUT_DIR"

TOTAL=$(pdfinfo "$PDF" | awk '/^Pages:/ {print $2}')
[ -z "$TO" ] && TO="$TOTAL"

echo "📚 PDF Stream Extractor (OOM-safe)"
echo "──────────────────────────────────"
echo "  File:         $PDF"
echo "  Total pages:  $TOTAL"
echo "  Processing:   $FROM → $TO ($((TO - FROM + 1)) pages)"
echo "  DPI:          $DPI"
echo "  Max width:    $MAX_WIDTH px"
echo "  Quality:      $QUALITY"
echo "  Split double: $([ $SPLIT_DOUBLE -eq 1 ] && echo 'YES' || echo 'NO')"
echo "  Grayscale:    $([ $GRAYSCALE -eq 1 ] && echo 'YES' || echo 'NO')"
echo "  Output:       $OUT_DIR"
echo "  Tmp:          $TMP_DIR"
echo

CONVERT_OPTS="-quality $QUALITY"
[ "$GRAYSCALE" -eq 1 ] && CONVERT_OPTS="$CONVERT_OPTS -colorspace Gray"

# STREAMING LOOP: page → raw JPG → split? → resize → final → cleanup raw
out_count=0
for ((p=FROM; p<=TO; p++)); do
  printf "  Page %3d/%3d ... " "$p" "$TO"

  # 1. Convert 1 page → raw JPG vào tmp (DPI thấp ngay từ đầu)
  # pdftoppm với -f P -l P tạo prefix-<padded>.jpg
  pdftoppm -r "$DPI" -jpeg -jpegopt quality=85 -f "$p" -l "$p" \
    "$PDF" "$TMP_DIR/raw" 2>/dev/null
  # Tìm file vừa tạo
  RAW=$(ls -t "$TMP_DIR"/raw-*.jpg 2>/dev/null | head -1)
  if [ -z "$RAW" ] || [ ! -f "$RAW" ]; then
    echo "SKIP (pdftoppm no output)"
    continue
  fi

  # 2. Detect landscape (double-page) → split
  read W H < <($IMG_IDENTIFY -format "%w %h\n" "$RAW" | tr -d '\r') || true
  if [ -z "${W:-}" ] || [ -z "${H:-}" ]; then
    echo "SKIP ($IMG_IDENTIFY failed)"
    continue
  fi
  IS_LANDSCAPE=$([ "$W" -gt "$H" ] && echo 1 || echo 0)
  SHEET_NUM=$(printf "%03d" "$p")

  if [ "$SPLIT_DOUBLE" -eq 1 ] && [ "$IS_LANDSCAPE" -eq 1 ]; then
    # Split thành 2 single page (left + right)
    HALF=$((W / 2))
    LEFT="$OUT_DIR/sheet-${SHEET_NUM}-L.jpg"
    RIGHT="$OUT_DIR/sheet-${SHEET_NUM}-R.jpg"

    $IMG_CONVERT "$RAW" -crop "${HALF}x${H}+0+0" +repage \
      -resize "${MAX_WIDTH}x>" $CONVERT_OPTS "$LEFT" 2>/dev/null
    $IMG_CONVERT "$RAW" -crop "${HALF}x${H}+${HALF}+0" +repage \
      -resize "${MAX_WIDTH}x>" $CONVERT_OPTS "$RIGHT" 2>/dev/null
    sync
    out_count=$((out_count + 2))
    size_l=$(stat -c%s "$LEFT" 2>/dev/null || echo 0)
    size_r=$(stat -c%s "$RIGHT" 2>/dev/null || echo 0)
    echo "split → L=$((size_l/1024))KB R=$((size_r/1024))KB"
  else
    # Single page: chỉ resize + optimize
    OUT="$OUT_DIR/sheet-${SHEET_NUM}.jpg"
    $IMG_CONVERT "$RAW" -resize "${MAX_WIDTH}x>" $CONVERT_OPTS "$OUT" 2>/dev/null
    sync
    out_count=$((out_count + 1))
    size=$(stat -c%s "$OUT" 2>/dev/null || echo 0)
    echo "single → $((size/1024))KB"
  fi

  # 3. Cleanup raw immediately
  rm -f "$RAW"
done

echo
echo "✅ Done."
echo "  Output:        $OUT_DIR/"
echo "  Total files:   $out_count single-page JPG"
echo "  Total size:    $(du -sh "$OUT_DIR" 2>/dev/null | awk '{print $1}')"
AVG=$(ls -lh "$OUT_DIR"/*.jpg 2>/dev/null | awk '{s+=$5; n++} END {if(n>0) printf "%.0fKB", s/n/1024; else print "N/A"}')
echo "  Avg per page:  $AVG"
echo
echo "📋 Tiếp tục trong Gemini CLI:"
echo "   @pdf-investigator hãy extract sheet-001-L và sheet-001-R từ $OUT_DIR"
echo
echo "💡 Tip nếu vẫn OOM:"
echo "   PowerShell: \$env:NODE_OPTIONS=\"--max-old-space-size=16384\""
echo "   bash:       export NODE_OPTIONS=\"--max-old-space-size=16384\""
echo "   Hoặc giảm DPI: $0 \"$PDF\" --dpi 100 --max-width 1000"
