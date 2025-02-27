use ss12;

CREATE TABLE order_warning (
    warning_id INT AUTO_INCREMENT PRIMARY KEY,  
    order_id INT NOT NULL,                      
    warning_message VARCHAR(255) NOT NULL     
);

-- Tạo trigger AFTER INSERT để kiểm tra tổng giá trị của đơn hàng (quantity * price):
-- Nếu tổng giá trị lớn hơn 5000, ghi cảnh báo "Total value exceeds limit"  vào bảng order_warnings
CREATE TRIGGER check_total_value
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
   IF(NEW.quantity * NEW.price) > 5000 THEN
      INSERT INTO order_warning VALUE 
      (null, NEW.order_id, "Total value exceeds limit");
    END IF;
END;

-- Thêm đơn hàng mới: ('Mark', 'Monitor', 2, 3000.00, '2023-08-01').
INSERT INTO orders VALUE (NULL,'Mark', 'Monitor', 2, 3000.00, '2023-08-01');

-- Thêm đơn hàng mới: ('Paul', 'Mouse', 1, 50.00, '2023-08-02').
INSERT INTO orders VALUE (NULL,'Paul', 'Mouse', 1, 50.00, '2023-08-02');


-- KIỂM TRA DỮ LIỆU
SELECT * FROM order_warning