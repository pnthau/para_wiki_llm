---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, gemini-cli, agent-skills]
created: 2026-05-11
keywords: []
---

# 🛠️ Gemini CLI Agent Skills Framework

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Cấu trúc Skill** | Gồm 4 phần chính: `SKILL.md` (chỉ dẫn), `scripts/` (mã thực thi), `assets/` (file tĩnh), `references/` (tài liệu chuyên sâu). |
| **SKILL.md** | Chứa `<instructions>` (mệnh lệnh chuyên gia) và `<available_resources>` (danh sách tài nguyên). |
| **Quy trình vận hành** | 1. **Kích hoạt**: `activate_skill(name)`.<br>2. **Tuân thủ**: Ưu tiên chỉ dẫn trong Skill hơn quy tắc chung.<br>3. **Thực thi**: Sử dụng script để xử lý tác vụ đặc thù. |
| **Ví dụ thực tế** | - `vault-curator`: Tự động hóa ingest.<br>- `n5-sensei`: Tra cứu ngữ pháp JLPT. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Agent Skills giúp Gemini CLI mở rộng khả năng từ một trợ lý chung thành một chuyên gia trong từng lĩnh vực cụ thể thông qua bộ chỉ dẫn và công cụ riêng biệt. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Gemini_CLI_Essentials]]
- [[vault-curator]]
- [[n5-sensei]]
