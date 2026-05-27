---
domain: IT_Knowledge
type: reference
status: active
tags: [sql, join, relational-database, query]
created: 2026-05-27
source: "John's SQL knowledge"
nexus_version: 6.0
---

# [[SQL_Join_Fundamentals]] (Cornell Notes)

| Cue | Notes |
| --- | --- |
| **Bản chất JOIN** | - Kỹ thuật kết hợp dữ liệu từ hai hoặc nhiều bảng dựa trên một cột chung (thường là [[Primary_Key]] và [[Foreign_Key]]). |
| **Các loại JOIN** | - **INNER JOIN**: Lấy các hàng có giá trị khớp ở cả hai bảng.<br>- **LEFT JOIN**: Lấy tất cả hàng từ bảng trái và các hàng khớp từ bảng phải. |
| **Logic Liên kết** | - Cú pháp: `SELECT columns FROM table1 JOIN table2 ON table1.fk = table2.pk`. |
| **Phân tích lỗi thiết kế** | - Thông thường `Order` sẽ chứa `Customer_ID` (Khóa ngoại) vì một khách hàng có nhiều đơn hàng (1-n).<br>- Nếu để `order_id` trong bảng `customers`, một khách hàng chỉ có thể có tối đa 1 đơn hàng (Sai logic thực tế). |

## Summary
[[SQL_Join_Fundamentals]] là công cụ mạnh mẽ để truy xuất dữ liệu liên kết. Để sử dụng hiệu quả, cần xác định đúng hướng của mối quan hệ (1-n) và đặt [[Foreign_Key]] ở bảng "nhiều".

## Related
- [[Relational_Database_Fundamentals]]
- [[Primary_Key]]
- [[Foreign_Key]]
- [[One_To_Many_Relationship]]
