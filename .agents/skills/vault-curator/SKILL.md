---
name: vault-curator
version: 3.0
description: "LLM Wiki Edition (Hybrid PARA) — Quản lý tri thức theo mô hình 3 Layers (Raw, Wiki, Schema) và 3 Operations (Ingest, Query, Lint). Tích hợp logging tự động vào log.md."
target_user: John
integration: Gemini CLI + Obsidian + agent vault-auditor + scripts hooks/vault-*.sh
last_updated: 2026-05-27
changelog:
  - v3.0 (2026-05-27) LLM Wiki Edition — Ingest/Query/Lint + Logging
  - v2.0 (2026-05-19) Knowledge Graph Edition — 7 module + 5 script
philosophy: |
  "Wiki là một thực thể sống, tích lũy và tự tiến hóa."
  Triết lý 3 trụ cột LLM Wiki:
    1. Persistent — Kiến thức không bị mất đi trong chat history, mà được đúc kết vào wiki.
    2. Compounding — Càng nhiều nguồn, wiki càng giàu liên kết và giá trị.
    3. Automated — LLM lo việc bảo trì (lint, link, format), John lo việc tư duy.
---

# Vault Curator v3.0 — LLM Wiki Edition

> **Mission**: Biến PARA Vault thành một **Persistent Knowledge Wiki**. LLM đóng vai trò là "Wiki Maintainer" (người bảo trì), John là "Curator" (người giám tuyển).

---

## 🏗️ 3-Layer Architecture

1.  **Raw Sources** (`00_Raw/`): Các nguồn tin thô (PDF, article, transcript). **Bất biến** (Read-only).
2.  **The Wiki** (`01_Projects/`, `02_Areas/`, `03_Resources/`, `MOCs/`): Các file markdown do LLM tạo ra và duy trì. Đây là "Source of Truth" hiện tại.
3.  **The Schema** (`GEMINI.md`, `.gemini/`): Các quy tắc, định dạng và workflow mà LLM phải tuân thủ.

---

## ⚙️ 3 Core Operations

### 1. Ingest (Hấp thụ)
Gộp các Module M1, M2, M3 từ v2.0.
- **Workflow**: Đọc Raw → Phân loại Domain → Chuyển đổi Cornell (Cue/Notes/Summary) → Gắn YAML v4.0 → Smart Linking (M2) → Auto-MOC update (M3).
- **Mandate**: Mỗi lần Ingest thành công, phải append 1 dòng vào `log.md`.

### 2. Query (Truy vấn & Tổng hợp)
- **Workflow (HashMap O(1))**: Nhận câu hỏi → **Tra cứu `hash_index.json` trước tiên** để lấy trực tiếp đường dẫn file (O(1 lookup)). Chỉ dùng Grep/MOCs duyệt cây (B-Tree traversal) khi không tìm thấy trong Bảng Băm. → Tổng hợp câu trả lời → **Lưu câu trả lời giá trị vào Wiki** (nếu là synthesis mới).
- **Artifacts**: Tạo các "Synthesis Pages" hoặc "Comparison Tables" trực tiếp vào `02_Areas/`.

### 3. Lint (Bảo trì & Tối ưu — Karpathy 6-Point Protocol)
Bao gồm cả Kiểm tra Hạ tầng (Structural) & Kiểm tra Ngữ nghĩa (Semantic):
- **Structural Checks**:
  - **Health Score**: Chạy `vault-health.sh` xuất chỉ số Linkage, MOC Coverage, YAML, Freshness, Atomicity.
  - **Vault Cleanup & Diet**: Thu dọn rác (`vault-cleanup.sh`), tỉa nhỏ note >300 dòng, loại bỏ file lớn (`vault-diet-check.sh`).
  - **B-Tree Node Split (Auto-Balance)**: Kiểm tra các thư mục/MOC. Nếu một MOC/Folder chứa **vượt quá 20 links/files**, bắt buộc đề xuất Split (tách thành 2 MOC con) để đảm bảo cây thư mục cân bằng (Balanced Tree).
- **Semantic Checks (LLM Wiki Lint Protocol)**:
  - **1. Contradictions**: Quét và đối soát mâu thuẫn/xung đột tri thức giữa các note.
  - **2. Orphan Pages**: Phát hiện các trang mồ côi (thiếu inbound links từ MOCs/note khác).
  - **3. Missing Concepts**: Phát hiện thuật ngữ/khái niệm quan trọng được đề cập nhiều nhưng chưa có note riêng.
  - **4. Outdated Claims**: Gắn cờ thông tin cũ hoặc mâu thuẫn với tài liệu mới hấp thụ (`00_Raw/`).
  - **5. Format Compliance**: Kiểm tra tuân thủ YAML frontmatter v4.0 & Hybrid PARA layout.
  - **6. Actionable Report**: Trình bày kết quả dạng danh sách đánh số kèm gợi ý sửa (Quick Wins) cụ thể.
- **Mandate**: Ghi kết quả Lint vào `log.md`.

---

## 📝 Indexing & Logging

### log.md (Chronological)
Nằm tại thư mục root. Lưu vết mọi thay đổi quan trọng.
Định dạng: `## [YYYY-MM-DD] <operation> | <description>`

### MOC_Index.md (Content-oriented)
Nằm trong `MOCs/`. Bản đồ tổng thể dẫn đến các MOC Domain. LLM dùng file này để định hướng khi Query.

---

## 🛡️ Mandates (Quy tắc thép)

1.  **Read-only Raw**: Không bao giờ sửa file trong `00_Raw/`.
2.  **Log-first**: Mọi hành động Ingest/Lint phải được log.
3.  **Linkage-mandatory**: Note mới phải có ≥2 link đi/đến.
4.  **No Hallucination**: Chỉ tổng hợp từ Wiki và Raw hiện có, trích dẫn nguồn rõ ràng.
5.  **Hybrid PARA**: Luôn tuân thủ cấu trúc thư mục PARA v3.0.

---

## 🔗 Liên kết Agents/Hooks

- **`agents/vault-auditor`**: Runner chính thực thi Ingest, Query, Lint.
- **`hooks/vault-*.sh`**: Các công cụ hạ tầng để tính toán chỉ số sức khỏe và cleanup.
- **`scripts/hash_indexer.py`**: Script Python chạy ngầm, băm (Hash) các keywords/tags từ YAML frontmatter thành `hash_index.json` (Bảng Băm O(1)).
