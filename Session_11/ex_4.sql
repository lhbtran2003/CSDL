use session_11;

delimiter //

CREATE PROCEDURE UpdateSalaryByID (IN employee_id_IN int, INOUT current_salary DECIMAL(10,2))
BEGIN
 SELECT Salary into current_salary 
 FROM employees
 WHERE EmployeeID = employee_id_IN;
   IF current_salary < 20000000 THEN
      SET current_salary = current_salary * 1.1;
   ELSE
      SET current_salary = current_salary * 0.05;
   END IF;
   
   UPDATE employees
   SET Salary = current_salary
    WHERE EmployeeID = employee_id_IN;
 END; //
 DELIMITER;
 
 SET @salary = 10000;
 
 call PROCEDURE UpdateSalaryByID(4, @salary);
 SELECT @salary;
 
  
   
 
      