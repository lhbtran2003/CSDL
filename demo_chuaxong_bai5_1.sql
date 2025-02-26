

USE ss5;


-- Tạo bảng customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- Tạo bảng orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY, -- Khóa chính
    customer_id INT, -- Khóa ngoại
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- Liên kết với bảng customers
);

-- Thêm bản ghi vào bảng customers
INSERT INTO customers (name, email, phone, address)
VALUES
('Nguyen Van An', 'nguyenvanaan@example.com', '0901234567', '123 Le Loi, TP.HCM'),
('Tran Thi Bich', 'tranthibich@example.com', '0912345678', '456 Nguyen Hue, TP.HCM'),
('Le Van Cuong', 'levancuong@example.com', '0923456789', '789 Dien Bien Phu, Ha Noi');

ALTER TABLE ORDERS
DROP COLUMN status

ALTER TABLE ORDERS
ADD COLUMN trang_thai varchar(50)

-- Thêm bản ghi vào bảng orders
INSERT INTO orders (   order_date, total_amount, trang_thai)
VALUES
('2025-01-10', 500000, 'Pending'),
('2025-01-12', 325000.00, 'Completed')


SELECT 
    orders.order_id, 
    orders.order_date, 
    orders.total_amount, 
    customers.name AS customer_name  -- Hiển thị tên khách hàng
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id;

SELECT * FROM CUSTOMERS