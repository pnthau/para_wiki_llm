# Bộ câu hỏi ôn tập phỏng vấn CSDL (Chương 1)

*(Được đúc kết từ Review Questions của sách Fundamentals of Database Systems - Dành riêng cho ôn thi phỏng vấn Java Backend)*

## Nhóm 1: Câu hỏi Định nghĩa (Terminology)
**1. Phân biệt Data, Database và DBMS?**
- **Data (Dữ liệu):** Dữ liệu thô, chưa có ngữ cảnh.
- **Database (CSDL):** Nơi lưu trữ Data có liên quan với nhau và được sắp xếp có logic.
- **DBMS (Hệ quản trị CSDL):** Phần mềm (Software) dùng để tạo, thao tác và quản lý Database (VD: MySQL, Oracle).

**2. DBA (Database Administrator) làm công việc gì?**
- Là người quản lý tài nguyên, bảo mật, phân quyền, sao lưu và nâng cấp hệ thống Database.

**3. Sự độc lập dữ liệu (Program-data independence) là gì?**
- Là sự tách biệt giữa ứng dụng và dữ liệu. Việc thay đổi cấu trúc vật lý của Database (thêm cột, đổi ổ cứng) KHÔNG yêu cầu phải viết lại code của Ứng dụng (Java).

**4. Meta-data là gì?**
- Siêu dữ liệu (Dữ liệu mô tả về dữ liệu). Là định nghĩa cấu trúc của các bảng và cột (Ví dụ: Cột `Tuoi` có kiểu `Integer`).

## Nhóm 2: Câu hỏi Tư duy Hệ thống (System Thinking)
**5. Hành động thao tác dữ liệu (Manipulating) thực chất là làm gì?**
- Là thực hiện các thao tác **CRUD** (Create - Thêm, Read - Đọc, Update - Sửa, Delete - Xóa).

**6. Người dùng phổ thông (Thu ngân siêu thị) có cần biết SQL không? Họ thao tác với DB bằng cách nào?**
- Không cần biết SQL. Họ giao tiếp qua các **Giao dịch đóng gói sẵn (Canned Transactions)** thông qua giao diện phần mềm (App/Web) do lập trình viên thiết kế.

**7. Nêu các ưu điểm của Database so với hệ thống File truyền thống?**
*(Đây là lúc bạn liệt kê 6 vũ khí)*
1. Tránh dư thừa dữ liệu, đảm bảo tính đồng bộ (Nhờ quá trình Chuẩn hóa).
2. Truy vấn siêu tốc nhờ **Index** (Cây B-Tree).
3. Đảm bảo **Toàn vẹn dữ liệu** bằng các ràng buộc (Constraints như Khóa ngoại, Check).
4. Hỗ trợ **Triggers & Stored Procedures**.
5. Cung cấp cơ chế **Backup & Recovery** (Sử dụng File Log để phục hồi).
6. Cung cấp hệ thống **Bảo mật và Phân quyền**.

**8. Database System khác gì với Information Retrieval System (như Elasticsearch, Google Search)?**
- **Database System (MySQL):** Xử lý dữ liệu **có cấu trúc (Structured Data)**, cần độ chính xác tuyệt đối (như tiền bạc).
- **Information Retrieval:** Xử lý dữ liệu **phi cấu trúc (Unstructured Data)** như bài viết, sách PDF. Tối ưu cho việc tìm kiếm từ khóa văn bản (Full-text Search).
