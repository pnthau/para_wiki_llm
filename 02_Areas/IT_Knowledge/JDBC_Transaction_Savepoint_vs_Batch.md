---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [java, jdbc, database, architecture, transaction, system-design]
created: 2026-06-20
updated: 2026-06-20
---

# Java JDBC: Transaction (ACID) và Kiến trúc Đánh đổi (Batch vs Savepoint)

Bản ghi nhớ cực kỳ quan trọng về quản lý Giao dịch (Transaction) và Tư duy Kiến trúc khi xử lý dữ liệu lớn.

## 1. Bản chất Transaction & Nguyên lý Atomicity (All or Nothing)
- **Transaction:** Là một bong bóng chứa nhiều lệnh SQL. Tất cả các lệnh trong bong bóng phải thành công, hoặc nếu có 1 lệnh thất bại thì toàn bộ phải bị hủy (thuộc tính **Atomicity** trong hệ thống ACID).
- **Cơ chế hoạt động trong JDBC:**
  - Java mặc định có thói quen "chạy lệnh nào chốt sổ lệnh đó" (`AutoCommit = true`).
  - Để gom nhiều lệnh vào 1 Transaction, BẮT BUỘC phải cấm Java tự động chốt sổ bằng lệnh: `conn.setAutoCommit(false)`.
  - Nếu mọi lệnh chạy trót lọt: Gọi `conn.commit()` để lưu cứng xuống ổ đĩa Database.
  - Nếu có Exception văng ra: Gọi `conn.rollback()` trong khối `catch` để tua ngược quá khứ, biến mọi lệnh đã chạy trước đó thành vô hiệu.

## 2. Kỹ thuật Savepoint (Điểm lưu Game)
- Thay vì `rollback()` hủy toàn bộ Giao dịch, ta có thể đặt các điểm `Savepoint` (giống như Checkpoint khi chơi game).
- **Cú pháp:** `Savepoint sp1 = conn.setSavepoint("Save_1");`
- Nếu xảy ra lỗi ở bước sau, chỉ cần gọi `conn.rollback(sp1)` để hệ thống tua về đúng cái điểm `Save_1`, giữ nguyên được các thành quả trước đó mà không bắt khách hàng làm lại từ đầu.

## 3. Kiến trúc Đánh đổi: Savepoint vs executeBatch() (Câu hỏi System Design)
Đây là câu hỏi phân loại trình độ Lập trình viên: **Có thể dùng Savepoint bên trong executeBatch được không?**
=> **KHÔNG THỂ.** `executeBatch` là một chiếc xe tải gom lệnh chạy chung 1 chuyến, không thể dừng giữa đường để đặt Savepoint cho từng dòng lệnh được.

Từ đó sinh ra **Sự đánh đổi trong Kiến trúc (Architectural Trade-off)**:

| Tiêu chí | executeBatch() (Xe tải chở hàng) | executeUpdate() + Savepoint (Xe máy chở từng món) |
| :--- | :--- | :--- |
| **Mục tiêu ưu tiên** | **TỐC ĐỘ BÁ ĐẠO**, dồn ép sức mạnh mạng. | **AN TOÀN TỈ MỈ**, cứu vớt dữ liệu tối đa. |
| **Kiểm soát rủi ro** | Văng lỗi 1 dòng -> Hủy toàn bộ (Lật cả xe tải). | Văng lỗi 1 dòng -> Cứu được các dòng kia (Load lại savepoint). |
| **Ứng dụng thực tế** | Import 10.000 dòng từ file Excel. Số lượng quá lớn nên bắt buộc hy sinh tính tỉ mỉ để lấy tốc độ. | Thanh toán Giỏ hàng Shopee (chỉ 3-5 món). Số lượng ít nên tốc độ mạng không đáng kể, ưu tiên chốt từng món. |

**Kết luận:** Không có công nghệ nào là hoàn hảo. Một Kỹ sư Hệ thống giỏi là người biết "Đánh đổi" (Trade-off) đúng công cụ cho đúng bài toán kinh doanh.
