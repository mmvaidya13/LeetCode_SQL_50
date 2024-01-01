SELECT PD.product_name  
, SL.year 
, SL.price
FROM Sales SL
    INNER JOIN Product PD ON PD.product_id   =SL.product_id  