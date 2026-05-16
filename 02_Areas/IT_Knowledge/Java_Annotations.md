---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, intermediate, annotations]
created: 2026-05-16
keywords: []
---

# ☕ Java Annotations (Ghi chú mã nguồn)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Annotation là gì?** | Một dạng metadata cung cấp dữ liệu về chương trình nhưng không thuộc chính chương trình đó. Bắt đầu bằng ký tự `@`. |
| **Công dụng chính** | - Thông tin cho Compiler (ví dụ: `@Override`).<br>- Xử lý tại Compile-time (Sinh code tự động).<br>- Xử lý tại Runtime (Reflection - được Spring dùng rất nhiều). |
| **Các Annotation phổ biến** | - `@Override`: Đánh dấu phương thức ghi đè.<br>- `@Deprecated`: Cảnh báo phương thức lỗi thời.<br>- `@SuppressWarnings`: Tắt các cảnh báo từ compiler. |
| **Meta-Annotations** | Annotations dùng để định nghĩa Annotation khác:<br>- `@Target`: Phạm vi sử dụng (Method, Class...).<br>- `@Retention`: Tồn tại đến khi nào (Source, Class, Runtime). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Annotation giúp code gọn gàng hơn bằng cách thay thế các cấu hình XML phức tạp. Đây là "xương sống" của các framework hiện đại như Spring và Hibernate. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Learning_Log]]
- [[Java_Maven_Lombok]]
