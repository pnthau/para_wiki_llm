---
title: "BC-JAVA-JWBD_2.1: [Bài đọc] Bảng trong CSS"
source: "https://james.codegym.vn/mod/page/view.php?id=9981&forceview=1"
author:
published:
created: 2026-06-06
description:
tags:
  - "clippings"
---
## \[Bài đọc\] Bảng trong CSS

## Mục tiêu

Chỉnh sửa được giao diện của bảng bằng CSS.

## Nội dung

Giao diện của bảng trong HTML có thể được cải thiện đáng kể với CSS.

## Đường viền của bảng

Để định kiểu cho đường viền (border) của bảng trong CSS, sử dụng thuộc tính border.  
Ví dụ dưới đây chỉ định đường biên màu đen cho các phần tử <table>, <th>, và <td>:

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/578ae5am/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>Lưu ý rằng bảng ở ví dụ trên có đường viền đôi. Điều này là bởi các phần tử <table>,  
<th> và <td> đều có đường viền riêng biệt.

## Bỏ các đường viền của bảng

Thuộc tính **border-collapse** thiết lập các đường viền của bảng nhập vào thành một đường viền duy nhất:

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/ov1p93sv/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

## Chiều rộng và chiều cao của bảng

Chiều rộng và chiều cao của một bảng được xác định bởi các thuộc tính width và height. Ví dụ dưới đây đặt chiều rộng của bảng là 100%, và chiều cao của các phần tử <th> là 50px:

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/4emy9r7g/1/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

## Căn chỉnh theo chiều ngang

Thuộc tính text-align thiết lập căn chỉnh theo chiều ngang (như trái, phải, hoặc giữa)  
cho nội dung bên trong <th> hoặc <td>.  
Mặc định, nội dung của các phần tử <th> được canh giữa và nội dung của các phần tử  
<td> được canh trái.  
Ví dụ sau văn bản trong <th> được canh lề trái:

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/Lvonscn0/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

## Căn chỉnh theo chiều dọc

Thuộc tính vertical-lign dùng để thiết lập căn chỉnh theo chiều dọc (như trên, dưới,  
hoặc giữa) nội dung bên trong các phần tử <th> hoặc <td>.  
Mặc định, căn chỉnh theo chiều dọc nội dung trong bảng là ở giữa (middle) (cho cả <th>  
và <td>).  
Ví dụ sau thiết lập căn chỉnh văn bản xuống dưới (bottom) cho các phần tử <td>:

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/m5n59L6z/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

## Padding trong bảng

Để điều khiển khoảng cách giữa đường viền và nội dung bên trong một bảng, sử dụng  
thuộc tính padding cho các phần tử <td> và <th>:

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/k46e278m/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

## Màu sắc trong bảng

Ví dụ dưới đây chỉ định màu sắc của các đường viền; màu nền và màu chữ của phần tử <th>:

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/g7fuo26k/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

Last modified: Friday, 3 June 2022, 4:37 PM