-- Dữ liệu mẫu cho database: delivery_customer_db
-- Chạy sau khi Customer Service đã tạo bảng bằng Hibernate.

USE delivery_customer_db;

-- 12 khách hàng. ID 1-12 được giữ cố định để đồng bộ Delivery Service.
INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 1, 'Nguyễn Văn An', '0901234567', 'nguyen.van.an@gmail.com', 'ACTIVE', '2026-11-01 08:00:00', '2026-11-01 08:00:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 1);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 2, 'Trần Thị Bình', '0912345678', 'tran.thi.binh@gmail.com', 'ACTIVE', '2026-11-01 08:15:00', '2026-11-01 08:15:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 2);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 3, 'Lê Minh Châu', '0923456789', 'le.minh.chau@gmail.com', 'ACTIVE', '2026-11-02 09:00:00', '2026-11-02 09:00:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 3);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 4, 'Phạm Đức Dũng', '0934567890', 'pham.duc.dung@gmail.com', 'INACTIVE', '2026-11-02 10:30:00', '2026-11-10 14:00:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 4);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 5, 'Hoàng Thị Em', '0945678901', 'hoang.thi.em@gmail.com', 'ACTIVE', '2026-11-03 08:40:00', '2026-11-03 08:40:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 5);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 6, 'Vũ Quốc Gia', '0956789012', 'vu.quoc.gia@gmail.com', 'ACTIVE', '2026-11-03 11:20:00', '2026-11-03 11:20:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 6);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 7, 'Đặng Mai Hương', '0967890123', 'dang.mai.huong@gmail.com', 'ACTIVE', '2026-11-04 07:50:00', '2026-11-04 07:50:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 7);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 8, 'Bùi Thành Khang', '0978901234', 'bui.thanh.khang@gmail.com', 'ACTIVE', '2026-11-04 13:10:00', '2026-11-04 13:10:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 8);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 9, 'Đỗ Ngọc Linh', '0989012345', 'do.ngoc.linh@gmail.com', 'ACTIVE', '2026-11-05 09:25:00', '2026-11-05 09:25:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 9);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 10, 'Ngô Văn Minh', '0909876543', 'ngo.van.minh@gmail.com', 'ACTIVE', '2026-11-05 15:30:00', '2026-11-05 15:30:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 10);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 11, 'Dương Hải Nam', '0918765432', 'duong.hai.nam@gmail.com', 'ACTIVE', '2026-11-06 10:45:00', '2026-11-06 10:45:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 11);

INSERT INTO customers (id, full_name, phone, email, status, created_at, updated_at)
SELECT 12, 'Trương Thị Oanh', '0927654321', 'truong.thi.oanh@gmail.com', 'INACTIVE', '2026-11-06 16:00:00', '2026-11-12 09:30:00'
WHERE NOT EXISTS (SELECT 1 FROM customers WHERE id = 12);

-- 16 địa chỉ cho khách hàng 1-12.
INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 1, 1, '123 Nguyễn Trãi', 'Bến Thành', 'Quận 1', 'TP Hồ Chí Minh', TRUE, '2026-11-01 08:05:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 1);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 2, 1, '45 Trần Duy Hưng', 'Trung Hòa', 'Cầu Giấy', 'Hà Nội', FALSE, '2026-11-01 08:06:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 2);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 3, 2, '78 Lê Lợi', 'Hải Châu 1', 'Hải Châu', 'Đà Nẵng', TRUE, '2026-11-01 08:20:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 3);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 4, 3, '56 Nguyễn Văn Cừ', 'An Hòa', 'Ninh Kiều', 'Cần Thơ', TRUE, '2026-11-02 09:10:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 4);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 5, 4, '12 Hùng Vương', 'Phú Hòa', 'Thủ Dầu Một', 'Bình Dương', TRUE, '2026-11-02 10:35:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 5);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 6, 5, '210 Võ Thị Sáu', 'Võ Thị Sáu', 'Quận 3', 'TP Hồ Chí Minh', TRUE, '2026-11-03 08:45:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 6);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 7, 6, '34 Phan Đình Phùng', 'Quán Thánh', 'Ba Đình', 'Hà Nội', TRUE, '2026-11-03 11:25:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 7);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 8, 6, '99 Cách Mạng Tháng 8', 'Phường 7', 'Quận Tân Bình', 'TP Hồ Chí Minh', FALSE, '2026-11-03 11:30:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 8);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 9, 7, '88 Trần Phú', 'Lộc Thọ', 'Thành phố Nha Trang', 'Khánh Hòa', TRUE, '2026-11-04 08:00:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 9);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 10, 8, '17 Hai Bà Trưng', 'Bùi Thị Xuân', 'TP Huế', 'Thừa Thiên Huế', TRUE, '2026-11-04 13:15:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 10);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 11, 9, '65 Lý Thường Kiệt', 'Phù Hợp', 'Thành phố Vinh', 'Nghệ An', TRUE, '2026-11-05 09:30:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 11);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 12, 10, '102 Nguyễn Huệ', 'Bến Nghé', 'Quận 1', 'TP Hồ Chí Minh', TRUE, '2026-11-05 15:35:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 12);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 13, 10, '5 Quang Trung', 'Lê Hồng Phong', 'Biên Hòa', 'Đồng Nai', FALSE, '2026-11-05 15:40:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 13);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 14, 11, '23 Trường Chinh', 'Tân Bình', 'Quận 12', 'TP Hồ Chí Minh', TRUE, '2026-11-06 10:50:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 14);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 15, 12, '71 Điện Biên Phủ', 'Thanh Khê Đông', 'Thanh Khê', 'Đà Nẵng', TRUE, '2026-11-06 16:05:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 15);

INSERT INTO customer_addresses (id, customer_id, address, ward, district, city, is_default, created_at)
SELECT 16, 12, '6 Bà Triệu', 'Trần Hưng Đạo', 'Hoàn Kiếm', 'Hà Nội', FALSE, '2026-11-06 16:10:00'
WHERE NOT EXISTS (SELECT 1 FROM customer_addresses WHERE id = 16);

SELECT COUNT(*) AS customer_count FROM customers;
SELECT COUNT(*) AS address_count FROM customer_addresses;
