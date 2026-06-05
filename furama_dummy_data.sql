USE furama;

-- 1. Dữ liệu Danh mục (Master Data)
INSERT INTO customer_types (id, customer_type_name) VALUES 
(1, 'Diamond'), (2, 'Platinum'), (3, 'Gold'), (4, 'Silver'), (5, 'Member');

INSERT INTO rent_types (id, rent_type_name) VALUES 
(1, 'Year'), (2, 'Month'), (3, 'Day'), (4, 'Hour');

INSERT INTO education_levels (id, education_level_name) VALUES 
(1, 'Trung Cấp'), (2, 'Cao Đẳng'), (3, 'Đại Học'), (4, 'Sau Đại Học');

INSERT INTO roles (id, role_name) VALUES 
(1, 'Lễ tân'), (2, 'Phục vụ'), (3, 'Chuyên viên'), (4, 'Giám sát'), (5, 'Quản lý'), (6, 'Giám đốc');

INSERT INTO departments (id, department_name) VALUES 
(1, 'Sale-Marketing'), (2, 'Hành chính'), (3, 'Phục vụ'), (4, 'Quản lý');

-- 2. Dữ liệu Nhân viên (Employees)
-- Cần tên bắt đầu H, T, K và tối đa 15 ký tự (Câu 1)
-- Cần địa chỉ Hải Châu (Câu 20)
-- Cần nhân viên không có hợp đồng (Câu 15 - Xóa 2019-2021)
INSERT INTO employees (id, employee_name, dob, id_card, phone, email, gender, address, education_level_id, role_id, department_id, salary) VALUES 
(1, 'Nguyễn Văn Hùng', '1990-01-01', '123456781', '0905123451', 'hung@gmail.com', 'male', 'Hải Châu, Đà Nẵng', 3, 5, 4, 15000000),
(2, 'Lê Thị Thảo', '1995-05-05', '123456782', '0905123452', 'thao@gmail.com', 'female', 'Hải Châu, Đà Nẵng', 2, 1, 1, 8000000),
(3, 'Trần Kiên', '1985-10-10', '123456783', '0905123453', 'kien@gmail.com', 'male', 'Thanh Khê, Đà Nẵng', 3, 3, 2, 12000000),
(4, 'Phạm Hữu Tuyến', '1992-12-12', '123456784', '0905123454', 'tuyen@gmail.com', 'male', 'Hải Châu, Đà Nẵng', 1, 2, 3, 7000000),
(5, 'Nguyễn Tâm', '1998-08-08', '123456785', '0905123455', 'tam@gmail.com', 'male', 'Liên Chiểu, Đà Nẵng', 3, 4, 4, 10000000);

-- 3. Dữ liệu Khách hàng (Customers)
-- Cần tuổi 18-50, địa chỉ Đà Nẵng/Quảng Trị (Câu 2)
-- Cần tên Diamond, địa chỉ Vinh/Quảng Ngãi (Câu 10)
-- Cần Platinum có hóa đơn > 10tr (Câu 16)
INSERT INTO customers (id, customer_name, id_card, gender, phone, email, dob, address, customer_type_id) VALUES 
(1, 'Nguyễn Hoàng', '201234561', 'male', '0912345671', 'hoang@gmail.com', '1990-01-01', 'Đà Nẵng', 1),
(2, 'Trần Kim Thoa', '201234562', 'female', '0912345672', 'thoa@gmail.com', '2000-05-05', 'Quảng Trị', 1),
(3, 'Lê Văn Khải', '201234563', 'male', '0912345673', 'khai@gmail.com', '1985-10-10', 'Vinh', 1),
(4, 'Phạm Thị Hải', '201234564', 'female', '0912345674', 'hai@gmail.com', '1992-12-12', 'Quảng Ngãi', 1),
(5, 'Nguyễn Tùng', '201234565', 'male', '0912345675', 'tung@gmail.com', '1995-08-08', 'Đà Nẵng', 2), -- Platinum
(6, 'Võ Văn Kiệt', '201234566', 'male', '0912345676', 'kiet@gmail.com', '1970-01-01', 'Đà Nẵng', 5); -- Lớn tuổi

-- 4. Dữ liệu Dịch vụ (Residences)
-- Cần Room, Villa, House
INSERT INTO residences (id, residence_name, usable_area, maximum_occupancy, room_standard, other_amenities_description, pool_area, number_of_floors, complimentary_services, residence_type) VALUES 
(1, 'Villa Beach Front', 500, 10, 'VIP', 'Có hồ bơi riêng', 80, 3, NULL, 'Villa'),
(2, 'House Princess 01', 200, 5, 'Normal', 'Có sân vườn', NULL, 2, NULL, 'House'),
(3, 'Room Twin 01', 50, 2, 'Normal', 'Mini bar', NULL, NULL, 'Nước suối miễn phí', 'Room'),
(4, 'Room Twin 02', 50, 2, 'Normal', 'Mini bar', NULL, NULL, 'Nước suối miễn phí', 'Room');

-- 5. Liên kết Dịch vụ - Loại Thuê (Residence RentType Link)
INSERT INTO residence_renttype_link (id, residence_id, rent_type_id, rent_price) VALUES 
(1, 1, 3, 10000000), -- Villa theo ngày
(2, 2, 3, 5000000),  -- House theo ngày
(3, 3, 4, 500000),   -- Room theo giờ
(4, 4, 3, 1000000);  -- Room theo ngày

-- 6. Dịch vụ đi kèm (Other Services)
INSERT INTO other_services (id, service_name, unit, price) VALUES 
(1, 'Karaoke', 'Giờ', 500000),
(2, 'Thuê xe máy', 'Ngày', 200000),
(3, 'Thức ăn', 'Suất', 100000),
(4, 'Nước uống', 'Ly', 50000),
(5, 'Massage', 'Lượt', 800000);

-- 7. Hợp đồng (Contracts)
-- Câu 20: NV Hải Châu, lập HD 12/12/2019
-- Câu 27: Xóa Room thuê từ 2015-2019
-- Câu 11: 3 tháng cuối 2020 nhưng chưa có đầu 2021
-- Câu 16: Hợp đồng 2021 có tổng tiền > 10tr
INSERT INTO contracts (id, customer_id, residence_renttype_link_id, employee_id, deposit, contract_number, contract_start_date, contract_end_date) VALUES 
(1, 1, 1, 1, 1000000, 'HD-0001', '2019-12-12', '2019-12-15'), -- Câu 20
(2, 2, 3, 2, 500000, 'HD-0002', '2018-05-05', '2018-05-06'),  -- Câu 27 (Room 2018)
(3, 3, 4, 3, 500000, 'HD-0003', '2020-11-10', '2020-11-15'), -- Câu 11 (3 tháng cuối 2020)
(4, 5, 1, 4, 2000000, 'HD-0004', '2021-06-01', '2021-06-10'), -- Câu 16 (Platinum, 2021)
(5, 4, 2, 2, 1000000, 'HD-0005', '2021-01-01', '2021-01-05'); -- Quý 1/2021

-- 8. Chi tiết Hợp đồng (Contract Details / Other Services usage)
-- Câu 18: Dịch vụ dùng > 10 lần trong 2020
INSERT INTO contract_detail_other_service (id, other_service_id, contract_id, total_money_other_service, create_at, quantity) VALUES 
(1, 1, 1, 500000, '2019-12-12', 1),
(2, 2, 2, 400000, '2018-05-05', 2),
(3, 1, 3, 5500000, '2020-11-10', 11), -- Karaoke dùng 11 lần năm 2020 (Câu 18)
(4, 3, 4, 500000, '2021-06-01', 5),
(5, 4, 4, 250000, '2021-06-01', 5);

-- Bổ sung cập nhật tổng tiền hợp đồng
UPDATE contracts c SET total_money = (
    SELECT COALESCE(rrl.rent_price, 0) + SUM(COALESCE(cd.total_money_other_service, 0))
    FROM residence_renttype_link rrl
    LEFT JOIN contract_detail_other_service cd ON cd.contract_id = c.id
    WHERE rrl.id = c.residence_renttype_link_id
    GROUP BY rrl.id
);
