---
domain: "System"
type: "instruction"
status: "active"
tags: [ingest, wiki, automation, expansion]
created: 2026-05-28
nexus_version: 6.0
---

# 🛰️ NEXUS WIKI-EXPANSION & INGEST PROTOCOL v6.0

> **Identity**: A proactive knowledge-discovery engine designed to eliminate "Orphan Knowledge" and automate the growth of the Nexus Wiki.

---

## 🔍 1. PROACTIVE CONCEPT EXTRACTION (Self-Expansion)
Khi Ingest một file mới, Agent không chỉ tóm tắt mà phải thực hiện:
- **Keyword Grep**: Tìm kiếm các từ khóa chính (Terms) trong toàn bộ Vault.
- **Theory Mapping**: Nếu file mới nhắc đến một "Lý thuyết" (Ví dụ: SOLID, NASA Go/No-go), Agent BẮT BUỘC phải kiểm tra xem có Note tương ứng chưa.
    - **Nếu chưa**: Tạo một "Expansion Node" (Draft) để yêu cầu nghiên cứu sau.
    - **Nếu rồi**: Tạo Backlink `[[Internal_Link]]` ngay lập tức.

## 🕸️ 2. ORPHAN KNOWLEDGE RECOVERY (The Reclaimer)
Cơ chế phát hiện các kiến thức bị "ngó lơ":
- **Connectivity Check**: Định kỳ quét các file có ít hơn 2 liên kết (Inbound/Outbound).
- **Auto-MOC Healing**: Tự động tìm kiếm vị trí phù hợp cho các file "mồ côi" trong các MOC hiện có.
- **Contextual Resurrection**: Khi John hỏi về một chủ đề, Agent phải dùng `grep_search` để "đào" lại các file cũ trong `03_Resources` hoặc `00_Raw` chưa được link tới.

## 📥 3. UPGRADED INGEST WORKFLOW
1.  **Absorb**: Đọc Raw.
2.  **Cross-Reference**: Chạy `grep_search` tìm các khái niệm liên quan đang có trong Wiki.
3.  **Expansion**: Tạo các link `[[...]]` đến các Note tiềm năng (ngay cả khi chưa tồn tại - tạo Placeholder).
4.  **MOC Linkage**: Cập nhật MOC Domain và MOC_Index nếu cần.
5.  **Log**: Ghi lại các "Kiến thức mới được tái khám phá" vào `log.md`.

---

## 🛡️ MANDATES
- **No Orphan Left Behind**: Mọi Note mới phải được gắn vào ít nhất 1 MOC và 1 Note liên quan.
- **Theory-First**: Ưu tiên liên kết các lý thuyết nền tảng (IT, Japanese, Strategy).
- **Wiki-Deep-Search**: Luôn tìm kiếm từ khóa trong Vault trước khi đưa ra câu trả lời "Tôi không biết".

---
*Back to [[GEMINI.md]] | [[MOC_Index]]*
