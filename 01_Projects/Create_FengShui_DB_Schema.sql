-- =========================================================================
-- SCRIPT TẠO DATABASE VÀ BẢNG CHO DỰ ÁN WEB TRANG SỨC PHONG THỦY (CHUYỂN NGHIỆP - 3NF)
-- Hệ quản trị CSDL: MySQL / MariaDB
-- Hỗ trợ quan hệ Nhiều-Nhiều (Many-to-Many) giữa Sản phẩm và Mệnh phong thủy
-- Quản lý Nhập/Xuất kho tự động hóa qua Trigger
-- =========================================================================

-- 1. Tạo Database mới nếu chưa có
CREATE DATABASE IF NOT EXISTS fengshui_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE fengshui_db;

-- Xóa các bảng cũ nếu đã tồn tại để tránh xung đột khi chạy lại file (Lưu ý thứ tự xóa vì ràng buộc khóa ngoại)
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS inventory_transactions;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS product_elements;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS = 1;

-- =========================================================================
-- 2. TẠO CÁC BẢNG DỮ LIỆU
-- =========================================================================

-- Bảng 1: users (Chỉ dùng lưu thông tin Admin quản trị hệ thống)
CREATE TABLE users (
    id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- Khuyến nghị lưu mật khẩu đã mã hóa (ví dụ: BCrypt)
    role VARCHAR(20) DEFAULT 'ADMIN',
    CONSTRAINT pk_users PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Bảng 2: products (Thông tin sản phẩm trang sức phong thủy)
CREATE TABLE products (
    id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(12,2) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,       -- Số lượng tồn kho tự động tính qua trigger
    material VARCHAR(100) NOT NULL,
    image_url VARCHAR(500) DEFAULT NULL,
    youtube_url VARCHAR(500) DEFAULT NULL, -- Link video thực tế nhúng YouTube
    status VARCHAR(50) DEFAULT 'ACTIVE',  -- ACTIVE, INACTIVE, OUT_OF_STOCK
    description TEXT,                      -- Mô tả ý nghĩa phong thủy và chất lượng sản phẩm
    CONSTRAINT pk_products PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Bảng 3: product_elements (Bảng trung gian giải quyết quan hệ Nhiều-Nhiều)
CREATE TABLE product_elements (
    product_id INT NOT NULL,
    element VARCHAR(50) NOT NULL,          -- Mệnh hợp: KIM, MOC, THUY, HOA, THO
    CONSTRAINT pk_product_elements PRIMARY KEY (product_id, element),
    CONSTRAINT fk_product_elements_products FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Bảng 4: orders (Thông tin chung đơn đặt hàng nhanh)
CREATE TABLE orders (
    id INT AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_phone VARCHAR(20) NOT NULL,    -- SĐT dùng để tra cứu lịch sử mua hàng nhanh
    customer_address VARCHAR(255) NOT NULL,
    total_price DECIMAL(12,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'PENDING',  -- PENDING (Chờ duyệt), APPROVED (Đã duyệt), CANCELLED (Hủy)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_orders PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Bảng 5: order_items (Chi tiết sản phẩm nằm trong đơn hàng)
CREATE TABLE order_items (
    id INT AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(12,2) NOT NULL, -- Lưu giá lúc mua để bảo toàn thống kê doanh thu lịch sử
    CONSTRAINT pk_order_items PRIMARY KEY (id),
    CONSTRAINT fk_order_items_orders FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    CONSTRAINT fk_order_items_products FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;

-- Bảng 6: inventory_transactions (Quản lý lịch sử và biến động Nhập/Xuất kho)
CREATE TABLE inventory_transactions (
    id INT AUTO_INCREMENT,
    product_id INT NOT NULL,
    transaction_type VARCHAR(20) NOT NULL, -- 'IMPORT' (Nhập kho), 'EXPORT' (Xuất kho)
    quantity INT NOT NULL,                 -- Số lượng nhập hoặc xuất
    price DECIMAL(12,2) NOT NULL,          -- Đơn giá tại thời điểm nhập/xuất kho
    reason VARCHAR(255) DEFAULT NULL,      -- Lý do biến động (ví dụ: "Nhập lô hàng mới", "Bán hàng theo đơn", "Hao hụt kiểm kho")
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT NOT NULL,               -- Tài khoản admin thực hiện thao tác này
    CONSTRAINT pk_inventory_transactions PRIMARY KEY (id),
    CONSTRAINT fk_inventory_transactions_products FOREIGN KEY (product_id) REFERENCES products(id),
    CONSTRAINT fk_inventory_transactions_users FOREIGN KEY (created_by) REFERENCES users(id),
    CONSTRAINT chk_transaction_type CHECK (transaction_type IN ('IMPORT', 'EXPORT')),
    CONSTRAINT chk_transaction_quantity CHECK (quantity > 0)
) ENGINE=InnoDB;

-- =========================================================================
-- 3. TẠO CÁC TRIGGER ĐỂ TỰ ĐỘNG HÓA CẬP NHẬT TỒN KHO
-- =========================================================================

-- Trigger 1: Tự động ghi nhận giao dịch XUẤT KHO khi có đơn hàng mới (Chèn dòng vào order_items)
DELIMITER //
CREATE TRIGGER trg_after_insert_order_items
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    INSERT INTO inventory_transactions (product_id, transaction_type, quantity, price, reason, created_by)
    VALUES (NEW.product_id, 'EXPORT', NEW.quantity, NEW.price_at_purchase, CONCAT('Xuất kho bán hàng tự động cho đơn hàng ID: ', NEW.order_id), 1);
END //
DELIMITER ;

-- Trigger 2: Tự động cập nhật số lượng tồn thực tế (products.quantity) sau mỗi giao dịch NHẬP/XUẤT KHO
DELIMITER //
CREATE TRIGGER trg_after_insert_inventory_transaction
AFTER INSERT ON inventory_transactions
FOR EACH ROW
BEGIN
    IF NEW.transaction_type = 'IMPORT' THEN
        UPDATE products 
        SET quantity = quantity + NEW.quantity 
        WHERE id = NEW.product_id;
    ELSEIF NEW.transaction_type = 'EXPORT' THEN
        UPDATE products 
        SET quantity = quantity - NEW.quantity 
        WHERE id = NEW.product_id;
    END IF;
END //
DELIMITER ;

-- =========================================================================
-- 4. CHÈN DỮ LIỆU MẪU (DUMMY DATA) ĐỂ TEST HỆ THỐNG TỰ ĐỘNG
-- =========================================================================

-- Chèn tài khoản Admin mẫu
INSERT INTO users (username, password, role) VALUES 
('admin', 'admin123', 'ADMIN');

-- Chèn sản phẩm trang sức phong thủy mẫu (Tất cả khởi tạo tồn kho = 0)
INSERT INTO products (id, name, price, quantity, material, image_url, youtube_url, status, description) VALUES 
(
    1,
    'Vòng Tay Thạch Anh Tóc Vàng 10 ly', 
    1250000.00, 
    0, -- Số tồn kho bắt đầu từ 0
    'Đá Thạch Anh Tóc Vàng Tự Nhiên, charm Vàng Non 10K', 
    'assets/images/vong-tay-toc-vang.jpg', 
    'https://www.youtube.com/embed/dQw4w9WgXcQ', 
    'ACTIVE', 
    'Thạch quartz tóc vàng tự nhiên mang năng lượng thu hút tài lộc mạnh mẽ. Rất phù hợp cho người mệnh Kim (tương hợp) và mệnh Thủy (tương sinh).'
),
(
    2,
    'Mặt Dây Chuyền Tỳ Hưu Cẩm Thạch', 
    1850000.00, 
    0, 
    'Ngọc Cẩm Thạch Sơn Thủy, móc khóa Vàng Non 14K', 
    'assets/images/ty-huu-cam-thach.jpg', 
    NULL, 
    'ACTIVE', 
    'Mặt dây chuyền Tỳ Hưu chế tác từ Ngọc Cẩm Thạch thiên nhiên giúp trấn trạch, trừ tà và mang lại bình an. Hợp nhất với người mệnh Mộc và Hỏa.'
),
(
    3,
    'Nhẫn Đá Obsidian Đen Huyền Bí', 
    950000.00, 
    0, 
    'Đá Thủy Tinh Núi Lửa (Obsidian), ổ nhẫn Bạc mạ Vàng Non', 
    'assets/images/nhan-obsidian-den.jpg', 
    'https://www.youtube.com/embed/dQw4w9WgXcQ',
    'ACTIVE', 
    'Đá Obsidian đen là biểu tượng của sự bảo vệ khỏi năng lượng tiêu cực, tăng cường trực giác và bản lĩnh. Hợp người mệnh Thủy và Mộc.'
),
(
    4,
    'Bông Tai Đá Ruby Hồng Ngọc', 
    2400000.00, 
    0, 
    'Đá Ruby Tự Nhiên, chuôi đeo Vàng Non 18K', 
    'assets/images/bong-tai-ruby.jpg', 
    NULL, 
    'ACTIVE', 
    'Bông tai với viên Ruby đỏ tự nhiên quý hiếm mang lại năng lượng tình duyên, gia đạo ấm êm và nhiệt huyết. Thích hợp cho người mệnh Hỏa và Thổ.'
),
(
    5,
    'Vòng Tay Chỉ Đỏ Mix Đá Mắt Hổ Vàng Nâu', 
    450000.00, 
    0, 
    'Đá Mắt Hổ Vàng Nâu Tự Nhiên, charm Tỳ Hưu Vàng Non 10K', 
    'assets/images/vong-tay-mat-ho.jpg', 
    'https://www.youtube.com/embed/dQw4w9WgXcQ',
    'ACTIVE', 
    'Vòng tay đá mắt hổ kết hợp chỉ đỏ may mắn giúp tăng tự tin, mang lại bình an cho chủ nhân. Thích hợp nhất cho người mệnh Thổ và Kim.'
);

-- Chèn mối liên kết Nhiều-Nhiều vào bảng product_elements
INSERT INTO product_elements (product_id, element) VALUES 
(1, 'KIM'), 
(1, 'THUY'), 
(2, 'MOC'), 
(2, 'HOA'), 
(3, 'THUY'), 
(3, 'MOC'), 
(4, 'HOA'), 
(4, 'THO'), 
(5, 'THO'), 
(5, 'KIM');

-- Chèn các giao dịch nhập xuất kho thủ công (Sẽ tự động kích hoạt Trigger 2 để tăng/giảm tồn kho của products)
INSERT INTO inventory_transactions (product_id, transaction_type, quantity, price, reason, created_by) VALUES
(1, 'IMPORT', 20, 1000000.00, 'Nhập hàng đầu kỳ từ xưởng chế tác kim hoàn A', 1), 
(1, 'EXPORT', 5, 1000000.00, 'Xuất chuyển hàng mẫu sang chi nhánh quận Hải Châu', 1), -- Tồn thực tế của SP1: 20 - 5 = 15

(2, 'IMPORT', 10, 1500000.00, 'Nhập lô ngọc cẩm thạch mới từ Myanmar', 1), 
(2, 'EXPORT', 2, 1500000.00, 'Xuất trả nhà cung cấp do lỗi chế tác', 1), -- Tồn thực tế của SP2: 10 - 2 = 8

(3, 'IMPORT', 20, 750000.00, 'Nhập kho nhẫn Obsidian đen huyền bí', 1), -- Tồn thực tế của SP3: 20

(4, 'IMPORT', 5, 2000000.00, 'Nhập bông tai Ruby tự nhiên cao cấp', 1), -- Tồn thực tế của SP4: 5

(5, 'IMPORT', 30, 350000.00, 'Nhập sỉ vòng tay chỉ đỏ đá mắt hổ', 1); -- Tồn thực tế của SP5: 30

-- Chèn đơn đặt hàng mẫu (Tự động kích hoạt Trigger 1 tạo transaction EXPORT và Trigger 2 trừ tồn kho)
INSERT INTO orders (customer_name, customer_phone, customer_address, total_price, status, created_at) VALUES 
('Nguyễn Văn A', '0905123456', '123 Hùng Vương, Đà Nẵng', 1250000.00, 'APPROVED', '2026-06-05 10:30:00');

INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES 
(1, 1, 1, 1250000.00); -- SP 1 trừ đi 1 -> Tồn thực tế còn 14

INSERT INTO orders (customer_name, customer_phone, customer_address, total_price, status, created_at) VALUES 
('Nguyễn Văn A', '0905123456', '123 Hùng Vương, Đà Nẵng', 1400000.00, 'PENDING', '2026-06-10 09:00:00');

INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES 
(2, 3, 1, 950000.00),  -- SP 3 trừ đi 1 -> Tồn thực tế còn 19
(2, 5, 1, 450000.00);  -- SP 5 trừ đi 1 -> Tồn thực tế còn 29
