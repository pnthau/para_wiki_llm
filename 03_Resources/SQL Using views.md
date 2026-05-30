---
title: "BC-JAVA-JWBD_2.1: [Bài đọc] SQL"
source: "https://james.codegym.vn/mod/page/view.php?id=16587"
author:
published:
created: 2026-05-30
description:
tags:
  - "clippings"
---
## \[Bài đọc\] SQL - Using Views

## Mục tiêu

Tìm hiểu về VIEW trong SQL, cú pháp và thao tác với VIEW.

## Nội dung

Một khung nhìn (view) là một câu lệnh SQL được lưu trữ trong cơ sở dữ liệu với một tên xác định. Một view thực sự là một thành phần của một bảng dưới dạng truy vấn SQL được xác định trước.

Một view có thể chứa tất cả các hàng của một bảng hoặc chọn các hàng từ một bảng. Một view có thể được tạo từ một hoặc nhiều bảng phụ thuộc vào truy vấn SQL để tạo ra một view.

View là một loại bảng ảo cho phép người dùng thực hiện các thao tác sau:

- Cấu trúc dữ liệu theo cách mà người dùng tìm thấy tự nhiên hoặc trực quan.
- Hạn chế quyền truy cập vào dữ liệu theo cách mà người dùng có thể nhìn thấy và (đôi khi) sửa đổi chính xác những gì họ cần.
- Tóm tắt dữ liệu từ các bảng khác nhau có thể được sử dụng để tạo báo cáo.

### Tạo Views

Các view cơ sở dữ liệu được tạo bằng cách sử dụng câu lệnh CREATE VIEW. View có thể được tạo từ một bảng hoặc nhiều bảng.

Để tạo view, người dùng phải có đặc quyền hệ thống phù hợp theo cách triển khai cụ thể.

Cú pháp tạo VIEW cơ bản như sau:

```sql
CREATE VIEW view_name AS

SELECT column1, column2.....

FROM table_name

WHERE [condition];
```

Bạn có thể truy vấn nhiều bảng trong câu lệnh SELECT của mình theo cách tương tự như khi bạn sử dụng chúng trong truy vấn SQL SELECT thông thường.

Ví dụ:

Xem xét bảng CUSTOMERS có các bản ghi sau:

```
+----+----------+-----+-----------+----------+
```
```
| ID | NAME     | AGE | ADDRESS   | SALARY   |
```
```
+----+----------+-----+-----------+----------+
```
```
|  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
```
```
|  2 | Khilan   |  25 | Delhi     |  1500.00 |
```
```
|  3 | kaushik  |  23 | Kota      |  2000.00 |
```
```
|  4 | Chaitali |  25 | Mumbai    |  6500.00 |
```
```
|  5 | Hardik   |  27 | Bhopal    |  8500.00 |
```
```
|  6 | Komal    |  22 | MP        |  4500.00 |
```
```
|  7 | Muffy    |  24 | Indore    | 10000.00 |
```
```
+----+----------+-----+-----------+----------+
```

Sau đây là một ví dụ để tạo view từ bảng CUSTOMERS. View sau đây sẽ được sử dụng để lấy tên và tuổi của khách hàng từ bảng CUSTOMERS:

```sql
CREATE VIEW CUSTOMERS_VIEW AS

SELECT name, age

FROM  CUSTOMERS;
```

Bây giờ, bạn có thể truy vấn CUSTOMERS\_VIEW theo cách tương tự như khi bạn truy vấn một bảng thực tế. Sau đây là một ví dụ:

```sql
SELECT * FROM CUSTOMERS_VIEW;
```

Điều này sẽ tạo ra kết quả sau đây:

```
+----------+-----+
```
```
| name     | age |
```
```
+----------+-----+
```
```
| Ramesh   |  32 |
```
```
| Khilan   |  25 |
```
```
| kaushik  |  23 |
```
```
| Chaitali |  25 |
```
```
| Hardik   |  27 |
```
```
| Komal    |  22 |
```
```
| Muffy    |  24 |
```
```
+----------+-----+
```

**WITH CHECK OPTION:**

WITH CHECK OPTION là tùy chọn với câu lệnh CREATE VIEW. Mục đích của WITH CHECK OPTION là để đảm bảo rằng tất cả các UPDATE và INSERT đều đáp ứng (các) điều kiện trong định nghĩa view.

Nếu chúng không thỏa mãn (các) điều kiện, thì UPDATE hoặc INSERT trả về lỗi.

Khối mã sau đây có một ví dụ về việc tạo cùng một view CUSTOMERS\_VIEW với WITH CHECK OPTION:

```sql
CREATE VIEW CUSTOMERS_VIEW AS
SELECT name, age
FROM  CUSTOMERS
WHERE age IS NOT NULL
WITH CHECK OPTION;
```

WITH CHECK OPTION trong trường hợp này sẽ từ chối mục nhập của bất kỳ giá trị NULL nào trong cột AGE của view, bởi vì view được xác định bởi dữ liệu không có giá trị NULL trong cột AGE.

### Cập nhật view

Một view có thể được cập nhật trong các điều kiện nhất định được đưa ra dưới đây:

Mệnh đề SELECT có thể không chứa từ khóa DISTINCT.

Mệnh đề SELECT có thể không chứa các hàm summary.

Mệnh đề SELECT có thể không chứa các hàm tập hợp.

Mệnh đề SELECT có thể không chứa các toán tử tập hợp.

Mệnh đề SELECT có thể không chứa mệnh đề ORDER BY.

Mệnh đề FROM có thể không chứa nhiều bảng.

Mệnh đề WHERE có thể không chứa các truy vấn con.

Truy vấn có thể không chứa GROUP BY hoặc HAVING.

Các cột được tính toán có thể không được cập nhật.

Tất cả các cột KHÔNG NULL từ bảng cơ sở phải được đưa vào view để truy vấn INSERT hoạt động.

Vì vậy, nếu một view thỏa mãn tất cả các quy tắc nêu trên thì bạn có thể cập nhật view đó. Khối mã sau đây là một ví dụ để cập nhật tuổi của Ramesh.

```sql
UPDATE CUSTOMERS_VIEW
SET AGE = 35
WHERE name = 'Ramesh';
```

Điều này cuối cùng sẽ cập nhật bảng cơ sở CUSTOMERS và điều tương tự sẽ phản ánh trong chính view. Bây giờ, hãy thử truy vấn bảng cơ sở và câu lệnh SELECT sẽ tạo ra kết quả như sau:

```
+----+----------+-----+-----------+----------+
```
```
| ID | NAME     | AGE | ADDRESS   | SALARY   |
```
```
+----+----------+-----+-----------+----------+
```
```
|  1 | Ramesh   |  35 | Ahmedabad |  2000.00 |
```
```
|  2 | Khilan   |  25 | Delhi     |  1500.00 |
```
```
|  3 | kaushik  |  23 | Kota      |  2000.00 |
```
```
|  4 | Chaitali |  25 | Mumbai    |  6500.00 |
```
```
|  5 | Hardik   |  27 | Bhopal    |  8500.00 |
```
```
|  6 | Komal    |  22 | MP        |  4500.00 |
```
```
|  7 | Muffy    |  24 | Indore    | 10000.00 |
```
```
+----+----------+-----+-----------+----------+
```

### Chèn hàng vào view

Hàng dữ liệu có thể được chèn vào một view. Các quy tắc tương tự áp dụng cho lệnh UPDATE cũng áp dụng cho lệnh INSERT.

Ở đây, chúng ta không thể chèn các hàng trong CUSTOMERS\_VIEW vì ta chưa bao gồm tất cả các cột KHÔNG NULL trong view này, nếu không, bạn có thể chèn các hàng trong view theo cách tương tự khi bạn chèn chúng vào bảng.

### Xóa hàng khỏi view

Hàng dữ liệu có thể bị xóa khỏi view. Các quy tắc tương tự áp dụng cho các lệnh UPDATE và INSERT áp dụng cho lệnh DELETE.

Sau đây là một ví dụ để xóa một bản ghi có AGE = 22.

```sql
DELETE FROM CUSTOMERS_VIEW
WHERE age = 22;
```

Điều này cuối cùng sẽ xóa một hàng khỏi bảng cơ sở CUSTOMERS và điều tương tự sẽ phản ánh trong chính view. Bây giờ, hãy thử truy vấn bảng cơ sở và câu lệnh SELECT sẽ tạo ra kết quả như sau:

```
+----+----------+-----+-----------+----------+
```
```
| ID | NAME     | AGE | ADDRESS   | SALARY   |
```
```
+----+----------+-----+-----------+----------+
```
```
|  1 | Ramesh   |  35 | Ahmedabad |  2000.00 |
```
```
|  2 | Khilan   |  25 | Delhi     |  1500.00 |
```
```
|  3 | kaushik  |  23 | Kota      |  2000.00 |
```
```
|  4 | Chaitali |  25 | Mumbai    |  6500.00 |
```
```
|  5 | Hardik   |  27 | Bhopal    |  8500.00 |
```
```
|  7 | Muffy    |  24 | Indore    | 10000.00 |
```
```
+----+----------+-----+-----------+----------+
```

### Xoá view

Rõ ràng, bạn cần một cách để loại bỏ view nếu không còn cần thiết. Cú pháp rất đơn giản và được đưa ra dưới đây:

```sql
DROP VIEW view_name;
```

Sau đây là một ví dụ để loại bỏ CUSTOMERS\_VIEW khỏi bảng CUSTOMERS:

```sql
DROP VIEW CUSTOMERS_VIEW;
```

Last modified: Tuesday, 19 July 2022, 2:59 PM