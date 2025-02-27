use ss12;

CREATE TABLE deleted_orders (
    deleted_id INT AUTO_INCREMENT PRIMARY KEY, 
    order_id INT NOT NULL,                     
    customer_name VARCHAR(100) NOT NULL,       
    product VARCHAR(100) NOT NULL,            
    order_date DATE NOT NULL,                  
    deleted_at DATETIME NOT NULL             
);

-- Tạo trigger AFTER DELETE để lưu thông tin các đơn hàng bị xóa vào bảng deleted_orders
CREATE TRIGGER save_delete_order
AFTER DELETE ON orders
FOR EACH ROW
   INSERT INTO deleted_orders VALUE
   (null, old.order_id, old.customer_name, old.product, old.order_date, CURRENT_DATE());
   
   
-- Xóa đơn hàng có order_id = 4.
DELETE FROM orders
WHERE order_id = 4;

-- Xóa đơn hàng có order_id = 5.
DELETE FROM orders
WHERE order_id = 5;

-- Kiểm tra dữ liệu trong bảng deleted_orders
SELECT * FROM deleted_orders;