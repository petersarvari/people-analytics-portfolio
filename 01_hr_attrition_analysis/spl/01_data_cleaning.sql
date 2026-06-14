-- Row count
SELECT COUNT(*)
FROM hr_attrition;

-- Check redundant columns
SELECT DISTINCT employeecount
FROM hr_attrition;

SELECT DISTINCT over18
FROM hr_attrition;

SELECT DISTINCT standardhours
FROM hr_attrition;

-- Check attrition distribution
SELECT attrition,
       COUNT(*) AS employee_count
FROM hr_attrition
GROUP BY Attrition;
