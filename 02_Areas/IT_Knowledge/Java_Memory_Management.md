---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, memory, stack, heap, interview]
created: 2026-05-16
keywords: []
---

# ☕ Java Memory Management: Stack & Heap

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Stack Memory** | Lưu trữ các biến cục bộ (Local variables) và các lời gọi hàm (Method calls).<br>- Tự động giải phóng khi hàm kết thúc.<br>- Kích thước nhỏ, truy cập nhanh. |
| **Heap Memory** | Lưu trữ tất cả các đối tượng (Objects) và mảng (Arrays).<br>- Quản lý bởi Garbage Collector (GC).<br>- Kích thước lớn, tồn tại xuyên suốt ứng dụng nếu còn tham chiếu. |
| **Pass-by-value (Tham trị)** | Java **luôn luôn** truyền tham trị (Pass-by-value).<br>- Với Primitive: Truyền bản sao của giá trị.<br>- Với Object: Truyền bản sao của **địa chỉ vùng nhớ** (Reference). |
| **[[Java_Access_Modifiers\|Bao đóng (Encapsulation)]]** | Che giấu dữ liệu bên trong (`private`) và chỉ cho phép truy cập qua `public methods`. Đây là SRP ở cấp độ dữ liệu: Lớp tự chịu trách nhiệm bảo vệ trạng thái của nó. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Hiểu rõ sự khác biệt giữa Stack (vùng nhớ tạm) và Heap (vùng nhớ đối tượng) là chìa khóa để tránh lỗi `NullPointerException` và tối ưu hóa hiệu năng. Nhớ rằng Java chỉ truyền bản sao, nhưng với đối tượng, bản sao đó là địa chỉ nên ta vẫn có thể thay đổi thuộc tính của đối tượng gốc. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_JVM_Variables_DataTypes]]
- [[Java_Access_Modifiers]]
