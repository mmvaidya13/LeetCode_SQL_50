WITH
    VI
    AS
    
    (
        SELECT VIS.visit_id 
        , VIS.customer_id
        FROM Visits VIS
            LEFT JOIN Transactions TR ON VIS.visit_id =TR.visit_id
        WHERE TR.visit_id IS NULL
    )

SELECT VI.customer_id
, COUNT(VI.visit_id) AS count_no_trans
FROM VI
GROUP BY VI.customer_id