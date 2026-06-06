---
name: pdf-japanese-ocr
version: 2.0
description: Đọc PDF scan tiếng Nhật bằng Gemini Vision với pipeline OOM-safe (streaming + downscale + split double-page). Áp dụng khi PDF không có text layer, hoặc khi Gemini CLI gặp "JavaScript heap out of memory".
target_user: John
integration: Gemini CLI + Obsidian + skill n5-sensei
last_updated: 2026-05-19
changelog:
  - v2.0 (2026-05-19) Streaming pattern thay batch — fix JS heap OOM
  - v1.0 (2026-05-17) Initial pipeline
---

# PDF Japanese OCR v2.0 — Pipeline OOM-Safe

> **Vấn đề từng gặp**: Gemini CLI crash với `FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory` khi đọc PDF scan 200 DPI.
>
> **Nguyên nhân**: Ảnh 3307×2339 RGB khi decode trong Node.js heap = ~93MB raw tensor. Load 5 ảnh batch × tensor + context model + history → vỡ heap 7GB.
>
> **Giải pháp**: Streaming + Downscale + Split + Cleanup.

---

## ⚠️ Decision Tree

```
PDF input
├── Có text layer? (pdftotext -l 3 file.pdf - | head)
│   ├── YES → dùng pdftotext, BỎ QUA pipeline này
│   └── NO  → tiếp tục
│
├── Size > 20MB hoặc pages > 50?
│   ├── YES → DÙNG pdf-stream-extract.sh (OOM-safe path)
│   └── NO  → có thể dùng pdf-chunk-extract.sh (legacy)
│
└── Double-page scan? (ảnh landscape WxH với W>H)
    ├── YES → BẮT BUỘC --split → 2 sheet single mỗi page
    └── NO  → không split
```

---

## 🔧 Pipeline v2.0 (4 phase)

### Phase A: Pre-process (bash, không tốn heap Gemini)

```bash
# Convert + split + resize + compress, chỉ 1 page tại 1 thời điểm
bash .gemini/hooks/pdf-stream-extract.sh "00_Raw/NEJ_Vol1.pdf" \
  --dpi 120 \
  --max-width 1200 \
  --quality 75
```

**Tham số đề xuất theo loại PDF**:

| Loại PDF | DPI | max-width | quality | Tensor size mỗi ảnh |
|---|---|---|---|---|
| Sách text-heavy scan | 120 | 1200 | 75 | ~17 MB |
| Sách kanji (cần nét) | 150 | 1400 | 85 | ~24 MB |
| Tài liệu mật độ cao | 100 | 1000 | 70 | ~12 MB |
| Document text + ít hình | 100 | 900 | 65 | ~10 MB |

**Output** trong `02_Areas/Japanese_N5/<name>_extracted/_chunks/`:
- `sheet-001-L.jpg`, `sheet-001-R.jpg` (nếu split double-page)
- Hoặc `sheet-001.jpg` (single page mode)

### Phase B: Streaming Vision Extract (1 sheet / lần)

**MANDATE**: KHÔNG đọc batch nhiều sheet cùng lúc. Quy trình per-sheet:

```
for each sheet-XXX-{L|R}.jpg in _chunks/:
    1. read_file(sheet)                     ← Gemini Vision đọc 1 ảnh
    2. extract structure → markdown         ← agent xử lý
    3. write_file(extract.md)               ← flush ra disk
    4. CLEAR CONTEXT (start fresh chat)     ← thoát heap pressure
    5. tiếp tục sheet kế tiếp
```

**Tại sao clear context?** Mỗi `read_file` giữ image trong context của subagent. Sau extract, image vẫn ở đó cho đến hết phiên. Reset bằng cách:
- Tách extract thành nhiều subagent calls (mỗi call = 1 sheet)
- Hoặc dùng `/compact` định kỳ (mỗi 3-5 sheets)

### Phase C: Verify + Save (after each sheet)

Mỗi extract lưu vào `pages_XXX.md` (hoặc `sheet-XXX.md`) với:
```yaml
---
domain: Japanese
type: textbook-extract
source: NEJ_Vol1.pdf
sheet: "001-L"        # ← thay vì page_range vì 1 sheet = 1 nửa scan
status: indexed
verified: false
tags: [n5, nej, textbook, ocr-vision]
created: YYYY-MM-DD
nexus_version: 6.0
ocr_confidence: high|medium|low
---
```

### Phase D: Build MOC (sau khi hết toàn bộ chunks)

Tạo `MOCs/MOC_NEJ_Vol1.md` index theo Unit/Topic.

---

## 🧠 Heap Management Strategies

### Strategy 1: Tăng Node heap (band-aid)
```bash
# PowerShell (Windows)
$env:NODE_OPTIONS="--max-old-space-size=16384"
gemini

# bash/zsh (Mac/Linux/WSL)
export NODE_OPTIONS="--max-old-space-size=16384"
gemini
```
Tăng heap từ 4GB default lên 16GB. Tạm thời giảm OOM nhưng KHÔNG fix căn cứ — vẫn cần Phase A+B.

### Strategy 2: Aggressive downscale (preferred)
Nếu vẫn OOM ở 1200px:
```bash
bash .gemini/hooks/pdf-stream-extract.sh "$PDF" --dpi 100 --max-width 900 --grayscale
```
- DPI 100: vẫn đủ rõ cho kanji size N5
- max-width 900: tensor xuống ~9.5MB
- `--grayscale`: 3 channel → 1 channel → tensor giảm thêm 3x (xuống ~3MB!)

### Strategy 3: Manual progressive load
Trong CLI:
1. Restart `gemini`.
2. `@pdf-investigator extract chỉ sheet-001-L`
3. Sau khi xong → `/compact` hoặc restart phiên.
4. `@pdf-investigator extract chỉ sheet-001-R`
5. Lặp.

---

## 🛡️ Anti-Hallucination Mandates (kế thừa v1.0)

Khi user query về nội dung PDF đã ingest:

1. **`grep_search` trước**: tìm trong `pages_*.md` / `sheet_*.md`.
2. **Chỉ đọc sheet match** — không load random.
3. **Citation bắt buộc**: `[NEJ Vol1, sheet 003-L]: <quote>`.
4. **Abstain pattern**: nếu không tìm thấy → nói "Không thấy" + đề xuất action.
5. **OCR Confidence marker**: ✅/⚠️/❌ trong mỗi extract.

---

## 📊 Benchmark: NEJ_Vol1.pdf (292 pages double-page)

| Metric | v1.0 (batch) | v2.0 (stream) |
|---|---|---|
| Tensor RGB per image | ~93 MB | ~17 MB |
| Files processed concurrently | 5 (batch) | 1 (stream) |
| Heap peak estimate | ~600 MB just for tensors | ~25 MB |
| Output file count | 292 sheets | 584 sheets (split) |
| Avg JPG size | 540 KB | 100 KB |
| OOM at 4GB heap | YES 💥 | NO ✅ |

---

## 🔁 Resume Pattern

Nếu Gemini CLI crash giữa chừng:
1. Restart `gemini`.
2. Đọc `PROGRESS.md` để biết sheet nào đã extract.
3. Skip những sheet `- [x]`.
4. Tiếp tục từ sheet `- [ ]` đầu tiên.

---

## 🔗 Liên kết

- **`hooks/pdf-stream-extract.sh`** — Phase A executor.
- **`agents/pdf-investigator.md`** — Phase B+C executor.
- **`skills/n5-sensei`** — Verify nội dung tiếng Nhật.
- **`skills/vault-curator`** — Đảm bảo YAML + MOC chuẩn.
