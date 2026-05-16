---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, oop, polymorphism, casting]
created: 2026-05-13
---

# ☕ Java Polymorphism & Casting (Đa hình)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **[[Java_OOP_Summary\|Tính đa hình]] là gì?** | Khả năng một hành động được thực hiện theo nhiều cách khác nhau tùy đối tượng. Thể hiện qua Overriding (Runtime) và Overloading (Compile-time). |
| **Overriding (Ghi đè)** | Lớp con định nghĩa lại phương thức lớp cha (cùng tên, tham số, kiểu trả về). Tăng tính linh hoạt và thay đổi hành vi ở lớp con. Xem thêm: [[Java_Inheritance\|Kế thừa]]. |
| **Overloading vs Overriding** | - **Overloading:** Cùng tên, khác tham số, cùng lớp.<br>- **Overriding:** Giống hệt tên & tham số, khác lớp (cha-con). |
| **Ép kiểu (Casting)** | Chuyển đổi giữa các kiểu dữ liệu.<br>- **Widening (Nhỏ -> Lớn):** Ngầm định, an toàn.<br>- **Narrowing (Lớn -> Nhỏ):** Tường minh, có thể mất dữ liệu. |
| **Ép kiểu đối tượng** | - **Upcasting:** Con -> Cha (ngầm định).<br>- **Downcasting:** Cha -> Con (tường minh, dùng `instanceof` để tránh lỗi). |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Đa hình giúp code linh hoạt và dễ mở rộng. Khi làm việc với đa hình và ép kiểu, cần đặc biệt lưu ý sự khác biệt giữa thời điểm biên dịch (Compile-time) và thực thi (Runtime) để tránh lỗi `ClassCastException`. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Inheritance]]
- [[Java_Abstract_Interface]]
- [[Java_OOP_Summary]]
