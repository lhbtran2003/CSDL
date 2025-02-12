CREATE DATABASE session_2

USE session_2;

CREATE TABLE Customers (
    id int PRIMARY key ,
    name VARCHAR(255) not null,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number CHAR(10) UNIQUE null,
    create_at DATETIME DEFAULT(CURRENT_TIMESTAMP)
)



CREATE table Orders (
     id int PRIMARY key,
     order_date date not null,
     customer_id int not null,
     FOREIGN key(customer_id) REFERENCES Customers(id)
)
