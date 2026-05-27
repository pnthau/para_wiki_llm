---
domain: IT_Knowledge
type: concept
status: active
tags: [sql, mysql, filtering, having, where, optimization]
created: 2026-05-27
nexus_version: 6.0
---

# [[SQL_Advanced_Filtering]] (Lọc dữ liệu Nâng cao)

## 1. WHERE vs HAVING (Sự khác biệt Cốt lõi)
| Đặc điểm | WHERE | HAVING |
| :--- | :--- | :--- |
| **Thời điểm chạy** | Trước khi `GROUP BY`. | Sau khi `GROUP BY`. |
| **Đối tượng lọc** | Từng dòng dữ liệu thô. | Các nhóm dữ liệu đã tổng hợp. |
| **Hàm tổng hợp** | KHÔNG được dùng (COUNT, SUM...). | BẮT BUỘC dùng với hàm tổng hợp. |

## 2. Thứ tự Thực thi chuẩn trong SQL
1. `FROM` & `JOIN`.
2. `WHERE` (Lọc thô).
3. `GROUP BY` (Nhóm).
4. `HAVING` (Lọc tinh - sau tổng hợp).
5. `SELECT` (Lấy cột).
6. `ORDER BY` (Sắp xếp).
7. `LIMIT` (Phân trang).

## 3. Phân tích Đa chiều
- **Database**: `WHERE` luôn hiệu quả hơn `HAVING` nếu có thể dùng được, vì nó loại bỏ dữ liệu sớm, giúp `GROUP BY` xử lý ít dữ liệu hơn.
- **Development (Java)**: Khi viết Query trong Spring Data JPA, cần lưu ý thứ tự này để tránh lỗi `Syntax Error`.
- **Operations**: Sử dụng `HAVING` trên tập dữ liệu quá lớn mà không có `WHERE` để giới hạn trước sẽ gây áp lực cực lớn lên RAM của Server DB.

## Related
- [[SQL_Aggregations]]
- [[Relational_Database_Fundamentals]]
- [[SQL_Join_Fundamentals]]
