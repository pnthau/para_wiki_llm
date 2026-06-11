# 📂 CẤU TRÚC DỰ ÁN SERVLET & JSP (MVC PATTERN)
## WEB TRANG SỨC PHONG THỦY (JAVA CORE + JDBC THUẦN)

> **Mục tiêu:** Định hình cấu trúc thư mục và các lớp Java theo mô hình MVC chuẩn, giúp code JDBC thuần sạch sẽ, dễ bảo trì và phân tách rõ ràng giữa Admin và User.

---

### 🗂️ 1. Cấu trúc thư mục dự án (Directory Structure)

```text
src/main/
├── java/
│   └── com/
│       └── fengshui/
│           ├── model/          (Các lớp thực thể POJO)
│           │   ├── User.java
│           │   ├── Product.java
│           │   ├── Order.java
│           │   ├── OrderItem.java
│           │   └── InventoryTransaction.java (Quản lý nhập xuất - Mới)
│           │
│           ├── dao/            (Lớp truy vấn DB bằng JDBC thuần)
│           │   ├── BaseDAO.java     (Chứa kết nối DB dùng chung)
│           │   ├── UserDAO.java
│           │   ├── ProductDAO.java
│           │   ├── OrderDAO.java
│           │   └── InventoryDAO.java (Truy vấn kho - Mới)
│           │
│           ├── controller/     (Các Servlet xử lý HTTP Request)
│           │   ├── admin/      (Quản trị hệ thống)
│           │   │   ├── DashboardController.java  (Thống kê doanh thu)
│           │   │   ├── ProductController.java    (CRUD sản phẩm)
│           │   │   ├── OrderController.java      (Duyệt đơn hàng)
│           │   │   └── InventoryController.java  (Nhập/Xuất kho - Mới)
│           │   │
│           │   └── user/       (Khách hàng mua sắm)
│           │       ├── HomeController.java       (Trang chủ)
│           │       ├── ProductListController.java(Tìm kiếm giọng nói, lọc mệnh)
│           │       ├── ProductDetailController.java(Xem chi tiết, nhúng YouTube)
│           │       ├── CartController.java       (Giỏ hàng lưu session/browser)
│           │       └── CheckoutController.java   (Đặt hàng nhanh)
│           │
│           └── filter/         (Bộ lọc kiểm soát quyền truy cập)
│               └── AdminFilter.java  (Chặn truy cập trái phép vào trang /admin)
│
└── webapp/             (Chứa giao diện JSP và tài nguyên tĩnh)
    ├── WEB-INF/
    │   ├── web.xml     (Cấu hình nếu không dùng @WebServlet)
    │   └── views/      (Thư mục JSP bảo mật, khách không truy cập trực tiếp được)
    │       ├── admin/
    │       │   ├── dashboard.jsp
    │       │   ├── product-list.jsp
    │       │   ├── order-list.jsp
    │       │   └── inventory.jsp                 (Mới)
    │       └── user/
    │           ├── home.jsp
    │           ├── product-list.jsp
    │           ├── product-detail.jsp
    │           └── checkout.jsp
    └── assets/         (Tài nguyên tĩnh)
        ├── css/        (Định dạng giao diện chữ to, dễ đọc)
        ├── js/         (Chứa logic tìm kiếm giọng nói Web Speech API)
        └── images/
```

---

### 🛠️ 2. Bản vẽ thiết kế các lớp Java cốt lõi (Java Classes Design)

#### A. Lớp `BaseDAO.java` (Quản lý Connection)
*Tránh lặp lại code mở kết nối Database trong các lớp DAO khác.*

```java
package com.fengshui.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/fengshui_db?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "password";

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
    }
}
```

#### B. Phân quyền bằng `AdminFilter.java` (Thay thế Spring Security)
*Chặn người dùng thường cố tình truy cập vào đường dẫn quản trị `/admin/*`.*

```java
package com.fengshui.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        // Kiểm tra xem admin đã đăng nhập chưa
        boolean loggedIn = (session != null && session.getAttribute("adminUser") != null);

        if (loggedIn) {
            chain.doFilter(request, response); // Cho phép đi tiếp vào trang admin
        } else {
            resp.sendRedirect(req.getContextPath() + "/login"); // Chưa đăng nhập thì đá về trang login
        }
    }
}
```

#### C. Lớp `ProductDAO.java` (Ví dụ truy vấn JDBC thuần cho lọc theo mệnh)
*Minh họa cách viết JDBC thuần đơn giản khi database được thiết kế phẳng.*

```java
package com.fengshui.dao;

import com.fengshui.model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends BaseDAO {
    
    // Tìm kiếm sản phẩm theo mệnh phong thủy
    public List<Product> getProductsByElement(String element) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE fengshui_element = ? AND status = 'ACTIVE'";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, element);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setPrice(rs.getBigDecimal("price"));
                    p.setMaterial(rs.getString("material"));
                    p.setImageUrl(rs.getString("image_url"));
                    p.setYoutubeUrl(rs.getString("youtube_url"));
                    p.setFengshuiElement(rs.getString("fengshui_element"));
                    p.setStatus(rs.getString("status"));
                    p.setDescription(rs.getString("description"));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
```

#### D. Lớp `InventoryDAO.java` (Quản lý Nhập/Xuất kho bằng JDBC thuần)
*Cho phép Admin thực hiện Nhập/Xuất kho thủ công. Việc cập nhật số lượng tồn kho của sản phẩm sẽ được tự động xử lý ở tầng Database thông qua Triggers.*

```java
package com.fengshui.dao;

import com.fengshui.model.InventoryTransaction;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InventoryDAO extends BaseDAO {

    // Thêm mới giao dịch Nhập/Xuất kho
    public boolean addTransaction(InventoryTransaction tx) {
        String sql = "INSERT INTO inventory_transactions (product_id, transaction_type, quantity, price, reason, created_by) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, tx.getProductId());
            ps.setString(2, tx.getTransactionType()); // 'IMPORT' hoặc 'EXPORT'
            ps.setInt(3, tx.getQuantity());
            ps.setBigDecimal(4, tx.getPrice());
            ps.setString(5, tx.getReason());
            ps.setInt(6, tx.getCreatedBy()); // ID của Admin thực hiện
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Lấy toàn bộ lịch sử biến động kho
    public List<InventoryTransaction> getAllTransactions() {
        List<InventoryTransaction> list = new ArrayList<>();
        String sql = "SELECT * FROM inventory_transactions ORDER BY created_at DESC";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                InventoryTransaction tx = new InventoryTransaction();
                tx.setId(rs.getInt("id"));
                tx.setProductId(rs.getInt("product_id"));
                tx.setTransactionType(rs.getString("transaction_type"));
                tx.setQuantity(rs.getInt("quantity"));
                tx.setPrice(rs.getBigDecimal("price"));
                tx.setReason(rs.getString("reason"));
                tx.setCreatedAt(rs.getTimestamp("created_at"));
                tx.setCreatedBy(rs.getInt("created_by"));
                list.add(tx);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
```
