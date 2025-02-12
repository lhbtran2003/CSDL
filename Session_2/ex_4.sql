CREATE DATABASE session_2

USE session_2;

CREATE TABLE Customer (
    customer_id int PRIMARY key ,
    name VARCHAR(255) not null,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    create_at DATETIME DEFAULT(CURRENT_TIMESTAMP)
)



CREATE table Orderr (
     order_id int PRIMARY key,
     order_date date not null,
     amount DECIMAL 
)

alter table customer
DROP COLUMN phone;


drop TABLE orderr

alter table customer
RENAME COLUMN name to full_name

-- đang bị sai
alter table customer
MODIFY COLUMN email TEXT
 
 
alter table customer
add COLUMN address TEXT