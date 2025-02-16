CREATE DATABASE Session_3;

Use session_3;

CREATE TABLE STUDENT (
STUDENT_ID INT PRIMARY KEY NOT NULL,
NAME VARCHAR(255) NOT NULL,
EMAIL VARCHAR(255) UNIQUE NOT NULL,
AGE INT CHECK (AGE > 0) NOT NULL,
);

INSERT INTO STUDENT (NAME, EMAIL, AGE)
VALUES ('Nguyen Van A', 'nguyenvana@example.com', 22),
('Le Thi B', 'lethib@example.com', 20),
('Tran Van C', 'tranvanc@example.com', 23),
('Pham Thi D', 'phamthid@example.com', 21);
UPDATE STUDENT 
SET EMAIL = ‘newemail@example.com’
WHERE NAME = ‘Tran Van C’


