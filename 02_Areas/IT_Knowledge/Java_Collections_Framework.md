---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, collections, jcf]
created: 2026-05-13
keywords: []
---

# ☕ Java Collections Framework (JCF)

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **JCF là gì?** | Hệ thống các Interface và Class cung cấp cấu trúc dữ liệu và thuật toán tối ưu. Giúp code gọn gàng, hiệu suất cao. |
| **Các Interface chính** | - **Collection**: Gốc (cha của List, Set, Queue).<br>- **Map**: Cặp key-value (không kế thừa Collection). |
| **List vs Set** | - **List**: Có thứ tự, cho phép trùng lặp (ArrayList, LinkedList).<br>- **Set**: Không thứ tự (thường), không trùng lặp (HashSet, TreeSet). |
| **ArrayList vs LinkedList** | - **ArrayList**: Mảng động, truy cập nhanh (O(1)), thêm/xóa chậm ở giữa.<br>- **LinkedList**: Danh sách liên kết kép, thêm/xóa nhanh (O(1)), truy cập chậm (O(n)). |
| **Map & Implementations** | - **HashMap**: Nhanh, không thứ tự.<br>- **TreeMap**: Sắp xếp theo key.<br>- **LinkedHashMap**: Giữ thứ tự chèn. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| JCF là công cụ không thể thiếu. Chọn đúng cấu trúc dữ liệu (List cho danh sách, Set cho tính duy nhất, Map cho tra cứu) giúp tối ưu hóa hiệu năng chương trình. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Arrays]]
- [[Java_Generics_Stack_Queue]]
