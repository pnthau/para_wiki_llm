---
title: "BC-JAVA-JWBD_2.1: [Bài đọc] Điều chỉnh màu nền và ảnh nền"
source: "https://james.codegym.vn/mod/page/view.php?id=9985&forceview=1"
author:
published:
created: 2026-06-06
description:
tags:
  - "clippings"
---
## \[Bài đọc\] Điều chỉnh màu nền và ảnh nền

## Mục tiêu

Thay đổi được màu nền của HTML và sử dụng được ảnh nền.

## Nội dung

Các thuộc tính về nền (background) trong CSS được sử dụng để xác định các hiệu ứng về nền của một phần tử. Bao gồm:

- background-color
- background-image
- background-repeat
- background-attachment
- background-position

#### Màu nền

Thuộc tính `background-color` chỉ định màu nền của một phần tử.

Màu nền của toàn bộ trang web được thiết lập bằng cách sử dụng thẻ <body>:

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/drhtucLy/embedded/css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

Trong CSS, một màu sắc thường được chỉ định bởi:

- một giá trị HEX - ví dụ: "#ff0000"
- một giá trị RGB - ví dụ: "rgb(255,0,0)"
- một tên màu sắc hợp lệ (bằng tiếng Anh) - ví dụ: "red"

Xem trang [Sử dụng màu sắc trong trang web](http://agilearn.vn/mod/page/view.php?id=45) để nắm rõ hơn về các cách sử dụng màu.

Trong ví dụ dưới đây, <h1>, <p>, và các phần tử <div> có màu nền khác nhau:  
  
  
<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/aL7x2b9d/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>  

#### Hình nền

Thuộc tính `background-image` chỉ định một hình ảnh dùng để làm nền cho một phần tử.

Mặc định, hình ảnh nền sẽ lặp đi lặp lại để nó trải ra toàn bộ phần tử.

Hình nền cho một trang có thể được thiết lập như sau:

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/qxf3n0q6/embedded/css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>  

Dưới đây là một ví dụ về sự kết hợp tồi của văn bản và hình nền. Văn bản khó có thể đọc được:

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/c8dczbab/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>  

#### Hình nền - lặp lại theo chiều ngang hoặc theo chiều dọc

Mặc định, thuộc tính background-mage lặp hình ảnh theo chiều ngang và theo chiều dọc. Nhưng trong một số trường hợp, chúng ta cần thiết lập để hình ảnh chỉ lặp lại theo chiều ngang hoặc chiều dọc để có được nền mong muốn. Chẳng hạn, trong trường hợp sau, nếu chúng ta để mặc định thì hình ảnh sẽ được lặp theo cả hai chiều, và kết quả là nền không đẹp như mong muốn:

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/59xtwg7w/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>  
  
Nếu chúng ta điều chỉnh để hình ảnh chỉ lặp theo chiều ngang thì hiệu ứng đạt được sẽ đẹp hơn.  
<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/ozp6or7c/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>  
  
Tương tự, chúng ta có thể sử dụng thuộc tính **background-repeat** với giá trị là **repeat-y** nếu muốn lặp ảnh nền theo chiều dọc.  

#### Hình nền - Quy định vị trí ảnh và không lặp lại

Để hiển thị ảnh nền một lần duy nhất thì chúng ta cũng sử dụng thuộc tính `background-repeat` với giá trị là `no-repeat`.

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/66wdjrr6/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>  

Trong ví dụ trên, hình nền được hiển thị trong cùng một vị trí với các văn bản. Nếu chúng ta muốn thay đổi vị trí của ảnh thì có thể sử dụng thuộc tính `background-position`:

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/z7djeqd8/1/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

#### Hình nền - Cố định vị trí

Để quy định hình nền cố định (sẽ không di chuyển với phần còn lại của trang), chúng ta sử dụng thuộc tính `background-attachment`:  
  
  
<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/cr30rfpe/1/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>  

#### Nền - Thuộc tính rút gọn

Chúng ta có thể rút ngắn các đoạn mã bằng cách sử dụng một thuộc tính duy nhất để quy định tất cả các giá trị của nền. Thuộc tính rút gọn đó là `background`:

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/ugd0xt51/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

Khi sử dụng thuộc tính rút gọn, thứ tự của các giá trị tương ứng với các thuộc tính là:

- `background-color`
- `background-image`
- `background-repeat`
- `background-attachment`
- `background-position`

Chúng ta có thể bỏ qua giá trị của một số thuộc tính, nhưng cần phải tuân thủ thứ tự trên.

Last modified: Sunday, 5 June 2022, 11:55 PM