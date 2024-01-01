WITH
    dis_Prod
    AS
    
    (
        SELECT sell_date  
    , product
        FROM Activities
        GROUP BY sell_date  
    ,product
    )

SELECT sell_date
, COUNT(product) AS num_sold 
, STRING_AGG( product,',') AS products
FROM dis_Prod
GROUP BY sell_date