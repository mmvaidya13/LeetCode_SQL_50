SELECT MAN.name  
    FROM Employee MAN
    LEFT JOIN Employee EMP ON MAN.id  =EMP.managerId 
    GROUP BY MAN.id
        ,MAN.name 
    HAVING COUNT(EMP.id)>=5