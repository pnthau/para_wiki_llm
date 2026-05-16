---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, static, memory]
created: 2026-05-13
keywords: []
---

# ☕ Java Static Keyword

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Từ khóa [[Java_Static_Keyword\|static]]** | Dùng để khai báo thành phần thuộc về **Class**, không thuộc về instance cụ thể. Dùng chung cho tất cả đối tượng. |
| **Biến static** | Lưu trong vùng nhớ **Metaspace** (Java 8+). Khởi tạo một lần duy nhất khi class được nạp. Xem thêm: [[Java_JVM_Variables_DataTypes\|Vùng nhớ JVM]]. |
| **Phương thức static** | Có thể gọi trực tiếp qua tên lớp: `ClassName.methodName()`. Không thể truy cập các thành phần non-static trực tiếp. |
| **Ràng buộc static** | - Không dùng được `this` hoặc `super`.<br>- Chỉ gọi được các thành phần static khác trực tiếp. |
| **Quản lý vùng nhớ** | - **Local variable:** Stack.<br>- **Instance variable:** Heap.<br>- **Static variable:** Metaspace. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| `static` giúp tiết kiệm bộ nhớ cho các dữ liệu dùng chung và cung cấp các phương thức tiện ích (Utility methods). Tuy nhiên, cần cẩn trọng vì nó có thể gây khó khăn cho việc Unit Test và vi phạm tính đóng gói nếu lạm dụng. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_JVM_Variables_DataTypes]]
- [[Java_Classes_Objects]]
