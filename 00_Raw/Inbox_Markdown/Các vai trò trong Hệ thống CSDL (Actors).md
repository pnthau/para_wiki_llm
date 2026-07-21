# Các vai trò trong Hệ thống CSDL (Actors)

1. **Database Administrators (DBA)**: Quản trị viên, lo việc phân quyền, bảo mật, và tài nguyên server (RAM/Ổ cứng).
2. **Database Designers**: Kiến trúc sư, thiết kế các bảng (Tables) và mối quan hệ (ER).
3. **End Users**: Người dùng cuối (nhân viên, khách hàng). Chỉ dùng ứng dụng, không cần biết về SQL.
4. **Software Engineers / Application Programmers**: Lập trình viên (chính là bạn). Người viết ra các ứng dụng (Java) biến thao tác của người dùng thành câu lệnh SQL gửi xuống Database.

## Các vai trò đứng sau hậu trường (Workers behind the scene)
Đây là những người không quan tâm đến "Dữ liệu" bên trong Database là gì, họ chỉ tập trung xây dựng và duy trì "Hệ thống" cho những người ở trên sử dụng.
1. **DBMS System Designers and Implementers**: Những "siêu nhân" viết ra phần mềm MySQL, Oracle, PostgreSQL... (Thường code bằng C/C++ để tạo ra cái lõi DBMS).
2. **Tool Developers**: Những người viết ra các phần mềm công cụ hỗ trợ (Ví dụ: DataGrip, DBeaver, DBeaver) giúp thao tác với DB dễ hơn.
3. **Operators and Maintenance Personnel (SysAdmin/DevOps)**: Kỹ sư vận hành, lo việc cắm cáp mạng, bảo trì máy chủ vật lý, cài đặt hệ điều hành để server chạy ổn định 24/7.
