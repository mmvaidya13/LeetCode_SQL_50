SELECT Department
, Employee
, Salary
FROM
  (
    SELECT B.name AS Department
    , A.name AS Employee
    , A.salary AS Salary
    , DENSE_RANK() OVER(PARTITION BY B.ID  ORDER BY A.salary DESC) AS rnk
  FROM Employee A
    INNER JOIN Department B ON A.departmentId = B.id
  )  C
WHERE C.rnk IN (1,2,3)