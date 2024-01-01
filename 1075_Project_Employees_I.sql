/* Write your T-SQL query statement below */
SELECT PRO.project_id
,ROUND(AVG(convert(decimal(11, 2),EMP.experience_years)),2) AS average_years 
FROM Project PRO
INNER JOIN Employee EMP ON PRO.employee_id = EMP.employee_id 
GROUP BY PRO.project_id