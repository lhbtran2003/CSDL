USE ss12;

CREATE TRIGGER before_insert
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF NEW.quantity IS NULL OR NEW.quantity < 1 THEN
        SET NEW.quantity = 1;
    END IF;
    
    IF NEW.order_date IS NULL THEN
        SET NEW.order_date = CURRENT_DATE();
    END IF;
END;

INSERT INTO  orders (customer_name, product, quantity, price, order_date) values
('John', 'Mouse', -3, 50.00, '2023-05-01'),
('John', 'Mouse', -3, 50.00, '2023-05-01');

select * from orders

drop TRIGGER before_insert