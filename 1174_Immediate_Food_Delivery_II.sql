/* Write your T-SQL query statement below */
	;WITH IMD_ODER
AS (
	SELECT DL.delivery_id
		,DL.customer_id
		,DL.order_date
		,DL.customer_pref_delivery_date
		,RANK() OVER (
			PARTITION BY DL.customer_id ORDER BY DL.order_date
			) RNK
	FROM Delivery DL
	)
	,IMD
AS (
	SELECT (
			convert(DECIMAL(11, 2), COUNT(CASE 
						WHEN order_date = customer_pref_delivery_date
							THEN 1
						END))/
            (
				SELECT convert(DECIMAL(11, 2), COUNT(customer_id))
				FROM IMD_ODER
				WHERE RNK = 1
				) 
			) * 100 AS IMD_C
	FROM IMD_ODER
	WHERE RNK = 1
	)
SELECT ROUND(IMD_C, 2) AS immediate_percentage
FROM IMD