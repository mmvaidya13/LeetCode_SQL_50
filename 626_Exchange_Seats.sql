SELECT S.id
, ISNULL((CASE WHEN id %2!=0 THEN LEAD(student,1)OVER (ORDER BY id)
    ELSE  LAG(student,1) OVER (ORDER BY id) END),S.student)  AS student
FROM Seat S
ORDER BY id