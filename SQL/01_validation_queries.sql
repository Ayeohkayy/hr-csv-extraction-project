--validate the raw tables in SQL
SELECT COUNT(*) AS employee_rows FROM employees_raw;
SELECT COUNT(*) AS department_rows FROM departments_raw;
SELECT COUNT(*) AS performance_rows FROM performance_reviews_raw;
SELECT COUNT(*) AS compensation_rows FROM compensation_history_raw;


--preview the data
SELECT * FROM employees_raw LIMIT 10;
SELECT * FROM departments_raw LIMIT 10;
SELECT * FROM performance_reviews_raw LIMIT 10;
SELECT * FROM compensation_history_raw LIMIT 10;


---check your key columns---
--Check for missing employee IDs
SELECT *
FROM employees_raw
WHERE "EmployeeID" IS NULL;

SELECT *
FROM performance_reviews_raw
WHERE "EmployeeID" IS NULL;

SELECT *
FROM compensation_history_raw
WHERE "EmployeeID" IS NULL;


--Check for missing department IDs
SELECT *
FROM employees_raw
WHERE "DepartmentID" IS NULL;


--Check for unmatched departments
SELECT DISTINCT e."DepartmentID"
FROM employees_raw e
LEFT JOIN departments_raw d
    ON e."DepartmentID" = d."DepartmentID"
WHERE d."DepartmentID" IS NULL;