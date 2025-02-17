USE LUYENTAP_3;

CREATE TABLE CUSTOMER_MANAGEMENT (
   CUSTOMER_ID INT PRIMARY KEY,
   CUSTOMER_NAME VARCHAR(50) NOT NULL,
   BIRTHDAY DATE NOT NULL,
   SEX BIT NOT NULL,
   JOB VARCHAR(50),
   PHONE_NUMBER CHAR(11) UNIQUE NOT NULL,
   EMAIL VARCHAR(100) NOT NULL UNIQUE,
   ADDRESS VARCHAR(255) NOT NULL
)

INSERT INTO CUSTOMER_MANAGEMENT (CUSTOMER_ID, CUSTOMER_NAME, BIRTHDAY, SEX, JOB, PHONE_NUMBER, EMAIL, ADDRESS)
VALUES
(1, 'Nguyễn Văn A', '1990-05-15', 1, 'Kỹ sư', '09123456789', 'nguyenvana@example.com', '123 Đường ABC, Hà Nội'),
(2, 'Trần Thị B', '1985-08-20', 0, 'Giáo viên', '09234567890', 'tranthib@example.com', '456 Đường XYZ, TP.HCM'),
(3, 'Lê Văn C', '1992-12-10', 1, 'Bác sĩ', '09345678901', 'levanc@example.com', '789 Đường DEF, Đà Nẵng'),
(4, 'Phạm Thị D', '1988-03-25', 0, 'Nhân viên văn phòng', '09456789012', 'phamthid@example.com', '321 Đường GHI, Cần Thơ'),
(5, 'Hoàng Văn E', '1995-07-07', 1, 'Lập trình viên', '09567890123', 'hoangvane@example.com', '654 Đường JKL, Hải Phòng'),
(6, 'Đặng Thị F', '1991-11-30', 0, 'Kế toán', '09678901234', 'dangthif@example.com', '987 Đường MNO, Nha Trang'),
(7, 'Vũ Văn G', '1983-09-14', 1, 'Luật sư', '09789012345', 'vuvang@example.com', '159 Đường PQR, Huế'),
(8, 'Bùi Thị H', '1997-06-22', 0, 'Nhà báo', '09890123456', 'buithih@example.com', '753 Đường STU, Vũng Tàu'),
(9, 'Ngô Văn I', '1980-04-18', 1, 'Doanh nhân', '09901234567', 'ngovanii@example.com', '852 Đường VWX, Bình Dương'),
(10, 'Dương Thị K', '1993-10-05', 0, 'Nhà thiết kế', '09012345678', 'duongthik@example.com', '369 Đường YZ, Đồng Nai');

UPDATE CUSTOMER_MANAGEMENT 
SET CUSTOMER_NAME = 'Nguyen Quang Nhat', BIRTHDAY= '2024-01-11'
WHERE CUSTOMER_ID = 3


SELECT CUSTOMER_ID, CUSTOMER_NAME, BIRTHDAY, SEX, PHONE_NUMBER
FROM CUSTOMER_MANAGEMENT
WHERE BIRTHDAY > '2000-01-01'

SELECT * 
FROM CUSTOMER_MANAGEMENT
WHERE JOB = NULL;
