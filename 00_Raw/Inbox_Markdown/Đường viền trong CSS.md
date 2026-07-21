---
title: "BC-JAVA-JWBD_2.1: [Bài đọc] Đường viền trong CSS"
source: "https://james.codegym.vn/mod/page/view.php?id=9984&forceview=1"
author:
published:
created: 2026-06-06
description:
tags:
  - "clippings"
---
## \[Bài đọc\] Đường viền trong CSS

## Mục tiêu

Sử dụng được đường viền bằng CSS.

## Nội dung

### Các thuộc tính CSS về đường viền

Các thuộc tính CSS về đường viền cho phép bạn xác định kiểu (style), chiều rộng và màu  
sắc cho đường viền của một phần tử nào đó.  
Phần tử này có viền kiểu là đường rãnh (groove), rộng 15px và màu xanh lá cây.

### Kiểu đường viền

Thuộc tính **border-style** chỉ định loại\\kiểu đường viền sẽ hiển thị. Các giá trị cho phép đối với thuộc tính này:

- dotted - đường viền là các điểm (dấu chấm)
- dashed - đường viền là các nét đứt
- solid - đường viền là nét liền mảnh
- double - đường viền là nét đôi
- groove - đường viền 3D có xẻ rãnh. Hiệu ứng phụ thuộc vào màu viền
- ridge - đường viền 3D tròn nổi. Hiệu ứng phụ thuộc vào màu viền
- inset - đường viền 3D khung chìm. Hiệu ứng phụ thuộc vào màu viền
- outset - đường viền 3D khung nổi. Hiệu ứng phụ thuộc vào màu viền
- none - không có đường viền
- hidden - đường viền ẩn

Thuộc tính border-style có thể có từ một đến bốn giá trị (thiết lập cho 4 đường viền trên (top), phải (right), dưới (bottom), và trái (left)).

#### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/x0sc5tqd/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

### Chiều rộng đường viền

Thuộc tính border-width chỉ định chiều rộng của bốn đường viền.

Chiều rộng có thể được thiết lập như với một giá trị cụ thể (trong px, pt, cm, em, v.v.) hoặc bằng cách sử dụng một trong ba giá trị được định nghĩa trước: thin, medium hoặc thick.

Thuộc tính border-width có thể có từ một đến bốn giá trị (đường viền trên, đường viền phải, đường viền dưới, và đường viền trái).

#### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/c8zce510/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

### Màu sắc đường viền

Thuộc tính border-color được sử dụng để thiết lập màu sắc của bốn đường viền (trên, dưới, trái, phải).

Màu sắc có thể được thiết lập theo các giá trị:

- Tên - chỉ định tên một màu sắc cụ thể (tiếng Anh), ví dụ "red"
- RGB - chỉ định một giá trị RGB, ví dụ "rgb(255,0,0)"
- Hex - chỉ định một giá trị hex, ví dụ "#ff0000"
- transparent - đường viền trong suốt

Thuộc tính border-color có thể có từ một đến bốn giá trị (cho đường viền trên, đường viền phải, đường viền dưới, và đường viền trái). Nếu border-color không được thiết lập, nó kế thừa màu sắc của các phần tử.

#### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/43p2wusj/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

### Đường viền - Các cạnh cụ thể

Từ những ví dụ ở trên, bạn đã thấy rằng có thể chỉ định một đường viền khác nhau cho mỗi cạnh của hộp.

Trong CSS, cũng có các thuộc tính để chỉ định cụ thể cho mỗi đường viền (trên (top), phải (right), dưới (bottom) và trái (left)):

#### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/szn9nao2/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

Ví dụ ở trên cho kết quả tương tự như sau:

#### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/970z6vwq/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

Vì vậy, đây là cách thức hoạt động của nó:

Nếu thuộc tính border-style có bốn giá trị:

- border-style: dotted solid double dashed;
	- đường viền trên là dotted
		- đường viền phải là solid
		- đường viền dưới là double
		- đường viền trái là dashed

Nếu thuộc tính border-style có 3 giá trị:

- border-style: dotted solid double;
	- đường viền trên là dotted
		- đường viền phải và trái là solid
		- đường viền dưới là double

Nếu thuộc tính border-style có hai giá trị:

- border-style: dotted solid;
	- đường viền trên và dưới là dotted
		- đường viền phải và trái là solid

Nếu thuộc tính border-style có một giá trị:

- border-style: dotted;
	- tất cả bốn cạnh đều có viền là dotted

### Đường viền - Thuộc tính rút gọn

Như bạn có thể thấy ở những ví dụ ở trên, có rất nhiều thuộc tính được xem xét khi làm việc với các đường viền.

Để rút gọn mã, chúng ta cũng có thể để xác định tất cả các thuộc tính đó trong một thuộc tính.

Thuộc tính border là thuộc tính rút gọn cho các thuộc tính sau đây:

- border-width
- border-style (required)
- border-color

#### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/zxdb4mfm/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

Last modified: Sunday, 5 June 2022, 11:32 PM