use ss12;

CREATE TABLE budget_warnings (
    warning_id INT AUTO_INCREMENT PRIMARY KEY,  
    project_id INT NOT NULL,                    
    warning_message VARCHAR(255) NOT NULL,     
    FOREIGN KEY (project_id) REFERENCES projects(project_id)  
);

-- Nếu total_salary > budget, ghi cảnh báo "Budget exceeded due to high salary" vào bảng budget_warnings.
DELIMITER //
CREATE TRIGGER total_salary_budget
AFTER UPDATE ON projects
FOR EACH ROW
  BEGIN
    IF NEW.total_salary > NEW.budget THEN
          INSERT INTO budget_warnings VALUE 
          (NULL, OLD.project_id, "Budget exceeded due to high salary");
    END IF;
 END;
 // DELIMITER;
 
 DROP TRIGGER total_salary_budget
  
-- Tạo view ProjectOverview 
CREATE VIEW ProjectOverview AS
SELECT 
    projects.project_id,
    projects.name,
    projects.budget,
    projects.total_salary,
    budget_warnings.warning_message
FROM projects 
LEFT JOIN budget_warnings  ON projects.project_id = budget_warnings.project_id;

--  Tiến hành thêm nhân viên sau:
INSERT INTO workers (name, project_id, salary) VALUES ('Michael', 1, 6000.00);

INSERT INTO workers (name, project_id, salary) VALUES ('Sarah', 2, 10000.00);

INSERT INTO workers (name, project_id, salary) VALUES ('David', 3, 1000.00);

--  Hiển thị lại bảng budget_warnings và view ProjectOverview để kiểm chứng
SELECT * FROM budget_warnings;
SELECT * FROM ProjectOverview
