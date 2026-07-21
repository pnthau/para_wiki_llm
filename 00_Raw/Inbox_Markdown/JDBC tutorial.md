
## Mục tiêu

Tìm hiểu về JDBC(Java Database Connectivity) và các thành phần trong JDBC.

## Nội dung

### JDBC là gì?

JDBC, là viết tắt của Java Database Connectivity, là một Java API chuẩn để kết nối giữa ngôn ngữ lập trình Java và các cơ sở dữ liệu đa dạng. Sử dụng JDBC, bạn có thể thực hiện nhiều tác vụ đa dạng khi làm việc với cơ sở dữ liệu như tạo, xóa cơ sở dữ liệu; tạo và thực thi các lệnh SQL hoặc MySQL; tạo, xóa các bản ghi; …

### Tại sao sử dụng JDBC?

Trước khi có JDBC, ODBC API được sử dụng là API để kết nối và thực thi truy vấn với cơ sở dữ liệu. Nhưng API này có một hạn chế rõ ràng là nó sử dụng ODBC driver được viết bằng ngôn ngữ C (là phụ thuộc nền tảng và không an toàn).

Do đó, Java đã định nghĩa riêng API (là JDBC API) để thực hiện các thao tác khi làm việc với cơ sở dữ liệu, và tất nhiên các JDBC driver này được viết bằng ngôn ngữ Java để cung cấp các lợi thế rõ rệt của ngôn ngữ này.

### API là gì?

Chúng ta đã nhắc nhiều đến API, vậy nó là gì? API, là viết tắt của Application Programming Interface, là một tài liệu gồm sự mô tả về tất cả các đặc điểm của một sản phẩm hoặc phần mềm. Nó biểu diễn các Class và Interface mà các chương trình phần mềm có thể theo sau để giao tiếp với nhau. Một API có thể được tạo cho các ứng dụng, các thư viện, các hệ điều hành, …

### Các thành phần của JDBC

JDBC API cung cấp các Class và Interface sau:

- DriverManager: Lớp này quản lý các Database Driver. Ánh xạ các yêu cầu kết nối từ ứng dụng Java với Data driver thích hợp bởi sử dụng giao thức kết nối phụ.
    
- Driver: Interface này xử lý các kết nối với Database Server. Hiếm khi, bạn tương tác trực tiếp với các đối tượng Driver này. Thay vào đó, bạn sử dụng các đối tượng DriverManager để quản lý các đối tượng kiểu này.
    
- Connection: Đối tượng Connection biểu diễn ngữ cảnh giao tiếp. Interface này chứa nhiều phương thức đa dạng để tạo kết nối với một Database.
    
- Statement: Bạn sử dụng các đối tượng được tạo từ Interface này để đệ trình các lệnh SQL tới Database. Ngoài ra, một số Interface kết thừa từ nó cung chấp nhận thêm các tham số để thực thi các thủ tục đã được lưu trữ.
    
- ResultSet: Các đối tượng này giữ dữ liệu được thu nhận từ một Database sau khi bạn thực thi một truy vấn SQL. Nó nóng vai trò như một Iterator để cho phép bạn vọc qua dữ liệu của nó.
    
- SQLException: Lớp này xử lý bất cứ lỗi nào xuất hiện trong khi làm việc với Database.