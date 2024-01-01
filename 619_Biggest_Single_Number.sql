WITH
    Single_Num
    AS
    (
        SELECT num
, COUNT(NUM) AS C
        FROM MyNumbers
        GROUP BY num
    )
SELECT MAX(NUM)  AS num
FROM Single_Num
WHERE C=1