# Triggers và Stored Procedures

## Khái niệm cổ điển
Thay vì dùng Database chỉ để lưu trữ, ta có thể viết code logic (gần giống lập trình) nhúng thẳng vào DB.
- **Trigger (Cò súng):** Đoạn code tự động kích hoạt khi có sự kiện (VD: Hễ ai chạy lệnh `DELETE` khách hàng thì tự động chép người đó sang bảng lưu vết).
- **Stored Procedure:** Các hàm logic phức tạp lưu sẵn dưới DB, ứng dụng chỉ việc gọi.

## Tư duy kiến trúc hiện đại (Modern Architecture)
- **Vấn đề:** Database (đặc biệt là MySQL/PostgreSQL) rất khó để nhân bản (Scale-out) để chịu tải. Nếu dồn quá nhiều Trigger/Logic vào DB, DB sẽ trở thành cổ chai (Bottleneck) gây sập hệ thống.
- **Giải pháp:** Cắt bỏ Trigger. Dời toàn bộ logic lên tầng ứng dụng (Java).
- **Ví dụ với Message Queue (Kafka):** Khi cần Xóa và Lưu vết, Java sẽ gửi lệnh Xóa xuống DB, sau đó tự Java ném một sự kiện (Event) vào Hàng đợi (Message Queue/Kafka) để một tiến trình chạy ngầm khác xử lý việc lưu vết. Database nhờ đó được giảm tải hoàn toàn.
