use ss9;

CREATE VIEW view_manager_summary AS
SELECT 
    e.manager_id,
    COUNT(e.employee_id) AS total_employees
FROM employees e
GROUP BY manager_id;

SELECT * FROM view_manager_summary 

SELECT * from employees
