---
title: "BC-JAVA-JWBD_2.1: [Bài đọc] Phông chữ với CSS"
source: "https://james.codegym.vn/mod/page/view.php?id=9983&forceview=1"
author:
published:
created: 2026-06-06
description:
tags:
  - "clippings"
---
## \[Bài đọc\] Phông chữ với CSS

## Mục tiêu

Chỉnh sửa được phông chữ của HTML bằng CSS.

## Nội dung

Các thuộc tính CSS về phông chữ (font) xác định phông chữ nào, nét chữ, kích cỡ, và kiểu chữ của văn bản. Sự khác biệt giữa các phông Serif và Sans serif.

![](https://james.codegym.vn/pluginfile.php/50291/mod_page/content/4/fonts-css.png)

## Các phông chữ trong CSS

Trong CSS, có hai loại phông chữ (font family):

- generic family - một nhóm các phông chữ trông tương tự nhau (như "Serif" hoặc "Monospace")
- font family - một phông chữ cụ thể (như "Times New Roman" hoặc "Arial")

## Font Family

Font family (Phông chữ) của văn bản được thiết lập bởi thuộc tính **font-family**.  
Thuộc tính font-family cần một số tên phông chữ như là một hệ thống "dự phòng". Nếu trình duyệt không hỗ trợ phông chữ đầu tiên, nó sẽ thử phông chữ tiếp theo, và cứ như vậy. Bắt đầu với phông chữ bạn muốn, và kết thúc với một "generic family", để trình duyệt tự chọn một phông chữ tương tự "generic family", nếu phông chữ khác không có sẵn.  
Lưu ý: Nếu tên của một phông chữ nhiều hơn một từ, nó phải đặt trong dấu nháy kép, ví dụ: "Times New Roman".  
Nếu chỉ định nhiều hơn một phông chữ, thì dùng dấu phẩy (,) để ngăn cách giữa chúng:

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/6ofy2k78/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>Việc kết hợp các phông chữ thường được sử dụng, mời bạn tham khảo tại trang [Web Safe Font Combinations](http://www.w3schools.com/cssref/css_websafe_fonts.asp).  

## Loại phông chữ

Thuộc tính font-style chủ yếu được sử dụng để chỉ định in nghiêng văn bản. Thuộc tính này có 3 giá trị:

- normal - Văn bản hiển thị bình thường
- italic - Văn bản được hiển thị in nghiêng
- oblique - Văn bản bị "nghiêng (xiên)" (xiên tương tự như in nghiêng, nhưng ít được hỗ trợ hơn)

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/w6xf5hz1/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

## Kích cỡ phông chữ

Thuộc tính **font-size** dùng để thiết lập kích cỡ của văn bản.  
Khả năng quản lý kích cỡ văn bản là điều quan trọng trong thiết kế web. Tuy nhiên, bạn không nên sử dụng điều chỉnh kích cỡ phông chữ để làm cho đoạn văn trông giống như tiêu đề, hoặc tiêu đề trông giống như đoạn văn.  
Luôn luôn sử dụng các thẻ HTML thích hợp, như <h1> - <h6> cho tiêu đề và <p> cho đoạn văn.  
Giá trị của thuộc tính font-sizecó thể là tuyệt đối hay tương đối.  
  
Kích cỡ tuyệt đối:

- Thiết lập văn bản có một kích cỡ cụ thể
- Không cho phép người dùng thay đổi kích cỡ văn bản trong tất cả các trình duyệt (tệ cho khả năng tiếlp cận)
- Kích cỡ tuyệt đối là hữu ích khi kích biết rõ thước vật lý của đầu ra

###### Kích cỡ tương đối:

- Đặt kích cỡ tương đối so với các thành phần xung quanh
- Cho phép người dùng thay đổi kích cỡ văn bản trong các trình duyệt

## Kích cỡ phông chữ theo Pixel

Thiết lập kích cỡ văn bản với pixel (điểm ảnh) cho bạn kiểm soát hoàn toàn kích cỡ văn bản.

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/xjLauxx1/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>**Mẹo**: Nếu bạn sử dụng pixel, bạn vẫn có thể sử dụng công cụ phóng to\\thu nhỏ (zoom) để thay đổi kích cỡ toàn trang.

## Kích thước phông chữ theo Em

Để cho phép người dùng thay đổi kích cỡ văn bản (trong trình đơn của trình duyệt), nhiều nhà phát triển sử dụng đơn vị em thay cho pixel (px). Đơn vị kích cỡ em được khuyến cáo bởi W3C. 1em tương đương với kích cỡ của phông chữ hiện thời. Kích cỡ mặc định của văn bản trong trình duyệt là 16px. Vì vậy, mặc định 1em = 16px. Kích cỡ có thể được tính từ pixel sang em bằng cách sử dụng công thức: pixel / 16 = em

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/ht18q6ej/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>Trong ví dụ trên, kích cỡ văn bản theo đơn vị "em" là giống như ví dụ trước đó theo pixel. Tuy nhiên, với kích cỡ "em", nó có thể điều chỉnh kích cỡ văn bản trong tất cả các trình duyệt.

## Sử dụng kết hợp giữa phần trăm (%) và em

Giải pháp mà làm việc trên tất cả các trình duyệt, là đặt font-size mặc định theo phần trăm cho phần tử <body>:

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/6xkjrLLt/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>Bây giờ mã của chúng ta hoạt động tốt! Nó cho thấy kích cỡ văn bản giống nhau trong tất cả các trình duyệt, và cho phép tất cả các trình duyệt zoom hoặc thay đổi kích cỡ văn bản!

## Font weight

Thuộc tính font-weight xác định độ đậm (độ nặng) của phông chữ.

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/7tjbugeo/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

## Font variant

Thuộc tính font-variant xác định có hay không một văn bản sẽ được hiển thị với một phông chữ small-caps (chữ hoa có kích cỡ bằng chữ thường). Trong phông chữ small-caps, tất cả các chữ thường được chuyển đổi thành chữ hoa. Tuy nhiên, các chữ được chuyển đối thành hoa hiển thị với kích cỡ nhỏ hơn so với các chữ hoa ban đầu trong văn bản.

### Ví dụ

<iframe src="https://jsfiddle.net/khacnhat/h4twqxzo/embedded/html,css,result/" allowfullscreen="allowfullscreen" width="100%" height="300" frameborder="0"></iframe>

Last modified: Friday, 3 June 2022, 4:49 PM