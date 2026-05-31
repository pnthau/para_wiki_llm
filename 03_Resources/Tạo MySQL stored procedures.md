---
title: "BC-JAVA-JWBD_2.1: [Bài đọc] Tạo MySQL stored procedures"
source: "https://james.codegym.vn/mod/page/view.php?id=9969&forceview=1"
author:
published:
created: 2026-05-30
description:
tags:
  - "clippings"
---
## \[Bài đọc\] Tạo MySQL stored procedures

## Mục tiêu

Tìm hiểu về cách tạo MySQL stored procedures.

## Nội dung

Store Procedure (thủ tục lưu trữ), có thể được định nghĩa là chương trình con, giống như một chương trình con được lưu trữ trong cơ sở dữ liệu. Trong ngữ cảnh của MySQL, nó là một phân đoạn các câu lệnh SQL khai báo được lưu trữ bên trong danh mục cơ sở dữ liệu. Sau đây là cú pháp để tạo một Store Procedure:

**Syntax**

```
DELIMITER //

CREATE PROCEDURE [procedure_name] ([param1, param2,…])
 BEGIN
 [sql_statements]
 END //

DELIMITER ;
```

Trong đó:

- `CREATE PROCEDURE` là câu lệnh dùng để khai báo Stored Procedure trong MySQL.
- `[procedure_name]` là tên của Stored Procedure.
- `[param1, param2, …]` là các tham số truyền vào Stored Procedure. Cấu trúc khai báo các tham số:
	- `[IN | OUT] param [datatype: INT, VARCHAR, …]`, với `[IN | OUT]` chỉ định tham số đầu vào (`IN`) hay đầu ra (`OUT`).
		- Ví dụ: `(IN param1 INT, OUT param2 VARCHAR(25))`
- `BEGIN` khai báo phần thân của Stored Procedure, kể từ câu lệnh này trở đi, định nghĩa những thao tác mà Stored Procedure sẽ thực hiện khi được gọi.

Gọi Stored Procedure đã được khai báo:

```
CALL procedure_name ([param1, param2,…]);
```

**Ví dụ**

Sau đây là một ví dụ trong đó ta đã tạo một quy trình đơn giản để lấy tất cả các bản ghi từ bảng ‘student\_info, có dữ liệu sau:

```
select * from student_info;
```
```
+-----+---------+------------+------------+
```
```
| id  | Name    | Address    | Subject    |
```
```
+-----+---------+------------+------------+
```
```
| 100 | Aarav   | Delhi      | Computers  |
```
```
| 101 | YashPal | Amritsar   | History    |
```
```
| 105 | Gaurav  | Jaipur     | Literature |
```
```
| 110 | Rahul   | Chandigarh | History    |
```
```
+------+--------+------------+------------+
```
```
4 rows in set (0.00 sec)
```

Bây giờ, ta tạo thủ tục lưu trữ có tên allrecords ():

```
Delimiter //
```
```
Create Procedure allrecords()
```
```
BEGIN
```
```
Select * from Student_info;
```
```
END//
```
```
DELIMITER ;
```

Last modified: Friday, 27 May 2022, 11:20 AM