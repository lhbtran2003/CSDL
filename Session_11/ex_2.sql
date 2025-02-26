use session_11;

create INDEX idx_phoneNumber 
ON customers(PhoneNumber);

EXPLAIN SELECT * FROM Customers WHERE PhoneNumber = '0901234567';

CREATE INDEX idx_id_salary
ON employees(employeeId, salary)

EXPLAIN SELECT * FROM Employees WHERE BranchID = 1 AND Salary > 20000000;

--  Tạo một Unique Index trên cột AccountID và CustomerID của bảng Accounts 
CREATE UNIQUE INDEX idx_unique_acoountId_customerId
on accounts(AccountID, CustomerID);

-- Hiển thị danh sách Index đã tạo trong bảng Customers, Employees và Accounts.
SHOW INDEX FROM Customers;
SHOW INDEX FROM Employees;
SHOW INDEX FROM Accounts;

-- Hãy xóa các index đã tạo trước đó trong bảng Customers, Employees và Accounts.
DROP INDEX idx_phoneNumber ON customers;
DROP INDEX idx_id_salary ON employees;
DROP INDEX idx_unique_acoountId_customerId ON accounts
