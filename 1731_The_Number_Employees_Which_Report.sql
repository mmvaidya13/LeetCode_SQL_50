SELECT MAN.employee_id 
, MAN.name  
, COUNT(EMP.employee_id ) AS reports_count 
, CAST(ROUND(AVG(CAST(EMP.age AS DECIMAL)),0) AS BIGINT) AS average_age
FROM Employees MAN
    INNER JOIN Employees EMP ON MAN.employee_id = EMP.reports_to
GROUP BY MAN.employee_id 
,MAN.name
ORDER BY MAN.employee_id 