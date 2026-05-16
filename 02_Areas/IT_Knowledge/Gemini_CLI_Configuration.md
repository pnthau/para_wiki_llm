---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, gemini-cli, configuration]
created: 2026-05-11
---

# 🛠️ Gemini CLI Configuration & Project Rules

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes)                                                                         |
| :------------------------- | :-------------------------------------------------------------------------------------------------- |
| **Tệp GEMINI.md**          | "Bộ luật" của dự án, được commit vào Git. Quy định Framework, Naming conventions và Architecture.   |
| **Phân cấp GEMINI.md**     | - **Root**: Quy chuẩn toàn dự án.<br>- **Subdirectory**: Chỉ dẫn riêng cho module/thư mục cụ thể.   |
| **Quyền ưu tiên**          | Chỉ dẫn trong `GEMINI.md` có quyền cao nhất, ghi đè mọi thiết lập mặc định của AI.                  |
| **Tệp .geminiignore**      | Loại trừ file/thư mục khỏi ngữ cảnh AI (node_modules, .env, .git...) để tiết kiệm Token và bảo mật. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Hệ thống cấu hình của Gemini CLI đảm bảo AI luôn tuân thủ nghiêm ngặt các tiêu chuẩn của dự án và tối ưu hóa tài nguyên thông qua việc loại trừ các dữ liệu không cần thiết. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Gemini_CLI_Memory_System]]
- [[GEMINI.md]]
