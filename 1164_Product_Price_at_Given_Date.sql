/* Write your T-SQL query statement below */
WITH Match_Data AS
(
    SELECT P2.product_id 
        ,P2.change_date 
        ,P2.new_price  
        ,RANK()OVER(PARTITION BY P2.product_id ORDER BY P2.change_date DESC) RNK
    FROM Products P2
    WHERE P2.change_date <= '2019-08-16'
   )

SELECT P.product_id
    , PP.new_price AS price
FROM Products P
    INNER JOIN Match_Data PP ON PP.RNK=1 AND PP.product_id=P.product_id AND PP.change_date=P.change_date
    
UNION

SELECT P.product_id
    , 10 AS price
FROM Products P
GROUP BY P.product_id
HAVING MIN(P.change_date) > '2019-08-16'