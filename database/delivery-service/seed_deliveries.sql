-- Dữ liệu mẫu cho database: delivery_service_db
-- Chạy sau khi Delivery Service đã tạo bảng bằng Hibernate.
-- customer_id tham chiếu ID khách hàng trong delivery_customer_db nhưng không tạo khóa ngoại chéo.

USE delivery_service_db;

-- 6 loại hình giao hàng.
INSERT INTO service_types (id, service_name, description, base_price, status, created_at)
SELECT 1, 'Giao hàng tiêu chuẩn', 'Giao trong 3-5 ngày làm việc', 30000.00, 'ACTIVE', '2026-11-01 08:00:00'
WHERE NOT EXISTS (SELECT 1 FROM service_types WHERE id = 1);

INSERT INTO service_types (id, service_name, description, base_price, status, created_at)
SELECT 2, 'Giao hàng nhanh', 'Giao trong 1-2 ngày làm việc', 50000.00, 'ACTIVE', '2026-11-01 08:05:00'
WHERE NOT EXISTS (SELECT 1 FROM service_types WHERE id = 2);

INSERT INTO service_types (id, service_name, description, base_price, status, created_at)
SELECT 3, 'Giao hỏa tốc', 'Ưu tiên giao nhanh nhất trong giờ', 80000.00, 'ACTIVE', '2026-11-01 08:10:00'
WHERE NOT EXISTS (SELECT 1 FROM service_types WHERE id = 3);

INSERT INTO service_types (id, service_name, description, base_price, status, created_at)
SELECT 4, 'Giao trong ngày', 'Nhận và giao trong cùng ngày tại khu vực hỗ trợ', 65000.00, 'ACTIVE', '2026-11-01 08:15:00'
WHERE NOT EXISTS (SELECT 1 FROM service_types WHERE id = 4);

INSERT INTO service_types (id, service_name, description, base_price, status, created_at)
SELECT 5, 'Giao hàng tiết kiệm', 'Tối ưu chi phí, thời gian 5-7 ngày', 20000.00, 'ACTIVE', '2026-11-01 08:20:00'
WHERE NOT EXISTS (SELECT 1 FROM service_types WHERE id = 5);

INSERT INTO service_types (id, service_name, description, base_price, status, created_at)
SELECT 6, 'Giao hàng nội tỉnh', 'Dịch vụ tạm ngừng để kiểm thử trạng thái', 25000.00, 'INACTIVE', '2026-11-01 08:25:00'
WHERE NOT EXISTS (SELECT 1 FROM service_types WHERE id = 6);

-- 15 đơn giao hàng. customer_id 1-12 tồn tại trong delivery_customer_db.
INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 1, 1, 1, 'Nguyễn Văn An', '0901234567', '123 Nguyễn Trãi, Bến Thành, Quận 1, TP Hồ Chí Minh', 'Tài liệu văn phòng', 2.50, 55000.00, 'PENDING', '2026-11-20 08:00:00', '2026-11-20 08:00:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 1);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 2, 2, 2, 'Trần Thị Bình', '0912345678', '78 Lê Lợi, Hải Châu 1, Hải Châu, Đà Nẵng', 'Thời trang', 1.20, 62000.00, 'CONFIRMED', '2026-11-20 09:10:00', '2026-11-20 09:30:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 2);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 3, 3, 3, 'Lê Minh Châu', '0923456789', '56 Nguyễn Văn Cừ, An Hòa, Ninh Kiều, Cần Thơ', 'Điện tử', 0.80, 88000.00, 'PICKING_UP', '2026-11-20 10:20:00', '2026-11-20 10:45:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 3);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 4, 5, 4, 'Hoàng Thị Em', '0945678901', '210 Võ Thị Sáu, Võ Thị Sáu, Quận 3, TP Hồ Chí Minh', 'Bánh kẹo', 3.00, 95000.00, 'IN_TRANSIT', '2026-11-21 07:30:00', '2026-11-21 11:20:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 4);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 5, 6, 1, 'Vũ Quốc Gia', '0956789012', '34 Phan Đình Phùng, Quán Thánh, Ba Đình, Hà Nội', 'Sách giáo khoa', 5.00, 80000.00, 'DELIVERED', '2026-11-21 08:15:00', '2026-11-23 14:00:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 5);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 6, 7, 5, 'Đặng Mai Hương', '0967890123', '88 Trần Phú, Lộc Thọ, Nha Trang, Khánh Hòa', 'Đồ gia dụng', 8.00, 100000.00, 'CANCELLED', '2026-11-21 09:00:00', '2026-11-21 09:15:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 6);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 7, 8, 2, 'Bùi Thành Khang', '0978901234', '17 Hai Bà Trưng, Bùi Thị Xuân, TP Huế', 'Đồ chơi trẻ em', 4.50, 95000.00, 'PENDING', '2026-11-22 08:30:00', '2026-11-22 08:30:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 7);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 8, 9, 3, 'Đỗ Ngọc Linh', '0989012345', '65 Lý Thường Kiệt, Thành phố Vinh, Nghệ An', 'Mỹ phẩm', 1.50, 95000.00, 'CONFIRMED', '2026-11-22 10:00:00', '2026-11-22 10:10:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 8);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 9, 10, 1, 'Ngô Văn Minh', '0909876543', '102 Nguyễn Huệ, Bến Nghé, Quận 1, TP Hồ Chí Minh', 'Máy tính bàn phím', 6.20, 92000.00, 'IN_TRANSIT', '2026-11-23 09:20:00', '2026-11-24 08:00:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 9);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 10, 11, 4, 'Dương Hải Nam', '0918765432', '23 Trường Chinh, Tân Bình, Quận 12, TP Hồ Chí Minh', 'Hoa tươi', 2.00, 85000.00, 'PICKING_UP', '2026-11-23 11:45:00', '2026-11-23 12:00:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 10);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 11, 1, 5, 'Nguyễn Văn An', '0901234567', '45 Trần Duy Hưng, Trung Hòa, Cầu Giấy, Hà Nội', 'Vật dụng văn phòng', 7.50, 95000.00, 'DELIVERED', '2026-11-24 08:00:00', '2026-11-29 16:00:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 11);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 12, 2, 2, 'Trần Thị Bình', '0912345678', '78 Lê Lợi, Hải Châu 1, Hải Châu, Đà Nẵng', 'Hàng thủ công mỹ nghệ', 3.20, 82000.00, 'DELIVERED', '2026-11-24 09:30:00', '2026-11-25 15:30:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 12);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 13, 5, 1, 'Hoàng Thị Em', '0945678901', '210 Võ Thị Sáu, Quận 3, TP Hồ Chí Minh', 'Quần áo', 1.80, 48000.00, 'CONFIRMED', '2026-11-24 10:15:00', '2026-11-24 10:20:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 13);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 14, 10, 3, 'Ngô Văn Minh', '0909876543', '5 Quang Trung, Biên Hòa, Đồng Nai', 'Thiết bị y tế', 0.50, 85000.00, 'PICKING_UP', '2026-11-25 08:45:00', '2026-11-25 09:00:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 14);

INSERT INTO deliveries (id, customer_id, service_type_id, receiver_name, receiver_phone, delivery_address, package_description, weight, shipping_fee, status, created_at, updated_at)
SELECT 15, 12, 5, 'Trương Thị Oanh', '0927654321', '71 Điện Biên Phủ, Thanh Khê, Đà Nẵng', 'Nhu yếu phẩm', 10.00, 120000.00, 'CANCELLED', '2026-11-25 13:00:00', '2026-11-25 13:10:00'
WHERE NOT EXISTS (SELECT 1 FROM deliveries WHERE id = 15);

SELECT COUNT(*) AS service_type_count FROM service_types;
SELECT COUNT(*) AS delivery_count FROM deliveries;
