CREATE DATABASE session_2

USE session_2;

CREATE TABLE OrderDetails (
   id int PRIMARY KEY,
   email VARCHAR(50) UNIQUE not null,
   order_date DATE not null,
   total_price double CHECK(total_price > 0),
   quantity int CHECK(quantity > 0),
   sta_tus bit DEFAULT(0),
   delivery_address VARCHAR(255) NOT null,
   payment_method VARCHAR(50) DEFAULT"Cash",
   create_at DATETIME DEFAULT(CURRENT_TIMESTAMP)
)


