use session_11;

delimiter //
CREATE PROCEDURE GetCustomerByPhone(IN PhoneNumber_IN VARCHAR(15))
BEGIN
  SELECT  CustomerID, FullName, DateOfBirth, Address, Email
  FROM customers
  WHERE PhoneNumber = PhoneNumber_IN;
END;
// delimiter;

call GetCustomerByPhone ('0901234567');

SELECT * from accounts

delimiter //
create PROCEDURE getTotalBalance (IN CustomerID_IN INT, OUT TotalBalance DECIMAL(15,2))
BEGIN
  select sum(Balance) into TotalBalance
  from accounts
  where accounts.CustomerID = CustomerID_IN
  GROUP BY accounts.CustomerID;
END; //
delimiter;


call GETTotalBalance(1, @total);
SELECT @total as totalbalance

    
DROP PROCEDURE getTotalBalance

DELIMITER //
  CREATE PROCEDURE IncreaseEmployeeSalary(INOUT Salary_INOUT DECIMAL(10,2), IN EmployeeID_IN INT)
  BEGIN
     SET Salary_INOUT = Salary_INOUT * 1.10;
     
     UPDATE Employees
     SET Salary = Salary_INOUT
     WHERE EmployeeID = EmployeeID_IN;
   END; //
 DELIMITER;
 
 set @salary = 100000;
 CALL IncreaseEmployeeSalary(@salary, 4);
 SELECT @salary
 
 
 DELIMITER //
 CREATE PROCEDURE GetCustomerByPhone 