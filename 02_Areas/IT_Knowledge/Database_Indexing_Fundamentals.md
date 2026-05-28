---
domain: IT_Knowledge
type: concept
status: active
tags: [database, index, b-tree, performance, scalability]
created: 2026-05-27
nexus_version: 6.0
---

# [[Database_Indexing_Fundamentals]] (Bản chất của Chỉ mục)

## 1. Index là gì? (Logic & Spatial)
Hãy tưởng tượng Database là một cuốn sách dày 1.000.000 trang.
- **Không có Index**: Để tìm một cụm từ, bạn phải lật từng trang từ đầu đến cuối (**Full Table Scan**). Độ phức tạp: $O(n)$.
- **Có Index**: Bạn lật đến trang cuối cùng của cuốn sách (Mục lục), tìm từ khóa đó và xem nó nằm ở trang bao nhiêu, sau đó lật thẳng đến đó. Độ phức tạp: $O(log n)$.

## 2. Cơ chế B-Tree (Cấu trúc dữ liệu cốt lõi)
Hầu hết các RDBMS (MySQL, PostgreSQL) sử dụng cấu trúc **B-Tree** (Balanced Tree) để lưu trữ Index.
- **Cân bằng**: Cây luôn tự cân bằng để đảm bảo mọi tìm kiếm đều có độ dài đường đi tương đương nhau.
- **Phân cấp**: Dữ liệu được chia thành các Node (Gốc -> Nhánh -> Lá).
- **Hiệu quả**: Với 1 triệu bản ghi, B-Tree chỉ cần khoảng **20 bước** (so sánh) để tìm ra kết quả, thay vì 1 triệu bước.

## 3. Tại sao Index `p.status` và `p.student_id` lại nhanh?
Trong câu lệnh: `WHERE p.status = 'success' AND p.student_id = 123`
- **Với `status`**: DB thu hẹp phạm vi tìm kiếm cực nhanh (chỉ lấy những vùng chứa 'success').
- **Với `student_id`**: Vì ID là duy nhất hoặc có tính phân loại cao, B-Tree sẽ dẫn thẳng đến địa chỉ vật lý của dòng dữ liệu đó trên đĩa cứng.

## 4. Phân tích Đa chiều
- **Database**: Index giúp tăng tốc độ đọc (`SELECT`), nhưng làm chậm tốc độ ghi (`INSERT`, `UPDATE`, `DELETE`) vì DB phải cập nhật lại cả cây B-Tree mỗi khi dữ liệu thay đổi.
- **Development (Java)**: Developer cần biết chọn cột nào để đánh Index (thường là các cột trong `WHERE`, `JOIN`, `ORDER BY`). Đánh Index bừa bãi sẽ làm phình dung dư thừa Database.
- **Operations**: Index là chìa khóa để **Scalability**. Một hệ thống không có Index sẽ sụp đổ khi dữ liệu đạt ngưỡng vài trăm ngàn dòng.

## Related
- [[Relational_Database_Fundamentals]]
- [[Surrogate_Key]]
- [[SQL_Aggregations]]
