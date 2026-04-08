--Current Comp View
CREATE TABLE "stg_employee_current_comp" AS
SELECT
    c."EmployeeID",
    c."BaseSalary",
    c."BonusTargetPct",
    c."AnnualBonusTarget",
    c."PayGrade",
    c."EffectiveDate"
FROM "compensation_history_raw" c
JOIN (
    SELECT
        "EmployeeID",
        MAX("EffectiveDate") AS "MaxEffectiveDate"
    FROM "compensation_history_raw"
    GROUP BY "EmployeeID"
) latest
    ON c."EmployeeID" = latest."EmployeeID"
   AND c."EffectiveDate" = latest."MaxEffectiveDate";


--Preview
SELECT *
FROM stg_employee_current_comp
LIMIT 20;