DECLARE @Product_Count BIGINT = (SELECT COUNT(product_key)
FROM Product)

SELECT C.customer_id
FROM Customer C
GROUP BY  C.customer_id
HAVING COUNT(DISTINCT C.product_key) = @Product_Count;