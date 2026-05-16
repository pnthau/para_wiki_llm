---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, jvm, basics]
created: 2026-05-13
---

# ☕ Java JVM, Variables & Data Types

| 💡 Từ khóa / Câu hỏi (Cue)     | 📝 Nội dung ghi chú (Notes)                                                                                                                                                   |
| :----------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **[[Java_JVM_Variables_DataTypes\|JVM]] (Java Virtual Machine)** | Đọc byte code (.class) và hướng dẫn hệ điều hành thực hiện. Giúp Java đạt tính **WORA** (Write Once Run Anywhere).                                                            |
| **JRE vs JDK**                 | JRE = JVM + Thư viện (Lib). <br>JDK = JRE + Công cụ phát triển (Compiler, Debugger).                                                                                          |
| **Biến (Variable)**            | Đại diện cho vùng nhớ để lưu trữ dữ liệu. <br>- **Local:** trong phương thức (không giá trị mặc định).<br>- **Global/Instance:** trong class (có giá trị mặc định).           |
| **[[Java_Variables_DataTypes\|Kiểu dữ liệu (Primitive)]]**   | 4 nhóm chính:<br>1. Số nguyên: `byte`, `short`, `int`, `long`.<br>2. Số thực: `float`, `double`.<br>3. Ký tự: `char` (2 bytes, Unicode).<br>4. Logic: `boolean` (true/false). |
| **Conversion & Casting**       | - **Conversion:** Nhỏ sang lớn (ngầm định).<br>- **[[Java_Polymorphism_Casting\|Casting]]:** Lớn sang nhỏ (phải tường minh, có thể mất dữ liệu).                                                             |
| **Switch-case mới**            | Sử dụng `->` thay cho `:` (không cần `break`) hoặc dùng `yield` để trả về giá trị.                                                                                            |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| JVM là trái tim của Java, đảm bảo tính đa nền tảng. Hiểu rõ kiểu dữ liệu, cơ chế ép kiểu và quản lý biến là nền tảng cốt lõi để viết mã hiệu quả và tránh lỗi bộ nhớ. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Variables_DataTypes]]
- [[Java_Polymorphism_Casting]]
