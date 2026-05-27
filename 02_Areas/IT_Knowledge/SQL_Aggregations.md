---
domain: IT_Knowledge
type: concept
status: active
tags: [sql, mysql, aggregations, performance, group-by]
created: 2026-05-27
nexus_version: 6.0
---

# [[SQL_Aggregations]] (Hàm Tổng hợp)

## 1. Các Hàm Tổng hợp Cốt lõi
- **`COUNT(column)`**: Đếm số lượng bản ghi (không tính NULL).
- **`SUM(column)`**: Tính tổng giá trị số của cột.
- **`AVG(column)`**: Tính giá trị trung bình.
- **`MAX/MIN`**: Tìm giá trị lớn nhất/nhỏ nhất.

## 2. Phân biệt COUNT vs SUM (Lỗi Logic thường gặp)
- **Bài toán**: Thống kê số lượng sinh viên.
    - **Dùng `COUNT(id)`**: Kết quả là 5 (Nếu có 5 sinh viên). -> **ĐÚNG**.
    - **Dùng `SUM(id)`**: Kết quả là $1+2+3+4+5 = 15$. -> **SAI LOGIC**.

## 3. Quy trình GROUP BY
1. **Lọc dữ liệu** (`WHERE`).
2. **Nhóm dữ liệu** (`GROUP BY`).
3. **Thực hiện tính toán** (`COUNT`, `SUM`, ...).
4. **Lọc nhóm** (`HAVING` - nếu cần).

## 4. Phân tích Đa chiều
- **Database**: Aggregations thực hiện tại Server DB giúp giảm băng thông truyền tải dữ liệu.
- **Java**: Nên dùng các hàm này để lấy kết quả báo cáo, tránh xử lý logic tính toán phức tạp trên List trong Java.
- **Operations**: `GROUP BY` trên các cột không được đánh Index sẽ gây ra quét toàn bộ bảng (Full Table Scan), làm treo hệ thống nếu dữ liệu lớn.

## Related
- [[Relational_Database_Fundamentals]]
- [[SQL_Join_Fundamentals]]
- [[Java_Functional_Programming]] (Stream API cũng có tính năng tương tự)
