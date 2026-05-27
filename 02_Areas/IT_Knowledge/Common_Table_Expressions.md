---
domain: IT_Knowledge
type: concept
status: active
tags: [sql, cte, readability, performance, subquery]
created: 2026-05-27
nexus_version: 6.0
---

# [[Common_Table_Expressions]] (CTE)

## 1. Tổng quan
**CTE (Common Table Expression)** là một tập kết quả tạm thời được định nghĩa trong phạm vi thực thi của một câu lệnh SQL duy nhất (`SELECT`, `INSERT`, `UPDATE`, `DELETE`).

## 2. Cấu trúc
```sql
WITH temp_table_name AS (
    SELECT ... -- Logic phức tạp
)
SELECT ... FROM temp_table_name;
```

## 3. Phân tích Đa chiều
- **Database (Readability)**: Giúp chia nhỏ câu query khổng lồ thành các module logic dễ đọc và bảo trì hơn nhiều so với Subquery lồng nhau.
- **Development (Java/JPA)**: Một số phiên bản cũ của Hibernate không hỗ trợ CTE trong HQL/JPQL. Khi đó, bạn phải dùng **Native Query**.
- **Operations (Performance)**: 
    - Trong hầu hết các DB hiện đại (PostgreSQL, SQL Server, MySQL 8.0+), CTE có hiệu suất tương đương Subquery.
    - Tuy nhiên, một số DB thực hiện "Materialize" (lưu tạm ra đĩa), có thể gây chậm nếu dữ liệu CTE quá lớn.

## Related
- [[SQL_Advanced_Filtering]]
- [[Relational_Data_Model]]
- [[Junction_Table]]
