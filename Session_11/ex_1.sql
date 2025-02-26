use session_11;

CREATE VIEW EmployeeBranch
AS
SELECT employees.employeeid, employees.fullName fullname,
       employees.position as position, employees.salary, branch.BranchName, branch.Location
       
 from employees
 INNER JOIN branch
 ON employees.branchId = branch.branchId


CREATE VIEW HighSalaryEmployees
AS
SELECT employeeid, employees.fullName,
       position, salary
       
 from employees
 where salary > 15000000

SELECT * FROM EmployeeBranch
SELECT * FROM HighSalaryEmployees

CREATE OR REPLACE VIEW EmployeeBranch
AS
SELECT employees.employeeid, employees.fullName fullname, branch.phoneNumber,
       employees.position as position, employees.salary, branch.BranchName, branch.Location
       
 from employees
 INNER JOIN branch
 ON employees.branchId = branch.branchId
 
 -- bị lỗi ở đây do ko xóa từ view có join bảng đc
 DELETE FROM EmployeeBranch
 WHERE branchname = "Chi nhánh Hà Nội"
 
 
