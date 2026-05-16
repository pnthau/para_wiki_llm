---
domain: "IT"
type: "concept"
status: "active"
tags: [it, tools, gemini-cli, optimization]
created: 2026-05-11
keywords: []
---

# 🛠️ Gemini CLI Context Efficiency (Binh pháp Tiết kiệm)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Tìm trước, Đọc sau** | Không đọc toàn bộ file. Dùng `grep_search` xác định vị trí, sau đó `read_file` theo dòng (`start_line`, `end_line`). |
| **Tính song song** | Thực hiện nhiều lệnh trong một lượt (turn) để giảm số lượt hội thoại và tiết kiệm token. |
| **Surgical Edits** | Sửa đổi chuẩn xác bằng `replace`. Cung cấp ngữ cảnh `old_string` vừa đủ nhưng duy nhất để tránh lỗi. |
| **Tránh dư thừa** | Dùng `/reset` khi ngữ cảnh quá dài. Giao tiếp ngắn gọn, tập trung vào kết quả kỹ thuật (No Chitchat). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Tối ưu hóa ngữ cảnh là chìa khóa để AI hoạt động thông minh và tiết kiệm chi phí. Luôn ưu tiên các thao tác tìm kiếm chính xác và thực thi song song. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[GEMINI.md]]
- [[Gemini_CLI_Core_Features]]
