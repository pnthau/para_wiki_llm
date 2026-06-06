---
title: "BC-JAVA-JWBD_2.1: [Bài đọc] Danh sách trong CSS"
source: "https://james.codegym.vn/mod/page/view.php?id=9980&forceview=1"
author:
published:
created: 2026-06-06
description:
tags:
  - "clippings"
---
## \[Bài đọc\] Danh sách trong CSS

## Mục tiêu

Triển khai được các loại danh sách trong HTML.

## Nội dung

Các thuộc tính về danh sách trong CSS cho phép bạn:

- Thiết lập các đánh dấu phần tử danh sách khác nhau cho các danh sách có thứ tự
- Thiết lập các đánh dấu phần tử danh sách khác nhau cho các danh sách không có  
	thứ tự
- Thiết lập một hình ảnh đánh dấu phần tử danh sách

## Các danh sách HTML

Trong HTML, có hai loại danh sách:

- danh sách không có thứ tự (<ul>) - các phần tử trong danh sách được đánh dấu bằng các bullet
- danh sách có thứ tự (<ol>) - các phần tử trong danh sách được đánh dấu bằng số hoặc chữ cái

Với CSS, danh sách có thể được định kiểu thêm, hình ảnh có thể được sử dụng để đánh dấu các mục trong danh sách.

## Đánh dấu mục trong danh sách khác nhau

Thuộc tính **list-style-type** chỉ định các kiểu đánh dấu mục trong danh sách. Ví dụ sau cho thấy một số danh sách có sẵn các đánh dấu dành cho mục của nó:

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/n5xq6dw9/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>Một số các giá trị dành cho danh sách không có thứ tự, và một số dành cho danh sách có thứ tự.

## Đánh dấu các mục của danh sách bằng hình ảnh

Thuộc tính **list-style-image** chỉ định một hình ảnh để đánh dấu các mục trong danh sách.

### Ví dụ

<iframe width="100%" height="300" src="https://jsfiddle.net/codegym/pyj42cke/1/embedded/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

## Vị trí đánh dấu các mục trong danh sách

Thuộc tính **list-style-position** xác định nơi sẽ đánh dấu các mục của danh sách sẽ xuất hiện bên trong hoặc bên ngoài dòng nội dung.

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/70ky562d/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

## Danh sách - Thuộc tính rút gọn

Thuộc tính **list-style** là một thuộc tính rút gọn. Nó được sử dụng để đặt tất cả các thuộc tính của danh sách trong một mô tả (declaration).

### Ví dụ

<iframe width="100%" height="300" src="https://jsfiddle.net/codegym/gohqfw8s/embedded/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

Khi sử dụng thuộc tính rút gọn, thứ tự của các giá trị trong thuộc tính là:

- list-style-type (nếu một danh sách đánh dâu bằng hình ảnh được chỉ định, giá trị của thuộc tính này sẽ được hiển thị nếu hình ảnh vì một số lý do nào đó không thể hiển thị)
- list-style-position (xác định cho vị trí đánh dấu mục danh sách xuất hiện bên trong hoặc bên ngoài dòng nội dung)
- list-style-image (chỉ định một hình ảnh như để đánh dấu các mục của danh sách)

Nếu một trong các giá trị thuộc tính ở trên bị thiếu, giá trị mặc định cho của các thuộc tính này sẽ được sử dụng, nếu có.

## Kiểu của danh sách với màu sắc

Chúng ta cũng có thể định kiểu danh sách với màu sắc, để làm cho chúng nhìn thú vị hơn một chút. Bất cứ điều gì thêm vào thẻ <ol> hoặc <ul>, sẽ ảnh hưởng đến toàn bộ danh sách, trong khi thuộc tính được bổ sung vào các thẻ <li> sẽ ảnh hưởng đến các mục (phần tử) của danh sách.

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/7uju3don/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

Last modified: Monday, 12 September 2022, 11:33 AM