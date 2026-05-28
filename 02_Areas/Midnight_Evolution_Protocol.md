---
domain: "System"
type: "instruction"
status: "active"
tags: [automation, self-evolution, maintenance, security]
created: 2026-05-28
nexus_version: 6.0
---

# 🌙 NEXUS MIDNIGHT EVOLUTION PROTOCOL v6.0

> **Identity**: An autonomous system-upgrade cycle designed to execute during low-activity hours (11 PM) to maximize resource usage for self-study, security, and optimization.

---

## 🕒 1. THE MIDNIGHT CYCLE (Trigger: 23:00)
Khi phát hiện thời gian hệ thống tiến gần hoặc vượt quá 11 PM, Agent BẮT BUỘC kích hoạt chuỗi "Tiến hóa tự thân" (Self-Evolution) sử dụng toàn bộ quota còn lại.

### Phase A: System Sanitization (Dọn dẹp)
- **Vault Diet**: Chạy script `vault-health.sh` (nếu có) hoặc thủ công tìm kiếm các file binary lớn, file tạm, hoặc note rác để đề xuất lưu trữ/xóa.
- **Link Integrity**: Sửa các link hỏng (broken links) và cập nhật MOCs bị lỗi thời.

### Phase B: Security & Protection (Bảo mật)
- **Security Audit**: Gọi `security-reviewer` để quét các file cấu hình, `.env`, và code mới để đảm bảo không có lỗ hổng hoặc secret bị lộ.
- **Protocol Hardening**: Tự cập nhật các file `GEMINI.md` nếu phát hiện các mô thức làm việc an toàn hơn (Best Practices).

### Phase C: Autonomous Learning (Tự học)
- **Raw Deep-Dive**: Tự động chọn 1 file trong `00_Raw` chưa được Ingest để nghiên cứu và chuyển đổi sang Wiki.
- **Meta-Learning**: Nghiên cứu các file hướng dẫn mới nhất trong `.gemini/` để nâng cấp khả năng sử dụng công cụ của chính mình.

### Phase D: Knowledge Consolidation (Hợp nhất)
- **Orphan Recovery**: Thực thi quy trình từ [[Wiki_Expansion_Protocol]] để tái kết nối các kiến thức bị bỏ rơi.
- **Final Sync**: `git add .`, `git commit -m "Nexus Midnight Evolution: [Date]"`, và `git push`.

---

## 🛡️ MANDATES
- **Resource Exhaustion**: Tận dụng tối đa Context và Turn quota còn lại trong ngày cho các tác vụ này.
- **Transparency**: Ghi lại toàn bộ quá trình tiến hóa vào một file nhật ký riêng: `log_evolution.md`.
- **John's Priority**: Nếu John xuất hiện và đưa ra yêu cầu mới, ngay lập tức tạm dừng Evolution để phục vụ John.

---
*Back to [[GEMINI.md]] | [[Wiki_Expansion_Protocol]]*
