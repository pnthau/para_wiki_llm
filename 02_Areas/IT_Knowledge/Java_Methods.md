---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, methods, oop]
created: 2026-05-13
keywords: []
---

# ☕ Java Methods (Phương thức)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Method là gì?** | Một khối lệnh thực hiện nhiệm vụ cụ thể. Giúp tái sử dụng code và tuân thủ nguyên tắc Single Responsibility. |
| **Cấu pháp & Cách gọi** | `[Modifier] [ReturnType] [Name]([Params])`.<br>- **Non-static**: Gọi qua Object.<br>- **Static**: Gọi qua tên Class. |
| **Overloading** | Khả năng tạo nhiều phương thức cùng tên nhưng khác tham số (số lượng, kiểu dữ liệu, thứ tự). |
| **Bộ nhớ Stack & Heap** | - **Stack**: Lưu biến primitive và tham chiếu đối tượng.<br>- **Heap**: Lưu thực thể đối tượng thực tế và mảng. |
| **Tham trị vs Tham chiếu** | - **Tham trị**: Truyền bản sao giá trị (kiểu primitive).<br>- **Tham chiếu**: Truyền bản sao địa chỉ (kiểu Object), ảnh hưởng đến dữ liệu gốc. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Hiểu rõ cách hoạt động của Method và quản lý bộ nhớ (Stack/Heap) là chìa khóa để viết code Java hiệu quả và tránh các lỗi về tham chiếu. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Classes_Objects]]
- [[Java_JVM_Variables_DataTypes]]
