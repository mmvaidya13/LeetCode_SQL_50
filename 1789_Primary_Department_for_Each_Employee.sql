SELECT E.employee_id
	,E.department_id
FROM Employee E
WHERE E.primary_flag = 'Y'

UNION

SELECT E.employee_id
	,E.department_id
FROM Employee E
WHERE E.employee_id IN (
		SELECT E.employee_id
		FROM Employee E
		GROUP BY E.employee_id
		HAVING COUNT(E.employee_id) = 1
		)