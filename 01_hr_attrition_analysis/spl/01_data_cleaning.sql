-- HR Attrition Analysis
-- 01_data_cleaning.sql

-- 1. Check row count
SELECT COUNT(*) AS row_count
FROM hr_attrition;

-- 2. Check first rows
SELECT *
FROM hr_attrition
LIMIT 10;

-- 3. Check duplicate employee IDs
SELECT 
    employeenumber,
    COUNT(*) AS duplicate_count
FROM hr_attrition
GROUP BY employeenumber
HAVING COUNT(*) > 1;

-- 4. Check redundant columns
SELECT DISTINCT employeecount
FROM hr_attrition;

SELECT DISTINCT over18
FROM hr_attrition;

SELECT DISTINCT standardhours
FROM hr_attrition;

-- 5. Check attrition distribution
SELECT 
    attrition,
    COUNT(*) AS employee_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM hr_attrition
GROUP BY attrition;

-- 6. Check missing values in key columns
SELECT
    COUNT(*) - COUNT(age) AS missing_age,
    COUNT(*) - COUNT(attrition) AS missing_attrition,
    COUNT(*) - COUNT(department) AS missing_department,
    COUNT(*) - COUNT(monthlyincome) AS missing_monthlyincome,
    COUNT(*) - COUNT(overtime) AS missing_overtime,
    COUNT(*) - COUNT(jobrole) AS missing_jobrole
FROM hr_attrition;
