
## Mục tiêu

Tìm hiểu về Transaction và cách triển khai Transaction.

## Nội dung

Transaction (giao tác) là một tiến trình xử lý, có điểm bắt đầu và điểm kết thúc, gồm nhiều phép thực thi nhỏ, trong đó mỗi phép thực thi được thực thi một cách tuần tự và độc lập theo nguyên tắc là tất cả thành công hoặc một phép thực thi thất bại thì cả tiến trình thất bại.

Các thuộc tính ACID miêu tả rõ ràng nhất về Transaction. 4 thuộc tính này bao gồm Atomicity, Consistency, Isolation và Durability, trong đó:

- Atomicity nghĩa là tất cả thành công hoặc không.
    
- Consistency bảo đảm rằng tính đồng nhất của dữ liệu.
    
- Isolation bảo đảm rằng Transaction này là độc lập với Transaction khác.
    
- Durability nghĩa là khi một Transaction đã được ký thác thì nó sẽ vẫn tồn tại như thế cho dù xảy ra các lỗi, …
    

Theo mặc định, kết nối JDBC của bạn là trong chế độ auto-commit, tức là mỗi lệnh SQL được ký thác tới Database mỗi khi nó kết thúc. Điều này là tốt với các ứng dụng nhỏ khi mà số lượng đơn vị công việc là nhỏ và không phức tạp. Với các ứng dụng trung bình và lớn, việc quản lý riêng Transaction giúp bạn cải thiện rõ rệt hiệu suất và duy trì tính toàn vẹn của tiến trình.

Trong JDBC, Connection Interface cung cấp các phương thức sau để quản lý transaction:

1. void setAutoCommit(boolean status)

Là true theo mặc định. Để thao tác với Transaction, bạn nên thiết lập về false.

2. void commit()

Để ký thác các thay đổi bạn đã thực hiện.

3. void rollback()

Xóa tất cả các thay đổi đã được thực hiện trước đó và quay về trạng thái trước khi thực hiện thay đổi.

4. setSavepoint(String ten_cua_savepoint)

Định nghĩa một savepoint mới. Phương thức này cũng trả về một đối tượng Savepoint.

5. releaseSavepoint(Savepoint ten_cua_savepoint)

Xóa một savepoint. Phương thức này nhận một đối tượng Savepoint làm tham số.

6. rollback (String ten_cua_savepoint)

Quay về trạng thái của savepoint đã cho.

**I. Demo**  
1: Commit và Rollback

để thực hiện quản lý Transaction cho riêng mình, đầu tiên bạn cần tắt chế độ auto-commit bởi truyền tham số false cho phương thức setAutoCommit().

Sau đó, khi bạn đã thực hiện các thay đổi với cơ sở dữ liệu và muốn ký thác các thay đổi đó, bạn sử dụng phương thức commit(). Hoặc bạn muốn xóa các thay đổi đã được thực hiện trước đó để quay về trạng thái trước khi thực hiện thay đổi khi thấy rằng có lỗi xảy ra, bạn sử dụng phương thức rollback().

Dưới đây là ví dụ minh họa cho hai hoạt động trên.

```


package com.demoSavepoint.jdbc;

```

 bạn đã thấy cách sử dụng của phương thức rollback() để xóa tất cả các thay đổi và quay trở về trạng thái trước khi ký thác. Với tình huống xảy ra là nếu một lỗi logic xuất hiện ở gần phần cuối hoặc phần giữa của giao tác, chẳng lẽ bạn phải xóa và bỏ tất cả để quay về trạng thái trước đó. Điều này thật lãng phí thời gian và rất vất vả.

Bây giờ bạn sử dụng setSavepoint(String ten_cua_savepoint) để định nghĩa một savepoint và khi có lỗi xảy ra ở khu vực savepoint nào, bạn quay về savepoint đó với phương thức rollback(String ten_cua_savepoint). Điều này đem lại cho bạn tiện lợi và nâng cao hiệu suất rất nhiều.

Dưới đây là ví dụ minh họa cho việc sử dụng savepoint trong JDBC:

```
package com.demoSavepoint.jdbc; 

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
   Statement stmt = null;
   try{
      // Buoc 2: Dang ky Driver
      Class.forName("com.mysql.jdbc.Driver");

      // Buoc 3: Mo mot ket noi
      System.out.println("Dang ket noi toi co so du lieu ...");
      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      // Buoc 4: Thiet lap auto commit la false.
      conn.setAutoCommit(false);

      // Buoc 5: Thuc thi truy van
      
      System.out.println("Tao cac lenh truy van SQL ...");
      stmt = conn.createStatement();

	  // Buoc 6: Liet ke tat ca ban ghi co san.
      String sql = "SELECT mssv, ho, ten, diemthi FROM sinhvienk60";
      ResultSet rs = stmt.executeQuery(sql);
      System.out.println("Liet ke result set de tham chieu ...");
      printRs(rs);

      //  Buoc 7: Xoa cac hang co mssv > 4
      // Chung ta tao savepoint truoc khi thuc hien hoat dong nay.
      Savepoint savepoint1 = conn.setSavepoint("ROWS_DELETED_1");
      System.out.println("\nXoa hang ...");
      String SQL = "DELETE FROM sinhvienk60 " +
                   "WHERE mssv=3";
      stmt.executeUpdate(SQL);  
      // Oh my God. Chung ta da xoa sai sinh vien!
      // Buoc 8: Rollback cac thay doi sau save point 2.
      conn.rollback(savepoint1);

    //  Buoc 9: Xoa cac hang co mssv > 4
      // Chung ta tao savepoint truoc khi thuc hien hoat dong nay
      Savepoint savepoint2 = conn.setSavepoint("ROWS_DELETED_2");
      System.out.println("\nXoa hang ...");
      SQL = "DELETE FROM sinhvienk60 " +
                   "WHERE mssv=1";
      stmt.executeUpdate(SQL);  

	  // Buoc 10: Liet ke tat ca ban ghi co san.
      sql = "SELECT mssv, ho, ten, diemthi FROM sinhvienk60";
      rs = stmt.executeQuery(sql);
      System.out.println("\nLiet ke result set de tham chieu ...");
      printRs(rs);

      // Buoc 10: Don sach moi truong va giai phong resource
      rs.close();
      stmt.close();
      conn.close();
   }catch(SQLException se){
      // Xu ly cac loi cho JDBC
      se.printStackTrace();
      // Neu xuat hien loi thi xoa sach cac thay doi
      // va tro ve trang thai truoc khi co thay doi.
      System.out.println("\nRollback tai day ...");
	  try{
		 if(conn!=null)
            conn.rollback();
      }catch(SQLException se2){
         se2.printStackTrace();
      }// Ket thuc khoi try

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
   System.out.println("\n Chuc cac ban hoc tot!");
}// Ket thuc main

   public static void printRs(ResultSet rs) throws SQLException{
      // Bao dam rang ban bat dau tu hang dau tien
      rs.beforeFirst();
      while(rs.next()){
         // Lay du lieu boi su dung ten cot
         int mssv  = rs.getInt("mssv");
         int diemthi = rs.getInt("diemthi");
         String ho = rs.getString("ho");
         String ten = rs.getString("ten");

         // Hien thi cac gia tri
       System.out.print("\nMSSV: " + mssv);
       System.out.print("\nHo: " + ho);
       System.out.println("\nTen: " + ten);
       System.out.print("\nDiem Thi: " + diemthi);
       System.out.print("\n=================");
     }
     System.out.println();
   }// Ket thuc printRs()
}// Ket thuc ViDuJDBC
```