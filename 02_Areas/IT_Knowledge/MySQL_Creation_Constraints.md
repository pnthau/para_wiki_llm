---
domain: IT_Knowledge
type: concept
status: active
tags: [sql, mysql, constraints, data-integrity, check-constraint]
created: 2026-05-27
nexus_version: 6.0
---

# [[MySQL_Creation_Constraints]] (Ràng buộc khi Khởi tạo)

## 1. Các Ràng buộc Phổ biến
- **`NOT NULL`**: Ép cột phải có giá trị.
- **`UNIQUE`**: Đảm bảo không có 2 hàng trùng giá trị trong cột đó.
- **`DEFAULT`**: Gán giá trị mặc định nếu không cung cấp.
- **`PRIMARY KEY`**: Định danh duy nhất (NOT NULL + UNIQUE).
- **`AUTO_INCREMENT`**: Tự động tăng số nguyên (thường dùng cho ID).

## 2. Ràng buộc `CHECK` trong MySQL
- **Lưu ý Quan trọng**: Trước MySQL 8.0.16, `CHECK` được phân tích cú pháp nhưng bị BỎ QUA. Từ bản 8.0.16 trở đi (bao gồm 8.4 LTS), nó hoạt động thực sự.
- **Logic Ngày tháng**: Không thể trừ trực tiếp `TIMESTAMP - DATE` để lấy số năm.
    - **Cách sai**: `current_timestamp - dob > 18`.
    - **Cách đúng (MySQL)**: `TIMESTAMPDIFF(YEAR, dob, CURDATE()) >= 18` hoặc `dob <= DATE_SUB(CURDATE(), INTERVAL 18 YEAR)`.

## 3. Phân tích Đa chiều (Multi-Perspective)
- **Database**: `CHECK` giúp bảo vệ dữ liệu ở tầng thấp nhất, ngăn chặn dữ liệu rác từ bất kỳ nguồn nào.
- **Development (Java)**: Đừng chỉ dựa vào DB. Nên thực hiện validation ở tầng ứng dụng (Bean Validation `@Past`, `@Min`) để phản hồi lỗi nhanh hơn cho người dùng.
- **Operations**: Sử dụng `CHECK` giúp giảm tải cho logic ứng dụng trong việc kiểm tra các điều kiện bất biến (Invariants).

## Related
- [[Relational_Database_Fundamentals]]
- [[MySQL_8.4_Features]]
- [[Data_Integrity]]
