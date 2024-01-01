SELECT EMP.employee_id  AS employee_id
FROM Employees EMP
     LEFT JOIN Employees MAN ON EMP.manager_id =  MAN.employee_id
WHERE MAN.employee_id IS NULL
     AND ISNULL(EMP.manager_id,0) > 0
     AND EMP.salary <30000
ORDER BY  EMP.employee_id