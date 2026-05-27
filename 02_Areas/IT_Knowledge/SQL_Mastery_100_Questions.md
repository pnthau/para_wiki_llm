---
domain: IT_Knowledge
type: exercise
status: active
tags: [sql, practical-exercises, database-design, query-optimization]
created: 2026-05-27
nexus_version: 6.0
---

# [[SQL_Mastery_100_Questions]] (10 Thử thách Thực chiến Doanh nghiệp)

## Ngữ cảnh (Schema E-commerce & EdTech)
Hệ thống quản lý một nền tảng bán khóa học trực tuyến. Các bảng chính (đã thiết kế bằng Surrogate Key):
- `users(id, name, email, created_at, role)` - role: 'student', 'instructor'.
- `courses(id, title, instructor_id, price, status)`
- `enrollments(id, student_id, course_id, enrolled_date, progress_percent)` - Junction Table.
- `payments(id, student_id, amount, payment_date, status)` - status: 'success', 'failed', 'refunded'.

---

## Level +1 (Remember & Understand) - Khởi động
**Challenge 1: Truy xuất cơ bản**
> "Marketing team cần danh sách email của tất cả các học viên (student) đăng ký tài khoản trong tháng 5/2026 để gửi thư khuyến mãi. Hãy lấy ra Tên và Email của họ."

**Challenge 2: Lọc dữ liệu thô**
> "Kế toán cần biết những giao dịch thanh toán nào đã bị 'failed' hoặc 'refunded' nhưng có số tiền (amount) > 1,000,000 VND. Hãy xuất danh sách đó."

---

## Level +2 (Apply) - Kết nối Dữ liệu (JOIN)
**Challenge 3: Cầu nối cơ bản**
> "Hiển thị danh sách tất cả các khóa học kèm theo tên của Giảng viên (instructor) phụ trách khóa đó."

**Challenge 4: Xuyên thấu bảng trung gian**
> "Lấy ra danh sách gồm: Tên sinh viên, Tên khóa học và Phần trăm tiến độ (progress_percent) của những học viên đang học khóa 'Advanced Java'."

---

## Level +3 (Analyze) - Thống kê & Báo cáo (Aggregations)
**Challenge 5: Phân tích Doanh thu**
> "Sếp muốn biết tổng doanh thu (chỉ tính thanh toán 'success') mà mỗi sinh viên đã mang lại. Hãy hiển thị `student_name` và `total_spent`. Xếp hạng người tiêu nhiều nhất lên đầu."

**Challenge 6: Đo lường mức độ tương tác**
> "Môn học nào đang thu hút nhất? Hãy đếm số lượng học viên đang ghi danh (enroll) cho từng khóa học. Bỏ qua những khóa học chưa có ai đăng ký."

---

## Level +4 (Evaluate) - Bộ lọc Phức tạp (HAVING & Subquery)
**Challenge 7: Tìm kiếm khách hàng VIP**
> "Marketing muốn tri ân những học viên 'cuồng nhiệt'. Hãy tìm ra những sinh viên đã đăng ký học NHIỀU HƠN 3 khóa học khác nhau."

**Challenge 8: Đánh giá chất lượng giảng viên**
> "Giảng viên nào đang tạo ra nhiều giá trị nhất? Hãy tính tổng doanh thu (dựa trên giá tiền của các khóa học mà học viên đã enroll) cho từng Giảng viên. Chỉ lấy những Giảng viên mang lại trên 50,000,000 VND."

---

## Level +5 (Create & Architect) - Tối ưu hóa & Kiến trúc
**Challenge 9: Giải quyết Anomalies (Subquery/CTE)**
> "Chúng ta nghi ngờ có lỗi hệ thống: Hãy tìm những `student_id` có bản ghi trong bảng `payments` (đã thanh toán) nhưng KHÔNG có bất kỳ bản ghi nào trong bảng `enrollments` (chưa được cấp quyền học)."

**Challenge 10: Tối ưu hóa Vận hành (Architect Level)**
> "Bảng `payments` hiện có 50 triệu dòng. Câu query ở Challenge 5 (tính tổng chi tiêu của mỗi sinh viên) đang chạy mất 30 giây làm treo hệ thống báo cáo. 
> Bằng tư duy của một Java/Database Architect, bạn sẽ thiết kế thêm Table/Cột nào, hoặc đánh Index ở đâu, hoặc tạo cronjob trong Java như thế nào để Dashboard báo cáo chỉ mất 0.1 giây để load?"

---
## Related
- [[SQL_Advanced_Filtering]]
- [[SQL_Aggregations]]
- [[Junction_Table]]
