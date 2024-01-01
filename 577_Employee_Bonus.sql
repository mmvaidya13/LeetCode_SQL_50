SELECT EMP.name
    ,BO.bonus
FROM Employee  EMP
    LEFT JOIN Bonus  BO ON EMP.empId =BO.empId
WHERE ISNULL(BO. bonus,0) <1000