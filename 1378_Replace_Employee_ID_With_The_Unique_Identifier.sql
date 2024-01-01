SELECT EUI.unique_id 
,EMP.name     
FROM Employees  EMP
LEFT JOIN EmployeeUNI EUI ON EMP.id =EUI.id 