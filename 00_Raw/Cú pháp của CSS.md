---
title: "BC-JAVA-JWBD_2.1: [Bài đọc] Cú pháp của CSS"
source: "https://james.codegym.vn/mod/page/view.php?id=9977&forceview=1"
author:
published:
created: 2026-06-06
description:
tags:
  - "clippings"
---
## \[Bài đọc\] Cú pháp của CSS

## Mục tiêu

Tìm hiểu về cú pháp của CSS, cách viết chú thích trong CSS.

## Nội dung

#### Cấu trúc của một Bộ quy tắc trong CSS

Một Bộ Quy tắc (rule) CSS bao gồm một bộ chọn (selector) và một khối khai báo các thuộc tính:

![](https://james.codegym.vn/pluginfile.php/50285/mod_page/content/4/selector.gif)

Bộ chọn (Selector) chỉ tới các phần tử HTML mà chúng ta muốn áp dụng kiểu.

Khối khai báo (Declaration) bao gồm một hoặc nhiều khai báo thuộc tính phân tách nhau bằng dấu chấm phẩy.

Mỗi khai báo thuộc tính bao gồm một tên thuộc tính (Property) và giá trị (Value) của thuộc tính, phân tách nhau bằng dấu hai chấm.

Một khai báo CSS luôn luôn kết thúc với một dấu chấm phẩy, và các nhóm khai báo đặt trong một cặp ngoặc nhọn ({}).

Trong ví dụ sau, tất cả các phần tử <p> sẽ được căn giữa và có màu đỏ

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/bu81dyqb/embedded/html,css,result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

#### Chú thích trong CSS

Chú thích (comment) được sử dụng để giải thích ý nghĩa của mã nguồn, chúng giúp cho người khác hiểu mã nguồn do chúng ta viết ra, hoặc giúp cho chính chúng ta nếu sau này muốn chỉnh sửa mã nguồn. Các trình duyệt sẽ không xử lý các phần chú thích, chúng sẽ bỏ qua các đoạn chú thích này.

Một chú thích trong CSS bắt đầu với cặp kí hiệu /\* và kết thúc với cặp kí hiệu \*/. Chúng ta có thể viết chú thích trên nhiều dòng.

<iframe width="100%" height="300" src="https://jsfiddle.net/khacnhat/uxdfv3vL/embedded/css/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>  

Last modified: Friday, 3 June 2022, 2:03 PM