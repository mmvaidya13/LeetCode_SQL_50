SELECT ISNULL((SELECT TOP 1
        salary
    FROM( 
SELECT salary
    , DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
        FROM Employee) A
    where rnk = 2),NULL) AS SecondHighestSalary