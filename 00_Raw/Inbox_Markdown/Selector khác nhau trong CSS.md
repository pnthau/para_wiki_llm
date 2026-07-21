---
title: "BC-JAVA-JWBD_2.1: [Bài đọc] Các bộ chọn (selector) khác nhau trong CSS"
source: "https://james.codegym.vn/mod/page/view.php?id=9979&forceview=1"
author:
published:
created: 2026-06-06
description:
tags:
  - "clippings"
---
## \[Bài đọc\] Các bộ chọn (selector) khác nhau trong CSS

## Mục tiêu

Sử dụng được các bộ chọn CSS (selector) để thao tác với HTML.

## Nội dung

Các bộ chọn CSS (selector) cho phép chúng ta chọn và thao tác với các phần tử HTML mà mình mong muốn.

Bộ chọn được sử dụng để "tìm" (hoặc chọn) phần tử HTML dựa trên id, class, loại thẻ, các thuộc tính, và nhiều thứ khác của phần tử HTML.

#### Bộ chọn phần tử

Bộ chọn Phần tử (element selector) dựa vào **tên** của các phần tử (thẻ) HTML.

Chẳng hạn, chúng ta có thể chọn tất cả các phần tử <p> trên một trang như thế này (trong trường hợp này, tất cả các văn bản nằm trong thẻ <p> sẽ được căn giữa và có màu đỏ):

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/q4tq9zrj/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

#### Bộ chọn id

Bộ chọn id sử dụng thuộc tính **id** của một phần tử HTML để chỉ định cụ thể một phần tử HTML nào đó.

Một **id** nên là duy nhất trong một trang, do đó bộ chọn **id** được sử dụng khi muốn áp dụng kiểu cho một phần tử duy nhất nào đó trên trang.

Để chọn một phần tử với một id cụ thể, chỉ cần viết kí hiệu # trước id (giá trị của thuộc tính id) của phần tử đó.

Quy tắc kiểu dưới đây sẽ được áp dụng cho các phần tử HTML với **id = "para1"**:

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/t4c77wrq/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

Lưu ý: Không được đặt id bắt đầu bằng một chữ số hay ký tự đặc biệt.

#### Bộ chọn class

Bộ chọn class (class selector) chọn các phần tử có thuộc tính class với một giá trị cụ thể.

Để chọn các phần tử với một class cụ thể, chỉ cần viết thêm dấu chấm **(.)** trước tên của class:

Trong ví dụ dưới đây, tất cả các phần tử HTML với class="center" sẽ có văn bản được căn giữa và màu đỏ.

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/dkh9oo5b/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

Chúng ta cũng có thể kết hợp giữa các bộ chọn khác nhau để tạo nên một bộ chọn mới. Chẳng hạn là kết hợp giữa bộ chọn phần tử với bộ chọn class.

Trong ví dụ dưới đây, chỉ những phần tử <p> với class="center" có văn bản được căn giữa và màu đỏ:

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/89q6h8wq/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

#### Gộp các bộ chọn lại với nhau

Trường hợp chúng ta có nhiều phần tử được định nghĩa kiểu giống nhau, chẳng hạn như:

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/fc7ufu1r/embedded/css/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

Chúng ta có thể gộp chúng lại với nhau để giảm bớt mã nguồn và dễ điều chỉnh hơn.

Cách làm ở đây là phân tách các bộ chọn bởi dấu phẩy (,).

Sau khi gộp 3 bộ chọn ở trên thì chúng ta sẽ được một bộ chọn mới nhỏ gọn như sau:

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/zy4rxhLd/embedded/css/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

Last modified: Sunday, 12 March 2023, 1:40 PM