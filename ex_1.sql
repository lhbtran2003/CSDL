CREATE DATABASE session_2

CREATE TABLE UserDetails (
  id int PRIMARY KEY,
  full_name VARCHAR(255) not NULL,
  description TEXT,
  phone_number CHAR(10),
  last_login TIMESTAMP,
)