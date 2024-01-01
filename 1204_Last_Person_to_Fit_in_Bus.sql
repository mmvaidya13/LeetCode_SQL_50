WITH
    Order_Que
    AS
    (
        SELECT person_id 
    , person_name 
    , Turn
    , SUM(weight) OVER(ORDER BY Turn) AS S_W
        FROM Queue
    )

SELECT TOP 1
    person_name
FROM Order_Que
WHERE S_W <=1000
ORDER BY Turn DESC
