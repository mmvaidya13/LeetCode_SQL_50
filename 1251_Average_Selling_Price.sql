/* Write your T-SQL query statement below */
    SELECT P.product_id 
    ,ROUND(ISNULL((
        
            (SELECT convert(decimal(11, 2),SUM(US.units * PR.price))
            FROM Prices PR
            INNER JOIN UnitsSold US ON PR.product_id = US.product_id
            WHERE  P.product_id = PR.product_id
            AND US.purchase_date BETWEEN PR.start_date  AND PR.end_date) /
        (
            SELECT convert(decimal(11, 2),SUM(US.units))
            FROM UnitsSold US
            WHERE  P.product_id = US.product_id) ),0)
      ,2) AS average_price 
    FROM Prices P
    GROUP BY P.product_id 