---Create View for Latest Perfomance Review
CREATE OR REPLACE VIEW "stg_employee_latest_review_vw" AS
SELECT
    p."EmployeeID",
    p."ReviewDate",
    p."PerformanceRating",
    p."PotentialRating",
    p."GoalCompletionPct",
    p."PromotionRecommended"
FROM "performance_reviews_raw" p
JOIN (
    SELECT
        "EmployeeID",
        MAX("ReviewDate") AS "MaxReviewDate"
    FROM "performance_reviews_raw"
    GROUP BY "EmployeeID"
) latest
    ON p."EmployeeID" = latest."EmployeeID"
   AND p."ReviewDate" = latest."MaxReviewDate";

--Preview
SELECT *
FROM stg_employee_latest_review_vw
LIMIT 20;