---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, generics, stack, queue]
created: 2026-05-13
keywords: []
---

# Java Generics, Stack & Queue

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Generic là gì?** | Cơ chế cho phép định nghĩa class, interface, method với kiểu dữ liệu chưa xác định. Kiểu cụ thể được truyền vào khi sử dụng (ví dụ: `List<String>`). |
| **Ưu điểm** | - Tái sử dụng code, giảm trùng lặp.<br>- An toàn kiểu dữ liệu (Type safety).<br>- Tránh ép kiểu thủ công khi lấy dữ liệu. |
| **Nhược điểm & Hạn chế** | - Không hỗ trợ kiểu nguyên thủy (phải dùng Wrapper class).<br>- Không thể tạo trực tiếp đối tượng (`new T()`).<br>- Không thể tạo biến `static` kiểu `T`. |
| **Stack (Ngăn xếp)** | Hoạt động theo nguyên tắc **FILO** (First In Last Out). Các phương thức chính: `push()`, `pop()`, `peek()`, `isEmpty()`. |
| **Queue (Hàng đợi)** | Hoạt động theo nguyên tắc **FIFO** (First In First Out). Các phương thức chính: `offer()`/`add()`, `poll()`, `peek()`. |
| **Các lớp triển khai Queue** | `LinkedList`, `PriorityQueue`, `ArrayDeque` (hiệu năng cao), `ConcurrentLinkedQueue`. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Generic tăng tính linh hoạt và an toàn cho code Java. Stack (FILO) và Queue (FIFO) là hai cấu trúc dữ liệu cơ bản được sử dụng rộng rãi, trong đó Queue có nhiều biến thể triển khai tùy mục đích (ưu tiên, hai đầu, đa luồng). |
