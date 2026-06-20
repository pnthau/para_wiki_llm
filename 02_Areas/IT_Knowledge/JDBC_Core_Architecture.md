---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [java, jdbc, database, architecture, security, interview-prep]
created: 2026-06-20
updated: 2026-06-20
---

# Java JDBC: Kiến trúc lõi & Quy trình thực chiến 4 bước

Bản ghi nhớ kiến thức JDBC API từ góc nhìn Kiến trúc Phần mềm và Thực chiến Doanh nghiệp.

## 1. Bản chất Kiến trúc JDBC
JDBC (Java Database Connectivity) được vận hành bởi 3 trụ cột kỹ thuật:

- **JDBC API (Bộ quy chuẩn):** Là các Interface (vd: `java.sql.Connection`) do Java định nghĩa. Chỉ chứa vỏ (khai báo hàm), không chứa code thực thi. Nhằm mục đích chuẩn hóa cách Java nói chuyện với DB.
- **Driver (Phiên dịch viên):** Là file thư viện `.jar` (vd: `mysql-connector-java.jar` hoặc `postgresql.jar`). Do chính hãng Database tự viết code Implements lại các Interface của Java API. **Lỗi `No suitable driver found`** xảy ra khi dự án quên import thư viện này.
- **DriverManager (Trung tâm điều phối):** Máy quét tiện ích của Java. Tự động tìm kiếm file Driver `.jar` phù hợp với đường dẫn URL cung cấp để khởi tạo ra đối tượng `Connection`.

## 2. Quy trình 4 bước chuẩn mực khi truy vấn DB
Khi code thực tế, vòng đời truy vấn bắt buộc đi qua 4 bước:

1. **`Connection` (Mở đường hầm mạng):**
   Sử dụng `DriverManager.getConnection(...)` để thiết lập kết nối TCP/IP giữa Java Server và Database Server.

2. **`PreparedStatement` (Gửi lệnh SQL an toàn):**
   - Lấy `PreparedStatement` từ `Connection` để nạp câu lệnh SQL (vd: `SELECT * FROM users WHERE id = ?`).
   - 🚨 **CẢNH BÁO BẢO MẬT:** Tuyệt đối KHÔNG sử dụng `Statement` thông thường để nối chuỗi vì sẽ gây ra lỗ hổng **SQL Injection** chết người. Bắt buộc dùng `PreparedStatement` kết hợp với dấu `?` để Java tự động vô hiệu hóa mã độc do Hacker nhập vào.

3. **`ResultSet` (Hứng & Đọc dữ liệu):**
   - Kết quả Database trả về được chứa trong `ResultSet` (như một mảng 2 chiều).
   - Bản chất nó là một con trỏ (Iterator). Bắt buộc phải dùng vòng lặp `while(rs.next())` để đẩy con trỏ xuống từng dòng, sau đó dùng `getInt()`, `getString()` để lấy data ra.

4. **`Close` (Giải phóng bộ nhớ):**
   - Chạy xong BẮT BUỘC phải gọi lệnh `.close()` theo thứ tự ngược lại: `ResultSet` -> `PreparedStatement` -> `Connection`.
   - Nếu quên đóng sẽ gây ra hiện tượng **Memory Leak (Tràn RAM)** làm sập Server. Nên sử dụng cú pháp `try-with-resources` của Java để hệ thống tự động đóng.

## 3. ResultSet Nâng cao (Câu hỏi Phỏng vấn System Design)
**A. Kiểu cuộn (Scroll Types):**
- `TYPE_FORWARD_ONLY` (Mặc định): Chỉ được dùng `rs.next()` để tiến. Tốc độ cực nhanh, tốn ít RAM nhất. Bắt buộc dùng trong Web để phân trang và đọc list dài.
- `TYPE_SCROLL_INSENSITIVE` / `SENSITIVE`: Có thể tiến lùi (`previous()`), tốn bộ nhớ. Ít dùng thực tế.

**B. Khả năng cập nhật (Concurrency):**
- `CONCUR_READ_ONLY` (Mặc định): Chỉ đọc dữ liệu ra Object, sau đó đóng kết nối ngay lập tức để tiết kiệm tài nguyên. Cần sửa thì dùng `UPDATE` riêng. Đây là tiêu chuẩn vàng của kiến trúc Web.
- `CONCUR_UPDATABLE`: Sửa trực tiếp trên `ResultSet`. **Chống chỉ định dùng trong Web**. Vì để dùng nó, ta phải "giam giữ" `Connection` trong thời gian dài (không trả về Connection Pool), dẫn đến hàng chờ Request bị nghẽn (nghẽn xe Grab), gây sập hệ thống (Connection Pool Exhaustion).
