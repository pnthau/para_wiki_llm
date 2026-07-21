
## Mục tiêu

Tìm hiểu về CallableStatement Interface trong JDBC.

## Nội dung

CallableStatement Interface được sử dụng để thực thi Stored Procedure. Một đối tượng CallableStatement có thể trả về một hoặc nhiều đối tượng ResultSet. Như bạn đã biết, việc sử dụng Stored Procedure giúp nâng cao hiệu suất bởi vì chúng đã được biên dịch trước.

Nếu bạn chưa tìm hiểu về Stored Procedure, thì dưới đây mình liệt kê một số điểm khác nhau giữa Stored Procedure và hàm để bạn dễ theo dõi:

|Stored Procedure|Hàm|
|---|---|
|Được sử dụng để thực hiện một trình logic nào đó|Được sử dụng để thực hiện phép tính toán|
|Không bắt buộc phải có kiểu trả về|Phải có kiểu trả về|
|Có thể trả về 0 hoặc nhiều giá trị|Có thể trả về chỉ một giá trị|
|Chúng ta có thể gọi hàm từ procedure|Procedure không thể được gọi từ hàm|
|Procedure hỗ trợ các tham số input và output|Hàm chỉ hỗ trợ các tham số input|
|Xử lý ngoại lệ với khối try/catch có thể được sử dụng trong procedure|Xử lý ngoại lệ với try/catch không thể được sử dụng trong các hàm do người dùng tự định nghĩa|

## Tạo đối tượng CallableStatement trong JDBC

Đầu tiên, bạn tạo một stored procedure đơn giản trong MySQL để lấy tên sinh viên như sau:

```
DELIMITER $$

DROP PROCEDURE IF EXISTS `sinhvien`.`getTenSV` $$
CREATE PROCEDURE `sinhvien`.`getTenSV` 
   (IN MS_SINHVIEN INT, OUT TEN_SINHVIEN VARCHAR(255))
BEGIN
   SELECT ten INTO TEN_SINHVIEN
   FROM sinhvienk60
   WHERE MSSV = MS_SINHVIEN;
END $$

DELIMITER ;
```

Chạy đoạn code trên trong MySQL của bạn sẽ tạo một Stored Procedure. Trong đó:

- sinhvien là tên cơ sở dữ liệu.
    
- getTenSV là tên của stored procedure.
    
- sinhvienk60 là tên bảng.
    
- Bạn cũng phải chú ý các DELIMITER $$ và DELIMITER ;, hai cái này là không thể thiếu.
    

Có ba kiểu tham số là IN, OUT và INOUT. Đối tượng PreparedStatement chỉ sử dụng tham số IN, trong khi đối tượng CallableStatement có thể sử dụng cả ba tham số này.

- Tham số IN: Là một tham số mà giá trị của nó chưa được biết khi lệnh SQL được tạo. Bạn gắn kết các giá trị tới các tham số IN bởi các phương thức setXXX().
    
- Tham số OUT: Là một tham số mà giá trị của nó được cung cấp bởi lệnh SQL nó trả về. Giá trị của chúng được thu nhận thông qua phương thức getXXX(). Trong đó, kiểu của tất cả tham số OUT phải được đăng ký trước khi thực thi stored procedure.
    
- Tham số INOUT: Là một tham số mà cung cấp cả giá trị input và output. Bạn gắn kết các biến với phương thức setXXX() và thu nhận giá trị với phương thức getXXX().
    

Để lấy instance của đối tượng CallableStatement, bạn sử dụng phương thức prepareCall() của Connection Interface. Dưới đây là cú pháp của phương thức này:

```
public CallableStatement prepareCall("{ call ten_procedure(?,?...?)}");  
```  

Trong đó, mỗi dấu ? đại diện cho một tham số. Tiếp theo, bạn theo dõi mẫu code để gọi một stored procedure. Bạn để ý rằng ở đây getEmp nhận hai tham số:

```
CallableStatement cstmt = null;
try {
   String SQL = "{call getTenSV (?, ?)}";
   cstmt = conn.prepareCall (SQL);
   . . .
}
catch (SQLException e) {
   . . .
}
finally {
   . . .
}
```

## Đóng đối tượng CallableStatement trong JDBC

Để đóng đối tượng CallableStatement, bạn sử dụng phương thức close() theo mẫu sau:

```
CallableStatement cstmt = null;
try {
   String SQL = "{call getTenSV (?, ?)}";
   cstmt = conn.prepareCall (SQL);
   . . .
}
catch (SQLException e) {
   . . .
}
finally {
   cstmt.close();
}
```

## Ví dụ về đối tượng CallableStatement trong JDBC

```
package com.codegym.jdbc; 

//Buoc 1: Ban can inport cac package can thiet
import java.sql.*;

public class ViDuJDBC {
   // Ten cua driver va dia chi URL cua co so du lieu
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/sinhvien";

   //  Ten nguoi dung va mat khau cua co so du lieu
   static final String USER = "root";
   static final String PASS = "123456";
   
   public static void main(String[] args) {
   Connection conn = null;
   CallableStatement stmt = null;
   try{
      // Buoc 2: Dang ky Driver
      Class.forName("com.mysql.jdbc.Driver");

      // Buoc 3: Mo mot ket noi
      System.out.println("Dang ket noi toi co so du lieu ...");
      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      // Buoc 4: Thuc thi truy van
      System.out.println("Tao cac lenh truy van SQL ...");
      String sql = "{call getTenSV (?, ?)}";
      stmt = conn.prepareCall(sql);
      
      // Dau tien gan ket tham so IN, sau do la tham so OUT
      int MS_SINHVIEN = 2;
      stmt.setInt(1, MS_SINHVIEN); // Lenh nay thiet lap mssv la 2
      // Dang ky tham so thu hai
      stmt.registerOutParameter(2, java.sql.Types.VARCHAR);
      
      // Su dung phuong thuc execute de chay stored procedure.
      System.out.println("Thuc thi stored procedure ..." );
      stmt.execute();

      // Lay ten sinh vien voi phuong thuc getXXX
      String TEN_SINHVIEN = stmt.getString(2);
      System.out.println("Ten sinh vien co MSSV: " + 
               MS_SINHVIEN + " la " + TEN_SINHVIEN);
      stmt.close();
      conn.close();
   }catch(SQLException se){
      // Xu ly cac loi cho JDBC
      se.printStackTrace();
   }catch(Exception e){
      // Xu ly cac loi cho Class.forName
      e.printStackTrace();
   }finally{
      // Khoi finally duoc su dung de dong cac resource
      try{
         if(stmt!=null)
            stmt.close();
      }catch(SQLException se2){
      } 
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }// Ket thuc khoi finally
   }// Ket thuc khoi try
}// Ket thuc main
}// 
```