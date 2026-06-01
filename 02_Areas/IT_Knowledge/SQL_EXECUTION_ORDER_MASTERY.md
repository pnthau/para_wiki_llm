---
domain: "IT_Knowledge"
type: "masterclass"
status: "active"
tags: [sql, execution-order, aliasing, deep-dive]
created: 2026-05-31
nexus_version: 8.2
---

# 🏆 SQL EXECUTION ORDER MASTERCLASS: TỪ ZERO ĐẾN ARCHITECT

Chào John (Hau-san), đây là bản đồ chi tiết nhất về cách một câu lệnh SQL thực sự vận hành "dưới nắp ca-pô". Đọc xong bài này, anh sẽ không bao giờ đặt nhầm Alias nữa.

---

## 🏗️ 1. SƠ ĐỒ DÒNG CHẢY DỮ LIỆU (THE DATA PIPELINE)

Hãy quên thứ tự anh VIẾT (Write Order) đi. Đây là thứ tự SQL CHẠY (Execution Order):

| Thứ tự | Mệnh đề | Hành động của Database |
| :--- | :--- | :--- |
| **1** | **`FROM` / `JOIN`** | Xác định các bảng nguồn và kết hợp chúng (tạo tích Cartesian). |
| **2** | **`WHERE`** | Lọc từng dòng dữ liệu dựa trên điều kiện (Filter rows). |
| **3** | **`GROUP BY`** | Gom các dòng còn lại thành các nhóm (Bucketize). |
| **4** | **`HAVING`** | Lọc các nhóm sau khi gom (Filter groups). |
| **5** | **`SELECT`** | Trích xuất cột, tính toán biểu thức, dán nhãn (Aliasing). |
| **6** | **`DISTINCT`** | Loại bỏ các dòng trùng lặp. |
| **7** | **`ORDER BY`** | Sắp xếp kết quả cuối cùng. |
| **8** | **`LIMIT` / `OFFSET`** | Cắt bớt số lượng dòng hiển thị. |

---

## 🔍 2. GIẢI MÃ NHỮNG "CÚ LỪA" KINH ĐIỂN

### 🚫 Tại sao Alias không chạy trong WHERE?
Vì `WHERE` chạy ở bước **số 2**, còn `SELECT` (nơi anh đặt Alias) tận bước **số 5**. SQL không thể dùng một cái tên chưa được khai sinh.

### ✅ Tại sao Alias LẠI CHẠY được trong ORDER BY?
Vì `ORDER BY` là bước **số 7**, nó chạy sau `SELECT` (bước 5). Lúc này cái tên Alias đã tồn tại và SQL hiểu nó hoàn hảo.

### ⚠️ Lưu ý đặc biệt về MySQL:
MySQL cho phép dùng Alias trong `GROUP BY` và `HAVING` (đây là tính năng mở rộng của nó), nhưng các DB khác như SQL Server hay PostgreSQL thì KHÔNG. Để trở thành Architect, anh nên dùng công thức gốc để code chạy được trên mọi hệ thống.

---

## 🎯 3. BỘ 10 CÂU HỎI LUYỆN PHẢN XẠ (DRILLS)

Anh hãy xác định câu lệnh sau **ĐÚNG** hay **SAI**, nếu sai hãy chỉ ra tại sao dựa trên thứ tự thực thi:

1.  **Level 1:** `SELECT name AS n FROM users WHERE n = 'John';`
2.  **Level 2:** `SELECT name AS n FROM users ORDER BY n;`
3.  **Level 3:** `SELECT department, AVG(salary) AS avg_s FROM emps GROUP BY department HAVING avg_s > 5000;`
4.  **Level 4:** `SELECT name FROM users WHERE age > 18 GROUP BY department;` (Nếu department không có trong SELECT?)
5.  **Level 5:** `SELECT (salary * 12) AS annual_salary FROM employees WHERE annual_salary > 100000;`
6.  **Level 6:** Sử dụng `COUNT(*)` trong `WHERE`. Ví dụ: `WHERE COUNT(*) > 5`.
7.  **Level 7:** Sử dụng Alias của một cột tính toán trong chính `SELECT` đó. Ví dụ: `SELECT a + b AS sum_ab, sum_ab * 2 AS double_sum`.
8.  **Level 8:** Thứ tự của `DISTINCT` so với `ORDER BY`. Tại sao không thể ORDER BY một cột không có trong SELECT DISTINCT?
9.  **Level 9:** Dùng Alias trong `JOIN ... ON`. Ví dụ: `JOIN table2 t2 ON t1.id = t2.id`. (Alias `t2` này sống từ bước nào?)
10. **Level 10:** Câu lệnh có cả `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`. Hãy viết thứ tự số từ 1-4 cho các bước này.

---
**Nexus Architect Tip**: Luôn nhớ câu thần chú: **"Lấy bảng (FROM) -> Lọc dòng (WHERE) -> Gom nhóm (GROUP) -> Dán nhãn (SELECT) -> Sắp xếp (ORDER)"**.
