---
title: "BC-JAVA-JWBD_2.1: [Bài Đọc] Cơ sở dữ liệu quan hệ"
source: "https://james.codegym.vn/mod/page/view.php?id=9928"
author:
published:
created: 2026-05-27
description:
tags:
  - "clippings"
---
## 1\. Lưu trữ dữ liệu dưới dạng hệ thống tập tin

Khi sử dụng máy tính thông thường ta sẽ lưu trữ thông tin dưới dạng file, và mỗi file ta sẽ đặt nó trong những folder có tên khác nhau nhằm mục đích dễ dàng tìm đến. Với cách này ta sẽ có những ưu điểm và nhược điểm như sau:

Ưu điểm:

- Với việc lưu trữ này thì rõ ràng khi ta cần là lưu ngay nên tốc độ triển khai sẽ nhanh
- Rõ ràng và trực quan với người không có chuyên môn công nghệ thông tin

Khuyết điểm:

- Dữ liệu không nhất quán, đôi khi có trường hợp nhiều người sử dụng một file và sẽ xảy ra hiện tượng lưu đè.
- Trùng lặp dữ liệu nhiều, dữ liệu không nhất quán
- Tính chia sẽ dữ liệu không cao (kém)

Hiện nay các cá nhân sử dụng máy tính đa số sử dụng cách lưu trữ này để lưu trữ thông tin cho riêng mình, nên nói về sự phổ biến thì cách này phổ biến nhất, tuy nhiên với những hệ thống dữ liệu lớn thì sẽ có rất nhiều hạn chế như việc truy xuất tìm kiếm dữ liệu sẽ chậm, khó bảo quản,... Với những hạn chế trên thì khái niệm cơ sở dữ liệu và hệ quản trị cơ sở dữ liệu được ra đời.

## 2\. Cơ sở dữ liệu là gì?

Cơ sở dữ liệu là một hệ thống các thông tin có cấu trúc, được lưu trữ trên các thiết bị lưu trữ nhằm thỏa mãn yêu cầu khai thác thông tin đồng thời của nhiều người sử dụng hay nhiều chương trình ứng dụng chạy cùng một lúc với những mục đích khác nhau.

Việc sử dụng hệ thống CSDL này sẽ khắc phục được những khuyết điểm của cách lưu trữ dưới dạng hệ thống tập tin, đó là

- Giảm trùng lặp thông tin ở mức thấp nhất, đảm bảo tính nhất quán và toàn vẹn dữ liệu
- Đảm bảo dữ liệu được truy xuất theo nhiều cách khác nhau, từ nhiều người khác nhau và nhiều ứng dụng khác nhau.
- Tăng khả năng chia sẽ thông tin. Ví dụ nếu ta đặt hệ thống dữ liệu tại Việt Nam thì ở bên Mỹ nếu có password logi vào thì ta hoàn toàn có thể vào hệ thống để đọc tin

Tuy nhiên việc sử dụng hệ quản trị CSDL lại có những phiền hà không hề nhỏ sau đây:

- Phải đảm bảo tính chủ quyền của dữ liệu, vì khi sử dụng có tính chất chia sẻ cao
- Bảo mật quyền khai thác thông tin
- Bảo đảm vấn đề tranh chấp dữ liệu khi xảy ra
- Khi gặp các trục trặc sự cố thì phải bảo đảm vấn đề an toàn dữ liệu, không bị mất dữ liệu

Trong cuộc sống hằng ngày chắc hẳn bạn có sử dụng qua các hệ thống CSDL nhưng bạn lại không biết. Chẳng hạn hằng ngày bạn vào đọc bài tin tức từ các trang báo, ở mỗi trang họ có dùng một hệ thống lưu trữ dữ liệu và khi bạn vào xem hệ thống sẽ trả dữ liệu về màn hình trình duyệt cho bạn xem. Rõ ràng bạn có thể truy cập một lúc nhiều trang và nhiều người có thể đọc một trang cùng một lúc được, nhưng vẫn đảm bảo tính toàn vẹn dữ liệu không bị sai lệch.

Đương nhiên khi sử dụng các hệ thống CSDL thì bạn phải có một hệ quản trị CSDL. Hiện nay có rất nhiều hệ quản trị CSDL như MYSQL, SQL SERVER, Oracle, MS Access.Trong loạt serie này ta sẽ tìm hiểu hệ quản trị CSDL MYSQL.

## 3\. Hệ quản trị cơ sở dữ liệu MYSQL

Mysql là một hệ quản trị CSDL được sử dụng rất rộng rãi trên thế giới, đặc biệt là các ứng dụng website và nó thường đi kết hợp với ngôn ngữ lập trình PHP để xây dựng các ứng dụng website. Các hệ thống web ưa chuộng MYSQL là tại vì tốc độ xử lý của nó cao, tính dễ sử dụng và thương thích với các hệ điều hành thông dụng hiện nay như Linux, Window,... Mysql có sử dụng ngôn ngữ truy vấn SQL để thao tác dữ liệu.