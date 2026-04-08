--Create Final Combined Staging View
CREATE OR REPLACE VIEW "stg_employee_analytics_ready_vw" AS
SELECT
    e."EmployeeID",
    e."FirstName" || ' ' || e."LastName" AS "FullName",
    e."DepartmentID",
    d."DepartmentName",
    e."ManagerID",
    e."HireDate",
    e."EmploymentStatus",
    c."BaseSalary",
    c."BonusTargetPct",
    c."AnnualBonusTarget",
    c."PayGrade",
    c."EffectiveDate" AS "CompEffectiveDate",
    r."ReviewDate",
    r."PerformanceRating",
    r."PotentialRating",
    r."GoalCompletionPct",
    r."PromotionRecommended"
FROM "employees_raw" e
LEFT JOIN "departments_raw" d
    ON e."DepartmentID" = d."DepartmentID"
LEFT JOIN "stg_employee_current_comp" c
    ON e."EmployeeID" = c."EmployeeID"
LEFT JOIN "stg_employee_latest_review_vw" r
    ON e."EmployeeID" = r."EmployeeID";

--Preview
SELECT *
FROM "stg_employee_analytics_ready_vw"
LIMIT 20;