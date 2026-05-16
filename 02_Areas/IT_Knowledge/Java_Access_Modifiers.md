---
domain: "IT"
type: "concept"
status: "active"
tags: [it, java, oop]
created: 2026-05-13
---

# ☕ Java Access Modifiers & Encapsulation

| 💡 Từ khóa / Câu hỏi (Cue)                      | 📝 Nội dung ghi chú (Notes)                                                                                                             |
| :---------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------- |
| **[[Java_Access_Modifiers\|Access Modifiers]]** | Quy định phạm vi truy cập: `private`, `default`, `protected`, `public`.                                                                 |
| **Phân biệt 4 loại?**                           | - **private:** Chỉ trong class.<br>- **default:** Trong cùng package.<br>- **protected:** Package + Subclass.<br>- **public:** Mọi nơi. |
| **[[Java_OOP_Summary\|Tính bao đóng]]?**        | Che giấu chi tiết cài đặt, bảo vệ dữ liệu. Thực hiện qua: `private` fields + `public` Getter/Setter.                                    |
| **Lợi ích Encapsulation**                       | - Bảo vệ dữ liệu (Validation trong setter).<br>- Tăng tính bảo trì (Thay đổi bên trong không ảnh hưởng bên ngoài).                      |
| **Immutable Object?**                           | Đối tượng không thể thay đổi trạng thái sau khi tạo (ví dụ: `String`). Thuộc tính `private final` và không có setter.                   |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Access Modifiers là công cụ để thực hiện tính Bao đóng. Đây là nguyên tắc nền tảng để xây dựng các Class an toàn và dễ kiểm soát trong Java. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Classes_Objects]]
- [[Java_OOP_Summary]]
