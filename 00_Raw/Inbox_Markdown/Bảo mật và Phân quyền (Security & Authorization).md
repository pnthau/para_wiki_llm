# Bảo mật và Phân quyền (Security & Authorization)

Bảo mật được thiết lập ở 2 tầng tạo thành "hệ thống phòng thủ đa lớp".

## Tầng 1: Tầng Ứng dụng (Java - Spring Security)
- **Kiến trúc Web hiện đại:** Hàng triệu User trên Web KHÔNG kết nối thẳng vào Database. Giao diện Web (Front-end) kết nối tới API của Java (Back-end).
- Java sẽ lưu danh sách người dùng và Roles (Vai trò) vào các bảng dữ liệu.
- Công cụ như **Spring Security** đóng vai trò là "Bảo vệ cổng chính". Nó kiểm tra xem ai đang đăng nhập, và nếu User (VD: Lễ tân) cố gắng bấm nút "Xem doanh thu" của Giám đốc, Java sẽ lập tức chặn lại bằng lỗi **403 Forbidden** trước khi lệnh chạm tới Database.

## Tầng 2: Tầng Đáy (SQL - DCL)
- Hệ thống Java kết nối xuống Database bằng một **Tài khoản đại diện (Service Account)** duy nhất (VD: `furama_app_user`), được phân quyền đọc/ghi toàn bộ các bảng cần thiết. Database hoàn toàn không biết Lễ tân hay Giám đốc đang dùng app, nó chỉ làm việc với ông Java.
- Tuy nhiên, DBA vẫn phải dùng lệnh SQL (`GRANT`, `REVOKE`) để tạo các tài khoản riêng biệt cho chính nội bộ phòng IT (DBA, Data Analyst) nhằm tránh họ táy máy sửa sai dữ liệu Production.
- SQL Security giống như "Bảo vệ hầm két sắt", là chốt chặn cuối cùng nếu hacker xuyên thủng được tầng Java.
