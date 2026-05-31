---
title: "BC-JAVA-JWBD_2.1: [Bài đọc] Cách sử dụng chỉ mục để cải thiện hiệu năng truy vấn của MySQL"
source: "https://james.codegym.vn/mod/page/view.php?id=9966&forceview=1"
author:
published:
created: 2026-05-30
description:
tags:
  - "clippings"
---
## \[Bài đọc\] Cách sử dụng chỉ mục để cải thiện hiệu năng truy vấn của MySQL

## Mục tiêu

Tìm hiểu về từ khóa EXPLAIN trong CSDL.

## Nội dung

Các chỉ mục cơ sở dữ liệu trong MySQL cho phép bạn tăng tốc hiệu suất của các câu lệnh truy vấn. Đối với các bảng nhỏ, một chỉ mục không giúp được nhiều. Tuy nhiên, nếu bạn có các bảng có lượng dữ liệu lớn, các chỉ mục có thể cải thiện đáng kể hiệu năng.

Các hành vi sau đây là tất cả các dấu hiệu cho thấy các bảng có thể được hưởng lợi từ việc thêm các chỉ mục:

- Trang web của bạn tải rất chậm hoặc hoàn toàn không.
- Một ứng dụng không thể kết nối với cơ sở dữ liệu của nó.
- Các truy vấn cơ sở dữ liệu được sao lưu.

Nếu bạn gặp bất kỳ vấn đề nào trong số này, bạn nên phân tích các truy vấn cơ sở dữ liệu của mình và xem xét thêm các chỉ mục.

Để xác định bảng nào có thể có lợi từ việc sử dụng chỉ mục, bạn phải phân tích các truy vấn cơ sở dữ liệu của mình. Câu lệnh EXPLAIN SELECT giúp bạn làm điều này:

**EXPLAIN SELECT \* FROM table\_name WHERE conditions \\G**

Đầu ra từ câu lệnh EXPLAIN SELECT cho thấy cách trình tối ưu hóa truy vấn MySQL sẽ thực hiện truy vấn. Ví dụ, hãy xem xét đầu ra sau:

```yaml
EXPLAIN SELECT title FROM employees WHERE lastname LIKE 'T%' \G

*************************** 1. row ***************************

  id: 1

  select_type: SIMPLE

  table: employees

  type: ALL

  possible_keys: NULL

  key: NULL

  key_len: NULL

  ref: NULL

  rows: 142

  Extra: Using where

  1 row in set (0.00 sec)
```

Trong ví dụ này đầu ra:

- Các giá trị possible\_keys và key đều là NULL, điều này cho thấy rằng MySQL không có chỉ mục mà nó có thể sử dụng cho truy vấn này.
- Giá trị rows chỉ ra rằng MySQL sẽ đọc 142 hàng cho truy vấn này. Nếu có tổng số 142 hàng trong bảng, điều này có nghĩa là MySQL phải kiểm tra từng hàng để tạo tập kết quả. Điều này có thể mất khá nhiều thời gian cho một bảng lớn.

Mặt khác, nếu chúng ta tạo một chỉ mục có tên là index\_name cho cột lastname, thì MySQL có thể tạo đầu ra sau cho cùng một truy vấn:

```sql
EXPLAIN SELECT title FROM employees WHERE lastname LIKE 'T%' \G

*************************** 1. row ***************************
  id: 1
  select_type: SIMPLE
  table: employees
  type: range
  possible_keys: index_name
  key: index_name
  key_len: 22
  ref: NULL
  rows: 17
  Extra: Using where; Using index
  1 row in set (0.00 sec)

            Như bạn có thể thấy, các giá trị possible_keys và key có thể chỉ ra rằng MySQL đã tìm thấy một chỉ mục mà nó có thể sử dụng để tối ưu hóa truy vấn. Ngoài ra, MySQL sẽ chỉ đọc 17 hàng để tạo tập kết quả, thay vì tất cả 142 hàng. (Điều này có nghĩa là bảng có 17 hàng trong đó lastname bắt đầu bằng “T”) Cuối cùng, giá trị Extra cũng chỉ ra rằng MySQL sẽ sử dụng một chỉ mục cho truy vấn.
```

Last modified: Friday, 27 May 2022, 11:12 AM