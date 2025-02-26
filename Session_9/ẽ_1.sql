use ss9;

create view high_salary_employees
AS
SELECT employee_id, name, salary from employees
where salary > 5000

SELECT * from high_salary_employees

INSERT INTO employees (name, department, salary, manager_id) VALUES
('Kelly', 'Sales', 18060, NULL)       

DELETE FROM EMPLOYEES
WHERE EMPLOYEE_ID = 11
