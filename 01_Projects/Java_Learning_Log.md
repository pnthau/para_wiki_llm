---
domain: "Project"
type: "log"
status: "active"
tags: [java, progress, roadmap, dsa, solid]
created: 2026-05-16
keywords: []
---
# Java Architect Reboot: Core, DSA & SOLID (Spiral)

**Summary**: Nhật ký lộ trình "Reboot" toàn diện kiến thức Java Core, Cấu trúc dữ liệu & Giải thuật (DSA) và các nguyên tắc thiết kế SOLID theo phương pháp Xoắn ốc (Spiral).

---

## 🚀 Trạng thái Lộ trình (Spiral Path)

| Vòng (Phase) | Trọng tâm Kiến thức | DSA Thực chiến | Trạng thái |
| :--- | :--- | :--- | :--- |
| **🌀 Vòng 1** | OOP, Memory, Encapsulation | `CustomArrayList` (SRP) | ✅ Hoàn thành |
| **🌀 Vòng 2** | Abstraction, Generics | `LinkedList` (OCP) | ✅ Hoàn thành |
| **🌀 Vòng 3** | SOLID (LSP, ISP, DIP) | `Stack` & `Queue` | ✅ Hoàn thành |
| **🌀 Vòng 4** | Big O, Recursion | Sorting, BST | ✅ Hoàn thành |
| **🌀 Vòng 5** | Database Design & SQL | Schema, Constraints | ⏳ Đang tiến hành |

---

## 📅 Nhật ký tiến độ

### Vòng 6 (2026-06-03) - "JVM & Memory Mastery"
- [x] **Memory Architecture**: Phân biệt Stack (Local variables) và Heap (Objects).
- [x] **Pass-by-value**: Hiểu bản chất Java truyền bản sao của tham chiếu (Remote Control analogy).
- [x] **String Pool & intern()**: Tối ưu hóa bộ nhớ cho các dữ liệu lặp lại lớn.
- [x] **Security Immutability**: Lý do String là bất biến để bảo vệ Class Loading và DB Connections.

### Vòng 5 (2026-05-27) - "Database Mastery & Persistence"
- [x] **Relational Foundation**: Nắm vững Primary Key, Foreign Key (1-n, n-n).
- [x] **Junction Table**: Thiết kế bảng trung gian cho quan hệ Nhiều - Nhiều.
- [x] **Data Integrity**: Làm chủ Constraints (NOT NULL, UNIQUE, CHECK).
- [x] **Query Mastery**: Thành thạo JOIN, Aggregations (COUNT, SUM), GROUP BY, HAVING.
- [x] **Advanced Architecture**: Xử lý Anomalies (LEFT JOIN IS NULL) và Tối ưu hóa hiệu năng (B-Tree Indexing).
- [⏳] **Phase 3**: Tích hợp JDBC/JPA vào Java Spring Boot.

### Vòng 4 (2026-05-16) - "Efficiency & Algorithms"
- [x] **Big O Notation**: Hiểu cách đánh giá hiệu năng thuật toán ($O(1), O(log n), O(n), O(n^2)$).
- [x] **Searching Strategy**: Phân tích sự vượt trội của Binary Search ($O(log n)$) so với Linear Search.
- [x] **Data Integrity**: Hiểu tại sao sắp xếp là điều kiện tiên quyết cho các thuật toán chia để trị.

---
## 🏆 KẾT QUẢ REBOOT: "THE ARCHITECT AWAKENING"
Chúng ta đã đi từ những khái niệm cơ bản nhất về bộ nhớ (Stack/Heap) cho đến việc xây dựng các cấu trúc dữ liệu phức tạp tuân thủ nghiêm ngặt 5 nguyên tắc SOLID. 
- **Core**: Nắm vững Memory Management & Generics.
- **SOLID**: Tư duy Composition over Inheritance, OCP, LSP.
- **DSA**: Tự build ArrayList, LinkedList, Stack, Queue và hiểu Complexity.

---
## 💡 Spiral Insight
- "Đừng chỉ dùng `ArrayList`, hãy hiểu tại sao nó tồn tại." - Việc tự tay build lại các công cụ cơ bản giúp ta hiểu sâu về tối ưu hóa hiệu năng và bộ nhớ.
- Kết hợp kỹ thuật [[Body_Resonance_7Hz]] để duy trì trạng thái tập trung sâu khi phân tích cấu trúc dữ liệu phức tạp.

---
## Related
- [[MOC_IT_Knowledge]]
- [[Java_Composition_SOLID]]
- [[Java_DSA_LinkedList_OCP]]
