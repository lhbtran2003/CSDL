CREATE DATABASE quanlybanhang;
USE quanlybanhang;
CREATE TABLE customers (
  customer_id INT PRIMARY KEY auto_increment,
  customer_name VARCHAR (100) NOT NULL,
  phone VARCHAR (20) UNIQUE NOT NULL,
  address VARCHAR (255)
);

CREATE TABLE Products (
  product_id INT PRIMARY KEY auto_increment,
  product_name VARCHAR (100) NOT NULL UNIQUE,
  price DECIMAL (10, 2) NOT NULL,
  quantity INT NOT NULL CHECK(quantity > 0),
  category VARCHAR (50)
);

CREATE Table Employees (
employee_id int primary key auto_increment, 
employee_name varchar(100) not null, 
birthday date,
position varchar(50) not null,
salary varchar(50) not null,
revenue decimal(10,2) DEFAULT 0
);

CREATE table orders (
order_id int primary key auto_increment, 
customer_id int,
order_date datetime DEFAULT CURRENT_TIMESTAMP(),
total_amount decimal (10,2) DEFAULT 10,
employee_id int,
foreign key (customer_id) references customers(customer_id), 
foreign key (employee_id) references employees (employee_id)
);

CREATE Table oderdetails (
order_detail_id int primary key auto_increment, 
order_id int,
product_id int,
quantity int not null check (quantity>0), 
unit_price decimal (10,2),
foreign key (order_id) references orders (order_id), 
foreign key ( product_id) references products (product_id)
);
 
-- Chỉnh sửa cấu trúc bảng : thêm cột email vào customers
 Alter table customers
Add column email varchar (100);
-- Xóa cột birthday ra khỏi employees
Alter table employees
Drop column birthday;
 
-- chèn dữ liệu vào bảng customers
 INSERT INTO customers (customer_name, phone, address, email) VALUES
('Nguyễn Văn A', '0987654321', 'Hà Nội', 'nguyenvana@gmail.com'),
('Trần Thị B', '0977123456', 'Hồ Chí Minh', 'tranthib@example.com'),
('Lê Văn C', '0966234567', 'Đà Nẵng', 'levanc@example.com'),
('Phạm Văn D', '0956345678', 'Cần Thơ', 'phamvand@example.com'),
('Hoàng Thị E', '0946456789', 'Hải Phòng', 'hoangthie@example.com'),
('Lương Hoàng Bảo Trân', '0523653457', 'Hải Phòng', 'hoangthie@example.com');
  
-- chèn dữ liệu vào bảng products
 INSERT INTO products (product_name, price, quantity, category) VALUES
('Laptop Dell', 15000000, 10, 'Electronics'),
('iPhone 14', 22000000, 15, 'Mobile'),
('Tivi Samsung', 18000000, 8, 'Electronics'),
('Máy Giặt LG', 12000000, 12, 'Appliances'),
('Loa Bluetooth', 2000000, 30, 'Accessories');

-- chèn dữ liệu vào bảng employees
 INSERT INTO employees (employee_name, position, salary, revenue) VALUES
('Trần Văn A', 'Quản lý', 15000000, 50000000),
('Lê Thị B', 'Nhân viên bán hàng', 8000000, 20000000),
('Nguyễn Văn C', 'Nhân viên bán hàng', 8500000, 25000000),
('Phạm Thị D', 'Kế toán', 12000000, 40000000),
('Hoàng Văn E', 'Bảo vệ', 6000000, 0);

-- chèn dữ liệu vào bảng ORDERS
 INSERT INTO orders (customer_id, order_date, total_amount, employee_id) VALUES
(1, '2024-03-01 10:00:00', 25000000, 1),
(2, '2024-03-02 14:30:00', 18000000, 2),
(3, '2024-03-03 09:45:00', 22000000, 3),
(4, '2024-03-04 17:20:00', 15000000, 4),
(5, '2024-03-05 11:15:00', 12000000, 5),
(5, '2025-03-05 11:15:00', 12000000, 5),
(5, '2025-03-05 11:15:00', 12000000, 5);

-- chèn dữ liệu vào bảng orderdetails
 INSERT INTO oderdetails (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 15000000),
(2, 2, 1, 22000000),
(3, 3, 1, 18000000),
(4, 4, 1, 12000000),
(5, 5, 2, 2000000),
(5, 5, 101, 2000000);

-- Lấy danh sách tất cả khách hàng từ bảng Customers. Thông tin gồm : mã khách hàng, tên khách hàng, email, số điện thoại và địa chỉ
SELECT * FROM CUSTOMERS;

-- Sửa thông tin của sản phẩm có product_id = 1 theo yêu cầu : product_name= “Laptop Dell XPS” và price = 99.99
Update products
set product_name=" Laptop Dell xps" , price = 99.99
where product_id= 1;

-- Lấy thông tin những đơn đặt hàng gồm : mã đơn hàng, tên khách hàng, tên nhân viên, tổng tiền và ngày đặt hàng.
SELECT o.order_id, c.customer_name, e.employee_name, o.total_amount, o.order_date
FROM orders o
INNER JOIN customers c on  o.customer_id = c.customer_id 
INNER JOIN employees e on o.employee_id = e.employee_id;

-- Đếm số lượng đơn hàng của mỗi khách hàng. Thông tin gồm : mã khách hàng, tên khách hàng, tổng số đơn
Select customers.customer_id, customers.customer_name, count(orders.order_id) as total_order
from customers
inner Join orders
ON customers.customer_id = orders.customer_id 
group by customer_id;

-- Thống kê tổng doanh thu của từng nhân viên trong năm hiện tại. Thông tin gồm : mã nhân viên, tên nhân viên, doanh thu
Select employees.employee_id, employees.employee_name, sum(orders.total_amount)
from employees
inner join orders
ON orders.employee_id= employees. employee_id
where year(order_date) = YEAR(CURDATE())
GROUP BY employees.employee_id;

-- Thống kê những sản phẩm có số lượng đặt hàng lớn hơn 100 trong tháng hiện tại. Thông tin gồm : mã sản phẩm, tên sản phẩm, số lượt đặt và sắp xếp theo số lượng giảm dần
Select p.product_id, p.product_name, ode.quantity
From oderdetails ode
inner join products p
on p.product_id= ode.product_id 
where ode.quantity > 100
order by quantity DESC;

-- Lấy danh sách khách hàng chưa từng đặt hàng. Thông tin gồm : mã khách hàng và tên khách hàng
SELECT o.order_id, c.customer_id, c.customer_name 
from orders o
RIGHT JOIN customers c
on c.customer_id = o.customer_id
WHERE o.order_id IS NULL  

-- Lấy danh sách sản phẩm có giá cao hơn giá trung bình của tất cả sản phẩm
SELECT * FROM products
where price > (SELECT avg(price) from products);

-- Tìm những khách hàng có mức chi tiêu cao nhất. Thông tin gồm : mã khách hàng, tên khách hàng và tổng chi tiêu (Nếu các khách hàng có cùng mức chi tiêu thì lấy hết)
SELECT c.customer_id, c.customer_name, sum(o.total_amount) as total_spent 
from orders o 
INNER JOIN customers c 
on c.customer_id = o.customer_id
group by c.customer_id
having total_spent = (
  select max(total_amount)
  from (
    select customer_id, sum(total_amount) as total_amount
    from orders
    GROUP BY customer_id
  ) as subquery
)

--  Tạo view có tên view_order_list hiển thị thông tin đơn hàng gồm : mã đơn hàng, tên khách hàng, tên nhân viên, tổng tiền và ngày đặt. Các bản ghi sắp xếp theo thứ tự ngày đặt mới nhất
create view view_order_list
AS
Select o.order_id,
c.customer_name,
e.employee_name,
o.total_amount,
o.order_date
from orders o
inner join customers c on c.customer_id = o.customer_id
inner join employees e on e.employee_id = o.employee_id
ORDER BY o.order_date DESC;

CREATE OR REPLACE VIEW view_order_list
AS
Select o.order_id,
c.customer_name,
e.employee_name,
o.total_amount,
o.order_date
from orders o
inner join customers c on c.customer_id = o.customer_id
inner join employees e on e.employee_id = o.employee_id
ORDER BY o.order_date DESC;

-- kiểm tra view
SELECT * from view_order_list

-- Tạo view có tên view_order_detail_product hiển thị chi tiết đơn hàng gồm : Mã chi tiết đơn hàng, tên sản phẩm, số lượng và giá tại thời điểm mua. Thông tin sắp xếp theo số lượng giảm dần
Create view view_order_detail_product
As
Select od.order_detail_id, p.product_name,
od.quantity, od.unit_price
from oderdetails od
inner join products p
on p.product_id = od.product_id
ORDER BY od.quantity DESC

-- Tạo thủ tục có tên proc_insert_employee nhận vào các thông tin cần thiết (trừ mã nhân viên và tổng doanh thu) , thực hiện thêm mới dữ liệu vào bảng nhân viên và trả về mã nhân viên vừa mới thêm. 
delimiter //
create procedure proc_insert_employee 
   (IN employee_name_in varchar(100),
    IN position_in varchar(50),
    IN salary_in varchar(50),
    OUT employee_id_out int
   )
 begin 
   insert into employees
   value (null, employee_name_in, position_in, salary_in, null);
   
   select employee_id into employee_id_out
   from employees
   where employee_name = employee_name_in;
  end; //
delimiter;

drop procedure proc_cal_total_amount_by_order

call proc_insert_employee('Nguyễn Ngọc Hương Thảo', 'Kế toán', 12000000, @id);

SELECT @id;

-- Tạo thủ tục có tên proc_get_orderdetails lọc những chi tiết đơn hàng dựa theo mã đặt hàng.
delimiter //
 create procedure proc_get_orderdetails (IN order_id_in int)
   begin
     select * from oderdetails
     where order_id = order_id_in;
   end;//
delimiter;

call proc_get_orderdetails(1)

-- Tạo thủ tục có tên proc_cal_total_amount_by_order nhận vào tham số là mã đơn hàng và trả về số lượng loại sản phẩm trong đơn hàng đó.
delimiter //
 create procedure proc_cal_total_amount_by_order (IN order_id_in int)
   begin 
     select count(ode.order_detail_id), o.order_id
     from orders o
     inner join oderdetails ode
     on o.order_id = ode.order_id
     group by o.order_id
     having o.order_id = order_id_in;
   end;// 
delimiter;

call proc_cal_total_amount_by_order(5)

 
-- Tạo trigger có tên trigger_after_insert_order_details để tự động cập nhật số lượng sản phẩm trong kho mỗi khi thêm một chi tiết đơn hàng mới. Nếu số lượng trong kho không đủ thì ném ra thông báo lỗi “Số lượng sản phẩm trong kho không đủ” và hủy thao tác chèn.
delimiter //
 create trigger trigger_after_insert_order_details
 after insert 
 on oderdetails
 for each row 
 begin 
    declare stock int;
     
    -- lấy số lượng sản phẩm hiện có trong kho
    select quantity into stock
    from products
    where product_id = NEW.product_id;
    
    -- kiểm tra nếu số lượng đặt hàng 
    if NEW.quantity > stock then
      signal SQLSTATE "45000" set message_text='Số lượng sản phẩm trong kho không đủ';
    else
      update products
      set quantity = quantity - NEW.quantity;
    end if;
  end//
  delimiter;

  
  drop TRIGGER trigger_after_insert_order_details
   
    
     
   
