use ss12;

-- tạo bảng price_changes
CREATE TABLE price_changes (
   change_id int auto_increment PRIMARY KEY,
   product VARCHAR(100) not null,
   old_price DECIMAL(10,2) NOT null,
   new_price DECIMAL(10,2) not null
)
drop table price_changes;
DROP TRIGGER after_update_price

create TRIGGER after_update_price
after update on orders
for each row
BEGIN  
-- cột product e chưa biết lấy kiểu gì nên e gán đại giá trị cho nó nha thầy =))
  INSERT INTO price_changes(product, old_price, new_price) 
  VALUES('aaa', OLD.price, New.price);
END;
  
-- thử cập nhật giá sản phẩm
update orders
set price = 1500.00
where product = 'Laptop'
  
-- kiểm tra lại dữ liệu
SELECT * from price_changes
SELECT * from orders