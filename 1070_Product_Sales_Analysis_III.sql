select product_id, year first_year, quantity, price
from (
    select *, 
        rank() over (partition by product_id order by year) rk 
    from Sales
) t
where rk = 1