# 🗄️ THIẾT KẾ CƠ SỞ DỮ LIỆU CUỐI CÙNG (FINAL DATABASE SCHEMA)
## DỰ ÁN WEB TRANG SỨC PHONG THỦY (CHUYÊN NGHIỆP - CHUẨN 3NF)

> **Mục tiêu:** Cung cấp thiết kế cơ sở dữ liệu chuẩn hóa 3NF, tách biệt mối quan hệ Nhiều-Nhiều giữa Sản phẩm và Mệnh phong thủy bằng bảng trung gian `product_elements`. Đảm bảo hệ thống tối ưu hóa và dễ mở rộng.

---

### 🗺️ 1. Sơ đồ thực thể quan hệ (ERD)

```mermaid
erJiagram
    USERS ||--o{ PRODUCTS : "manages"
    PRODUCTS ||--o{ ORDER_ITEMS : "included_in"
    PRODUCTS ||--o{ PRODUCT_ELEMENTS : "has"
    ORDERS ||--o{ ORDER_ITEMS : "contains"

    USERS {
        int id PK "Khóa chính tự tăng"
        string username "Tên tài khoản quản trị (Admin)"
        string password "Mật khẩu quản trị (Mã hóa)"
        string role "Mặc định: 'ADMIN'"
    }

    PRODUCTS {
        int id PK "Khóa chính tự tăng"
        string name "Tên trang sức"
        decimal price "Giá sản phẩm"
        string material "Chất liệu (Đá quý, tuổi vàng)"
        string image_url "Đường dẫn ảnh chính"
        string youtube_url "Đường dẫn video YouTube thực tế (có thể NULL)"
        string status "ACTIVE (Hiển thị) / INACTIVE (Ẩn) / OUT_OF_STOCK (Hết)"
        text description "Bài viết mô tả chi tiết sản phẩm"
    }

    PRODUCT_ELEMENTS {
        int product_id PK, FK "Liên kết tới PRODUCTS.id"
        string element PK "Mệnh phù hợp: KIM/MOC/THUY/HOA/THO"
    }

    ORDERS {
        int id PK "Khóa chính tự tăng"
        string customer_name "Tên khách nhập lúc mua"
        string customer_phone "SĐT khách nhập (dùng để tra lịch sử)"
        string customer_address "Địa chỉ nhận hàng"
        decimal total_price "Tổng tiền đơn hàng"
        string status "PENDING (Chờ duyệt) / APPROVED (Đã duyệt) / CANCELLED (Hủy)"
        timestamp created_at "Ngày đặt đơn (Mặc định: CURRENT_TIMESTAMP)"
    }

    ORDER_ITEMS {
        int id PK "Khóa chính tự tăng"
        int order_id FK "Liên kết tới ORDERS.id"
        int product_id FK "Liên kết tới PRODUCTS.id"
        int quantity "Số lượng sản phẩm"
        decimal price_at_purchase "Lưu giá tại thời điểm mua thực tế"
    }
```

---

### 📋 2. Đặc tả chi tiết các bảng trong MySQL

#### Bảng 1: `users` (Chỉ dùng cho tài khoản quản trị - Admin)
| Tên trường (Column) | Kiểu dữ liệu | Thuộc tính (Constraints) | Ý nghĩa |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Khóa chính |
| `username` | `VARCHAR(50)` | `NOT NULL`, `UNIQUE` | Tài khoản đăng nhập Admin |
| `password` | `VARCHAR(255)` | `NOT NULL` | Mật khẩu (được mã hóa) |
| `role` | `VARCHAR(20)` | `DEFAULT 'ADMIN'` | Vai trò bảo mật |

---

#### Bảng 2: `products` (Thông tin sản phẩm trang sức phong thủy)
- *Lưu ý:* Cột `fengshui_element` đã được loại bỏ để đưa sang bảng trung gian.

| Tên trường (Column) | Kiểu dữ liệu | Thuộc tính (Constraints) | Ý nghĩa |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Khóa chính |
| `name` | `VARCHAR(255)` | `NOT NULL` | Tên trang sức |
| `price` | `DECIMAL(12,2)` | `NOT NULL` | Giá bán sản phẩm |
| `material` | `VARCHAR(100)` | | Mô tả chất liệu (Ví dụ: *Vàng non 10K, thạch anh*) |
| `image_url` | `VARCHAR(500)` | | Đường dẫn đến hình ảnh hiển thị trên web |
| `youtube_url` | `VARCHAR(500)` | `DEFAULT NULL` | Link video YouTube thực tế |
| `status` | `VARCHAR(50)` | `DEFAULT 'ACTIVE'` | Trạng thái: `'ACTIVE'` (Bán), `'INACTIVE'` (Ẩn), `'OUT_OF_STOCK'` (Hết) |
| `description` | `TEXT` | | Bài viết giới thiệu sản phẩm |

---

#### Bảng 3: `product_elements` (Bảng trung gian Sản phẩm - Mệnh phong thủy)
- **Mục đích:** Giải quyết triệt để quan hệ Nhiều-Nhiều. Một sản phẩm có thể tương thích với nhiều Mệnh phong thủy khác nhau.
- **Khóa chính (PK):** Là khóa tổ hợp gồm cả hai trường `(product_id, element)`.

| Tên trường (Column) | Kiểu dữ liệu | Thuộc tính (Constraints) | Ý nghĩa |
| :--- | :--- | :--- | :--- |
| `product_id` | `INT` | `FOREIGN KEY` -> `products(id)` ON DELETE CASCADE | ID sản phẩm |
| `element` | `VARCHAR(50)` | | Mệnh phù hợp: `'KIM'`, `'MOC'`, `'THUY'`, `'HOA'`, `'THO'` |

---

#### Bảng 4: `orders` (Quản lý thông tin đơn đặt hàng nhanh)
| Tên trường (Column) | Kiểu dữ liệu | Thuộc tính (Constraints) | Ý nghĩa |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Khóa chính |
| `customer_name` | `VARCHAR(100)` | `NOT NULL` | Họ tên khách hàng |
| `customer_phone` | `VARCHAR(20)` | `NOT NULL` | Số điện thoại khách hàng (Tra lịch sử mua hàng) |
| `customer_address`| `VARCHAR(255)` | `NOT NULL` | Địa chỉ nhận hàng |
| `total_price` | `DECIMAL(12,2)` | `NOT NULL` | Tổng trị giá đơn hàng |
| `status` | `VARCHAR(50)` | `DEFAULT 'PENDING'` | Trạng thái: `'PENDING'`, `'APPROVED'`, `'CANCELLED'` |
| `created_at` | `TIMESTAMP` | `DEFAULT CURRENT_TIMESTAMP` | Ngày đặt hàng |

---

#### Bảng 5: `order_items` (Chi tiết các sản phẩm trong mỗi đơn hàng)
| Tên trường (Column) | Kiểu dữ liệu | Thuộc tính (Constraints) | Ý nghĩa |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Khóa chính |
| `order_id` | `INT` | `FOREIGN KEY` -> `orders(id)` ON DELETE CASCADE | Liên kết tới đơn hàng |
| `product_id` | `INT` | `FOREIGN KEY` -> `products(id)` | Liên kết tới sản phẩm |
| `quantity` | `INT` | `NOT NULL` | Số lượng mua |
| `price_at_purchase`| `DECIMAL(12,2)` | `NOT NULL` | Giá tại thời điểm mua thực tế |
