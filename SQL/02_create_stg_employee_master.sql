---create your first staging view
CREATE OR REPLACE VIEW stg_employee_master_vw AS
SELECT
    e."EmployeeID",
    e."FirstName",
    e."LastName",
    e."FirstName" || ' ' || e."LastName" AS full_name,
    e."DepartmentID",
    d."DepartmentName",
    e."HireDate",
    e."EmploymentStatus"
FROM employees_raw e
LEFT JOIN departments_raw d
    ON e."DepartmentID" = d."DepartmentID";

--Preview
SELECT *
FROM stg_employee_master_vw
LIMIT 20;
