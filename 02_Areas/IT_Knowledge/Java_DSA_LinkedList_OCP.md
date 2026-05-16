---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, dsa, linkedlist, ocp, generics]
created: 2026-05-16
keywords: []
---

# 🌀 DSA Thực chiến: LinkedList & Nguyên tắc OCP

| 💡 Khái niệm / Cấu trúc | 📝 Chi tiết kỹ thuật (Notes) |
| :--- | :--- |
| **Lớp Node<T>** | Gồm `T data` (Dữ liệu linh hoạt) và `Node<T> next` (Tham chiếu đệ quy). |
| **Truy cập (Access)** | **Tuần tự (Sequential)**: Phải đi từ `head` và nhảy qua từng Node. Độ phức tạp: **O(n)**. |
| **Generics <T>** | Đảm bảo **Type Safety**. Giúp một cấu trúc dữ liệu dùng được cho mọi Object mà không cần ép kiểu (Casting). |
| **Nguyên tắc OCP** | Thiết kế Interface `List<T>` chung. `ArrayList` và `LinkedList` cùng triển khai (implements) Interface này. Khi cần đổi loại danh sách, code bên ngoài không cần thay đổi. |

<br>

| 🎯 So sánh Hiệu năng (Performance Trade-off) |
| :--- |
| - **ArrayList**: Truy cập nhanh $O(1)$, nhưng thêm/xóa ở đầu/giữa chậm vì phải dời mảng $O(n)$.<br>- **LinkedList**: Truy cập chậm $O(n)$, nhưng thêm/xóa ở đầu/giữa cực nhanh $O(1)$ (nếu đã có tham chiếu) vì chỉ cần đổi "mũi tên". |

---
**Related:**
- [[Java_Generics_Stack_Queue]]
- [[Java_Abstract_Interface]]
- [[Java_Design_Principles]]
