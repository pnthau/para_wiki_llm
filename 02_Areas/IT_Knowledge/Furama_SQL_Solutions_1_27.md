---
domain: "IT_Knowledge"
type: "solutions"
status: "active"
tags: [sql, furama, database-practice, query-mastery]
created: 2026-06-03
nexus_version: 8.2
---

# 🛡️ FURAMA RESORT: TỔNG HỢP GIẢI PHÁP SQL (1 - 27)

Chào John (Hau-san), tôi đã tổng hợp lại toàn bộ lộ trình SQL Furama mà anh đã thực hiện. Đây là "kho báu" tri thức để anh ôn tập trước khi tiến tới integration với Java Spring Boot.

---

## 🏗️ PHẦN 1: TRUY VẤN CƠ BẢN (1 - 10)

### Câu 1: Lọc Nhân viên theo ký tự tên
> Hiển thị nhân viên có tên bắt đầu bằng 'H', 'T', 'K' và độ dài <= 15 ký tự.

```sql
SELECT * FROM employees 
WHERE (employee_name LIKE '%H%' OR employee_name LIKE '%T%' OR employee_name LIKE '$K%')
AND LENGTH(employee_name) <= 15;
```

### Câu 2: Lọc Khách hàng theo tuổi và địa chỉ
> Khách hàng 18-50 tuổi, ở Đà Nẵng hoặc Quảng Trị.

```sql
	SELECT * FROM customers 
	WHERE timestampdiff(year, dob, curdate()) BETWEEN 18 AND 50
	AND (address LIKE '%Đà Nẵng' OR address LIKE '%Quảng Trị');
```

### Câu 3: Đếm số lần đặt phòng (Diamond)
> Đếm số lần đặt phòng của khách Diamond, sắp xếp tăng dần.

```sql
SELECT c.id, c.customer_name, COUNT(ct.id) AS ordered_count
FROM customers cus
JOIN customer_types ct ON c.customer_type_id = ct.id
JOIN contracts con ON ct.customer_id = con.id
WHERE ct.customer_type_name = 'Diamond'
GROUP BY c.id, c.customer_name
ORDER BY ordered_count ASC;
```

### Câu 4: Tính Tổng tiền Hợp đồng
> Hiển thị **ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien** (_Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)_ cho tất cả các khách hàng đã từng đặt phòng. (**những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra**)

```sql
SELECT 
    cus.id as customer_id, 
    cus.customer_name  , 
    ct.customer_type_name  , 
    con.id as contract_id , 
    res.residence_name , 
    con.contract_start_date, 
    con.contract_end_date ,
    (COALESCE(rl.rent_price, 0) + SUM(COALESCE(cd.quantity * os.price, 0))) AS total_money
FROM customers cus
LEFT JOIN customer_types ct ON   cus.customer_type_id = ct.id
LEFT JOIN contracts con ON  con.customer_id = cus.id
LEFT JOIN residence_renttype_link rl ON con.residence_renttype_link_id = rl.id
LEFT JOIN residences res ON rl.residence_id = res.id
LEFT JOIN contract_detail_other_service cds ON cds.contract_id = con.id 
LEFT JOIN other_services os ON cds.other_service_id = os.id
GROUP BY  cus.id,  
cus.customer_name, 
ct.customer_type_name, 
con.id,
res.residence_name,
con.contract_start_date, 
con.contract_end_date;
```

### Câu 5: Dịch vụ chưa từng được đặt (Quý 1/2021)
Hiển thị **ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu** của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ **quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)**.

```sql
SELECT res.id, res.residence_name, res.usable_area, rl.rent_price, res.residence_type
   FROM residences res
   inner JOIN residence_renttype_link rl ON  rl.residence_id = res.id
   where not  exists(
       select 1 from contracts con
       where con.residence_renttype_link_id = rl.id and quarter (con.contract_start_date) = 1 and
   year(con.contract_start_date) = 2021
   )
```

### Câu 6: Dịch vụ đặt năm 2020 nhưng KHÔNG đặt năm 2021
```sql
SELECT res.id, res.residence_name, res.usable_area,res.maximum_occupancy, rl.rent_price, res.residence_type
FROM residences res
JOIN residence_renttype_link rl ON  rl.residence_id = res.id 
 WHERE EXISTS (
  SELECT 1 FROM contracts con
  WHERE con.residence_renttype_link_id = rl.id
  AND YEAR(con.contract_start_date) = 2020)
  AND NOT EXISTS ( SELECT 1 FROM contracts con
  WHERE con.residence_renttype_link_id = rl.id
  AND YEAR(con.contract_start_date) = 2021
  );
```

### Câu 7: Hiển thị Họ tên không trùng nhau (3 cách)
```sql
-- Cách 1: DISTINCT
SELECT DISTINCT customer_name FROM customers;

-- Cách 2: GROUP BY
SELECT customer_name FROM customers GROUP BY customer_name;

-- Cách 3: UNION
SELECT customer_name FROM customers UNION SELECT customer_name FROM customers;
```

### Câu 8: Thống kê khách hàng theo tháng (2021)
```sql
SELECT
    MONTH(con.contract_start_date) AS month,
    COUNT(DISTINCT con.customer_id) AS total_customer
FROM contracts as con
WHERE con.contract_start_date between '2021-01-01' and '2021-12-31'
GROUP BY month(contract_start_date)
ORDER BY month;
```

### Câu 9: Số lượng dịch vụ đi kèm theo từng Hợp đồng
```sql
SELECT con.id, con.contract_start_date, con.contract_end_date, con.deposit, SUM(COALESCE(cds.quantity, 0)) AS count_other_serivce
FROM contracts con
LEFT JOIN contract_detail_other_service cds ON  cds.contract_id = con.id
GROUP BY con.id;
```

### Câu 10: Dịch vụ đi kèm của khách Diamond (Vinh/Quảng Ngãi)
```sql
SELECT os.service_name, os.unit, os.price
FROM other_services os
JOIN contract_detail_other_service cds ON cds.other_service_id = os.id
JOIN contracts con ON cds.contract_id = con.id
JOIN (
     SELECT cus.id, cus.address
        FROM customers cus
        JOIN customer_types ct ON cus.customer_type_id = ct.id
       WHERE ct.customer_type_name = 'Diamond'
) AS customer_diamond ON con.customer_id = customer_diamond.id
 WHERE (customer_diamond.address LIKE '%Vinh%'
       OR customer_diamond.address LIKE '%Quảng Ngãi%'); 
```

---

## 🏹 PHẦN 2: TRUY VẤN NÂNG CAO (11 - 19)

### Câu 11: Hợp đồng 3 tháng cuối 2020 nhưng chưa có 6 tháng đầu 2021
```sql
    SELECT
        con.id,
        e.employee_name,
        cus.customer_name,
        cus.phone,
        res.residence_name,
        SUM(COALESCE(cds.quantity, 0)) AS total_quantity,
        con.deposit
     FROM contracts con
     JOIN employees e ON con.employee_id = e.id
     JOIN customers cus ON con.customer_id = cus.id
     JOIN residence_renttype_link rl ON con.residence_renttype_link_id = rl.id
     JOIN residences res ON rl.residence_id = res.id
     LEFT JOIN contract_detail_other_service cds ON cds.contract_id = con.id
     WHERE (con.contract_start_date BETWEEN '2020-10-01' AND '2020-12-31')
     AND NOT EXISTS (
        SELECT 1
        FROM contracts con_check
        WHERE con_check.customer_id = con.customer_id 
        AND con_check.contract_start_date BETWEEN '2021-01-01' AND '2021-06-30' )
    GROUP BY con.id;
```

### Câu 12: Dịch vụ đi kèm được sử dụng nhiều nhất
```sql
SELECT * FROM (
    SELECT
        os.id, os.service_name,
        SUM(cds.quantity) AS total_quantity,
        DENSE_RANK() OVER(ORDER BY total_quantity DESC) AS usage_rank
        FROM other_services os
        JOIN contract_detail_other_service cds ON os.id = cds.other_service_id
        GROUP BY os.id, os.service_name
     ) AS ranking_table
 WHERE usage_rank = 1; 
```

### Câu 13: Dịch vụ đi kèm chỉ mới được sử dụng 1 lần duy nhất
```sql
  SELECT
         con.id AS contract_id,
         rt.rent_type_name,
         os.service_name,
         COUNT(cds.other_service_id) AS usage_count
     FROM other_services os
     JOIN contract_detail_other_service cds ON os.id = cds.other_service_id
     JOIN contracts con ON cds.contract_id = con.id
     JOIN residence_renttype_link rl ON con.residence_renttype_link_id = rl.id
     JOIN rent_types rt ON rl.rent_type_id = rt.id
     GROUP BY
     os.id,
	 os.service_name,
     con.id,
     rt.rent_type_name
HAVING COUNT(cds.other_service_id) = 1;
```

### Câu 14: Nhân viên lập tối đa 3 hợp đồng (2020-2021)
```sql
SELECT e.id, e.employee_name, el.education_level_name, d.department_name, e.phone, e.address
FROM employees e
JOIN education_levels el ON e.education_level_id = el.id
JOIN departments d ON e.department_id = d.id
JOIN contracts con ON e.id = con.employee_id
WHERE con.contract_start_date BETWEEN '2020-01-01' AND '2021-12-31'
GROUP BY e.id
HAVING COUNT(con.id) <= 3;
```

### Câu 15: Xóa Nhân viên chưa từng lập hợp đồng (2019-2021)
```sql
  DELETE e 
  FROM employees e
  WHERE NOT EXISTS (
    SELECT 1
    FROM contracts con
    WHERE con.employee_id = e.id 
       AND con.contract_start_date BETWEEN '2019-01-01' AND '2021-12-31'
   );
```

### Câu 16: Nâng cấp khách hàng Platinum lên Diamond
```sql
UPDATE customers cus
SET cus.customer_type_id = (SELECT id FROM customer_types WHERE customer_type_name = 'Diamond')
WHERE cus.customer_type_id = (SELECT id FROM customer_types WHERE customer_type_name = 'Platinum')
AND exists (
    SELECT 1 
    FROM contracts con
    WHERE con.customer_id = cus.id and con.contract_start_date between '2020-01-01' and '2020-12-31'
    HAVING SUM(con.total_money) > 10000000
);
```

### Câu 17: Xóa khách hàng có hợp đồng trước năm 2021
```sql
 DELETE cus FROM customers cus
 WHERE EXISTS (
 SELECT 1 FROM contracts con
 WHERE con.customer_id = cus.id AND con.contract_start_date < '2021-01-01')
    AND NOT EXISTS (
     SELECT 1 FROM contracts con
     WHERE con.customer_id = cus.id AND con.contract_start_date >= '2021-01-01' );
```

### Câu 18: Cập nhật giá DV đi kèm dùng > 10 lần trong 2020
```sql
UPDATE other_services os
SET price = price * 2
WHERE exists (
    SELECT 1
    FROM contract_detail_other_service cds
    JOIN contracts con ON cds.contract_id = con.id
    WHERE cds.other_service_id = os.id and YEAR(con.contract_start_date) = 2020
    HAVING SUM(quantity) > 10
);
```

### Câu 19: Hợp nhất danh sách Nhân viên và Khách hàng
```sql
SELECT id, employee_name, email, phone, dob, address FROM employees
UNION ALL
SELECT id, customer_name, email, phone, dob, address FROM customers;
```

---

## 🧩 PHẦN 3: LẬP TRÌNH CSDL (20 - 27)

### Câu 20: Tạo View v_nhan_vien
```sql
CREATE VIEW v_nhan_vien AS
SELECT e.* FROM employees e
JOIN contracts ct ON e.id = ct.employee_id
WHERE e.address LIKE '%Hải Châu%'
AND ct.contract_start_date = '2019-12-12';
```

### Câu 21: Cập nhật thông qua View
```sql
UPDATE v_nhan_vien SET address = 'Liên Chiểu';
```

### Câu 22: Stored Procedure xóa khách hàng
```sql
DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(IN p_ma_khach_hang INT)
BEGIN
    DELETE FROM customers WHERE id = p_ma_khach_hang;
END //
DELIMITER ;
```

### Câu 23: Stored Procedure thêm mới hợp đồng
```sql
DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong(
    IN p_customer_id INT, 
    IN p_link_id INT, 
    IN p_employee_id INT, 
    IN p_deposit DECIMAL, 
    IN p_number VARCHAR(150),
    IN p_start DATETIME,
    IN p_end DATETIME
)
BEGIN
    -- Logic kiểm tra tồn tại FK và PK ở đây
    INSERT INTO contracts(customer_id, residence_renttype_link_id, employee_id, deposit, contract_number, contract_start_date, contract_end_date)
    VALUES (p_customer_id, p_link_id, p_employee_id, p_deposit, p_number, p_start, p_end);
END //
DELIMITER ;
```

### Câu 24: Trigger khi xóa Hợp đồng
```sql
DELIMITER //
CREATE TRIGGER tr_xoa_hop_dong
AFTER DELETE ON contracts
FOR EACH ROW
BEGIN
    -- Trong MySQL dùng bảng log hoặc biến session để giả lập console
    SET @tong_hop_dong = (SELECT COUNT(*) FROM contracts);
END //
DELIMITER ;
```

### Câu 25: Trigger khi cập nhật ngày kết thúc
```sql
DELIMITER //
CREATE TRIGGER tr_cap_nhat_hop_dong
BEFORE UPDATE ON contracts
FOR EACH ROW
BEGIN
    IF DATEDIFF(NEW.contract_end_date, NEW.contract_start_date) < 2 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
    END IF;
END //
DELIMITER ;
```

### Câu 26: Function đếm dịch vụ và tính thời gian
```sql
-- a. func_dem_dich_vu
DELIMITER //
CREATE FUNCTION func_dem_dich_vu() RETURNS INT DETERMINISTIC
BEGIN
    RETURN (SELECT COUNT(*) FROM contracts WHERE total_money > 2000000);
END //

-- b. func_tinh_thoi_gian_hop_dong
CREATE FUNCTION func_tinh_thoi_gian_hop_dong(p_ma_khach_hang INT) RETURNS INT DETERMINISTIC
BEGIN
    RETURN (SELECT MAX(DATEDIFF(contract_end_date, contract_start_date)) 
            FROM contracts WHERE customer_id = p_ma_khach_hang);
END //
DELIMITER ;
```

### Câu 27: Stored Procedure xóa Room (Cascading Delete)
```sql
DELIMITER //
CREATE PROCEDURE sp_xoa_dich_vu_va_hd_room()
BEGIN
    -- 1. Lưu ID cần xóa vào bảng tạm
    CREATE TEMPORARY TABLE temp_ids AS
    SELECT r.id FROM residences r
    WHERE r.residence_type = 'Room'
    AND r.id IN (
        SELECT rrl.residence_id FROM contracts ct
        JOIN residence_renttype_link rrl ON ct.residence_renttype_link_id = rrl.id
        WHERE YEAR(ct.contract_start_date) BETWEEN 2015 AND 2019
    );

    -- 2. Xóa theo thứ tự Cháu -> Con -> Cha
    DELETE FROM contract_detail_other_service WHERE contract_id IN (
        SELECT id FROM contracts WHERE residence_renttype_link_id IN (
            SELECT id FROM residence_renttype_link WHERE residence_id IN (SELECT id FROM temp_ids)
        )
    );
    
    DELETE FROM contracts WHERE residence_renttype_link_id IN (
        SELECT id FROM residence_renttype_link WHERE residence_id IN (SELECT id FROM temp_ids)
    );
    
    DELETE FROM residences WHERE id IN (SELECT id FROM temp_ids);
    
    DROP TEMPORARY TABLE temp_ids;
END //
DELIMITER ;
```

---
*Back to [[MOC_IT_Knowledge]] | [[SQL_DEEP_RAID_PRACTICE]]*
