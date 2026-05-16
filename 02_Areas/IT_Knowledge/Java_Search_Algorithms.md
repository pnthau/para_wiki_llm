---
domain: "Java"
type: "concept"
status: "active"
tags: [it, java, algorithms, search]
created: 2026-05-13
---

# ☕ Java Search Algorithms

| 💡 Từ khóa / Câu hỏi (Cue) | 📝 Nội dung ghi chú (Notes) |
| :--- | :--- |
| **Tìm kiếm Tuyến tính** | Duyệt từng phần tử từ đầu đến cuối. <br>- **Độ phức tạp:** O(n).<br>- **Dữ liệu:** Không cần sắp xếp. |
| **Tìm kiếm Nhị phân** | Chia để trị trên tập dữ liệu **đã sắp xếp**. So sánh phần tử giữa để thu hẹp phạm vi.<br>- **Độ phức tạp:** O(log n).<br>- **Dữ liệu:** Bắt buộc đã sắp xếp. Xem [[Java_Arrays\|Arrays]]. |
| **Hashing (Băm)** | Dùng hàm băm để truy cập trực tiếp qua chỉ số.<br>- **Độ phức tạp:** Trung bình O(1).<br>- **Ưu điểm:** Cực nhanh cho dữ liệu lớn. Xem [[Java_Collections_Framework\|Collections]]. |
| **Tree Search** | Dữ liệu lưu trong cây (như BST).<br>- **Độ phức tạp:** O(log n) nếu cây cân bằng. |

<br>

| 🎯 Tổng kết (Summary) |
| :--- |
| Tùy vào cấu trúc và trạng thái dữ liệu (đã sắp xếp hay chưa) để chọn thuật toán tối ưu. Tìm kiếm nhị phân và Hashing là hai lựa chọn hàng đầu cho hiệu năng cao với tập dữ liệu lớn. |

---
**Related:**
- [[MOC_IT_Knowledge]]
- [[Java_Arrays]]
- [[Java_Collections_Framework]]
