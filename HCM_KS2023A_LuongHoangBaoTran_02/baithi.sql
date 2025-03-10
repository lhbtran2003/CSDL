create database quanlikhachsan;

use quanlikhachsan;


-- tạo bảng customer: lưu trữ thông tin khách hàng
create table customer (
   customer_id varchar(10) primary key,
   customer_full_name varchar(150) not null,
   customer_email varchar(255) unique,
   customer_address varchar(255) not null
);

-- tạo bảng room: lưu trữ thông tin phòng khách sạn
create table room (
   room_id varchar(10) primary key,
   room_price float,
   room_status enum('Trống', 'Đã đặt'),
   room_area int 
);

-- tạo bảng booking: lưu trữ thông tin đặt phòng
create table booking (
   booking_id int auto_increment primary key,
   customer_id varchar(10) not null,
   room_id varchar(10) not null,
   check_in_date date not null, -- ngày nhận phòng
   check_out_date date not null, -- ngày trả phòng
   total_amount float
);

-- tạo bảng payment: lưu trữ thông tin thanh toán cho các lần đặt phòng 
create table payment (
   payment_id int auto_increment primary key,
   booking_id int not null,
   payment_method varchar(50),
   payment_date date not null,
   payment_amount float 
);

-- thêm cột room_type có kiểu dữ liệu là enum gồm các giá trị 'single', 'double', 'suite' vào bảng room
alter table room
add column room_type enum('single', 'double', 'suite');

-- thêm cột số điện thoại khách hàng customer_phone trong bảng customer có kiểu dữ liệu char(15)
alter table customer
add column customer_phone char(15) unique not null;

-- thêm ràng buộc cho cột total_amount trong bảng booking phải có giá trị lớn hơn bẳng không
alter table booking
modify column total_amount float check (total_amount >= 0);

-- tạo khóa ngoại ở bảng booking
alter table booking
add constraint fk_customer_booking
foreign key (customer_id) references customer(customer_id);

alter table booking 
add constraint fk_room_booking
foreign key (room_id) references room(room_id);

-- tạo khóa ngoại ở bảng payment
alter table payment
add constraint fk_booking_payment
foreign key (booking_id) references booking (booking_id);

-- thêm dữ liệu vào bảng customer
insert into customer 
values 
('C001', 'Nguyen Anh Tu', 'tu.nguyen@example.com', 'Hanoi, Vietnam', '0912345678'),
('C002', 'Tran Thi Mai', 'mai.tran@exmaple.com', 'Ho Chi Minh, Vietnam', '0923456789'),
('C003', 'Le Minh Hoang', 'hoang.le@example.com', 'Danang, Vietnam', '0934567890'),
('C004', 'Pham Hoang Nam', 'nam.pham@example.com', 'Hue, Vietnam', '0945678901'),
('C005', 'Vu Minh Thu', 'thu.vu@example.com', 'Hai Phong, Vietnam', '0956789012'),
('C006', 'Nguyen Thi Lan', 'lan.nguyen@example.com', 'Quang Ninh, Vietnam', '0967890123'),
('C007', 'Bui Minh Tuan', 'tuan.bui@example.com', 'Bac Giang, Vietnam', '0978901234'),
('C008', 'Pham Quang Hieu', 'hieu.pham@example.com', 'Quang Nam, Vietnam', '0989012345'),
('C009', 'Le Thi Lan', 'lan.le@example.com', 'Da Lat, Vietnam', '0990123456'),
('C010', 'Nguyen Thi Mai', 'mai.nguyen@example.com', 'Can Tho, Vietnam', '0901234567');

-- chỉnh sửa kiểu dữ liệu cột room_status trong bảng room
alter table room
modify column room_status enum ('Available', 'Booked');

-- thêm dữ liệu vào bảng room
insert into room
values
('R001', 100.0, 'Available', 25, 'Single'),
('R002', 150.0, 'Booked', 40, 'Double'),
('R003', 250.0, 'Available', 60, 'Suite'),
('R004', 120.0, 'Booked', 30, 'Single'),
('R005', 160.0, 'Available', 35, 'Double');

-- Thêm dữ liệu vào bảng booking
insert into booking
values
(1, 'C001', 'R001', '2025-03-01', '2025-03-05', 400.0),
(2, 'C002', 'R002', '2025-03-02', '2025-03-06', 600.0),
(3, 'C003', 'R003', '2025-03-03', '2025-03-07', 1000.0),
(4, 'C004', 'R004', '2025-03-04', '2025-03-08', 480.0),
(5, 'C005', 'R005', '2025-03-05', '2025-03-09', 800.0),
(6, 'C006', 'R001', '2025-03-06', '2025-03-10', 400.0),
(7, 'C007', 'R002', '2025-03-07', '2025-03-11', 600.0),
(8, 'C008', 'R003', '2025-03-08', '2025-03-12', 1000.0),
(9, 'C009', 'R004', '2025-03-09', '2025-03-13', 480.0),
(10, 'C010', 'R005', '2025-03-10', '2025-03-14', 800.0);

-- thêm dữ liệu vào bảng payment
insert into payment
values
(1, 1, 'Cash', '2025-03-05', 400.0),
(2, 2, 'Credit Card', '2025-03-06', 600.0),
(3, 3, 'Bank Transfer', '2025-03-07', 1000.0),
(4, 4, 'Cash', '2025-03-08', 480.0),
(5, 5, 'Credit Card', '2025-03-09', 800.0),
(6, 6, 'Bank Transfer', '2025-03-10', 400.0),
(7, 7, 'Cash', '2025-03-11', 600.0),
(8, 8, 'Credit Card', '2025-03-12', 1000.0),
(9, 9, 'Bank Transfer', '2025-03-13', 480.0),
(10, 10, 'Cash', '2025-03-14', 800.0),
(11, 1, 'Credit Card', '2025-03-15', 400.0),
(12, 2, 'Bank Transfer', '2025-03-16', 600.0),
(13, 3, 'Cash', '2025-03-17', 1000.0),
(14, 4, 'Credit Card', '2025-03-18', 480.0),
(15, 5, 'Bank Transfer', '2025-03-19', 800.0),
(16, 6, 'Cash', '2025-03-20', 400.0),
(17, 7, 'Credit Card', '2025-03-21', 600.0),
(18, 8, 'Bank Transfer', '2025-03-22', 1000.0),
(19, 9, 'Cash', '2025-03-23', 480.0),
(20, 10, 'Credit Card', '2025-03-24', 800.0);



-- Xóa các thanh toán trong bảng Payment nếu phương thức thanh toán là "Cash" và tổng tiền thanh toán (payment_amount) nhỏ hơn 500.
delete from payment
where payment_method = 'Cash' and payment_amount < 500.0;

-- Lấy thông tin khách hàng gồm mã khách hàng, họ tên, email, số điện thoại và địa chỉ được sắp xếp theo họ tên khách hàng tăng dần.
select * from customer
order by customer_full_name;
 

--  Lấy thông tin các phòng khách sạn gồm mã phòng, loại phòng, giá phòng và diện tích phòng, sắp xếp theo giá phòng giảm dần.
select room_id, room_type, room_price, room_area
from room
order by room_price DESC;


-- Lấy thông tin khách hàng và phòng khách sạn đã đặt, gồm mã khách hàng, họ tên khách hàng, mã phòng, ngày nhận phòng và ngày trả phòng.
select b.customer_id, c.customer_full_name, b.room_id, b.check_in_date, b.check_out_date
from booking b
inner join customer c
on c.customer_id = b.customer_id;


-- Lấy danh sách khách hàng và tổng tiền đã thanh toán khi đặt phòng, gồm mã khách hàng, họ tên khách hàng, phương thức thanh toán và số tiền thanh toán, sắp xếp theo số tiền thanh toán giảm dần.
select c.customer_id, c.customer_full_name, p.payment_method, p.payment_amount
from payment p
inner join booking b 
on p.booking_id = b.booking_id
inner join customer c
on c.customer_id = b.customer_id
order by p.payment_amount DESC;


-- Lấy thông tin khách hàng từ vị trí thứ 2 đến thứ 4 trong bảng Customer được sắp xếp theo tên khách hàng.
select * from customer
order by customer_full_name
limit 2 offset 2;


--  Lấy danh sách khách hàng đã đặt ít nhất 2 phòng và có tổng số tiền thanh toán trên 1000, gồm mã khách hàng, họ tên khách hàng và số lượng phòng đã đặt
select c.customer_id, c.customer_full_name, count(b.booking_id)
from booking b
inner join customer c 
on b.customer_id = c.customer_id
group by c.customer_id
having sum(b.total_amount) > 1000 and count(b.booking_id) >= 2;



-- Lấy danh sách các phòng có tổng số tiền thanh toán dưới 1000 và có ít nhất 3 khách hàng đặt, gồm mã phòng, loại phòng, giá phòng và tổng số tiền thanh toán.
select r.room_id, r.room_type, r.room_price, sum(b.total_amount)
from booking b
inner join room r
on r.room_id = b.room_id
inner join customer c
on c.customer_id = b.customer_id
group by r.room_id
having count(c.customer_id) >= 3 and sum(b.total_amount) < 1000;


-- Lấy danh sách các khách hàng có tổng số tiền thanh toán lớn hơn 1000, gồm mã khách hàng, họ tên khách hàng, mã phòng, tổng số tiền thanh toán. ???
select c.customer_id, c.customer_full_name, r.room_id, sum(b.total_amount)
from booking b 
inner join customer c
on c.customer_id = b.customer_id
inner join room r
on r.room_id = b.room_id
group by c.customer_id, r.room_id
having sum(b.total_amount) > 1000


-- Lấy danh sách các khách hàng có tổng số tiền thanh toán của lần đặt phòng cao hơn số tiền thanh toán trung bình của tất cả các khách hàng cho cùng phòng, gồm mã khách hàng, họ tên khách hàng, mã phòng, tổng tiền thanh toán
select c.customer_id, c.customer_full_name, r.room_id, sum(b.total_amount)
from booking b
inner join customer c 
on c.customer_id = b.customer_id
inner join room r
on r.room_id = b.room_id
group by c.customer_id, r.room_id
having sum(b.total_amount) = (
    select avg(total_amount) 
    from booking
    where room_id > r.room_id
);


-- tạo một view để lấy thông tin các phòng và khách hàng đã đặt, với điều kiện ngày nhận phòng nhỏ hơn ngày 2025-03-10. Cần hiển thị các thông tin sau: Mã phòng, Loại phòng, Mã khách hàng, họ tên khách hàng
create view v_room_customer
AS
select r.room_id, r.room_type, c.customer_id, c.customer_full_name
from booking b
inner join customer c 
on c.customer_id = b.customer_id 
inner join room r
on r.room_id = b.room_id
where check_in_date < '2025-03-10';


--  Hãy tạo một view để lấy thông tin khách hàng và phòng đã đặt, với điều kiện diện tích phòng lớn hơn 30 m². Cần hiển thị các thông tin sau: Mã khách hàng, Họ tên khách hàng, Mã phòng, Diện tích phòng
create view v_room_area
AS
select c.customer_id, c.customer_full_name, r.room_id, r.room_area
from booking b
inner join customer c 
on c.customer_id = b.customer_id 
inner join room r
on r.room_id = b.room_id
where r.room_area > 30;

--  Hãy tạo một trigger check_insert_booking để kiểm tra dữ liệu mối khi chèn vào bảng Booking. Kiểm tra nếu ngày đặt phòng mà sau ngày trả phòng thì thông báo lỗi với nội dung “Ngày đặt phòng không thể sau ngày trả phòng được !” và hủy thao tác chèn dữ liệu vào bảng.
create trigger check_insert_booking
before insert
on booking
for each row
  begin 
    if check_in_date > check_out_date then
      signal sqlstate '45000' set message_text = 'Ngày đặt phòng không thể sau ngày trả phòng được !';
    end if;
  end;


-- tạo một trigger có tên là update_room_status_on_booking để tự động cập nhật trạng thái phòng thành "Booked" khi một phòng được đặt (khi có bản ghi được INSERT vào bảng Booking).
create trigger update_room_status_on_booking
after insert 
on booking
for each row
   BEGIN 
      update room
      set room_status = 'Booked'
      where room_id = NEW.room_id;
   END;


-- Viết store procedure có tên add_customer để thêm mới một khách hàng với đầy đủ các thông tin cần thiết.
delimiter $$
create procedure add_customer(
       IN id_in varchar(10),
       IN name_in varchar(150), 
       IN email_in varchar(255), 
       IN address_in varchar(255), 
       IN phone_in char(15)
       )
 BEGIN
   insert into customer 
   value (id_in, name_in, email_in, address_in, phone_in);
 END $$
delimiter;

-- kiểm thử
call add_customer('C011', 'Luong Hoang Bao Tran', 'tran.luong@example.com', 'HCM', '0523657457');

-- tạo một Stored Procedure  có tên là add_payment để thực hiện việc thêm một thanh toán mới cho một lần đặt phòng.
delimiter $$
create procedure add_payment (
        IN p_booking_id int,
        IN p_payment_method varchar(50),
        IN p_payment_amount float,
        IN p_payment_date date 
       )
       begin 
         insert into payment
         value (null, p_booking_id, p_payment_method, p_payment_date, p_payment_amount);
       end $$
delimiter;

-- kiểm thử
call add_payment(10, 'Credit Card',  900.0, '2025-03-30');

