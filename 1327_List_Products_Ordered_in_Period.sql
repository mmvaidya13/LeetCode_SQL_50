/* Write your T-SQL query statement below */
WITH
    MAX_PRO
    AS
    
    (
        SELECT product_id   
    , SUM( unit) AS unit
        FROM Orders
        WHERE DATEPART(year, order_date   )=2020
            AND DATEPART(MONTH, order_date   )=2
        GROUP BY product_id
        --HAVING SUM(unit)>=100
    )

SELECT P.product_name          
, MP.unit
FROM Products P
    INNER JOIN MAX_PRO MP ON P.product_id  = MP.product_id
WHERE MP.unit>=100  