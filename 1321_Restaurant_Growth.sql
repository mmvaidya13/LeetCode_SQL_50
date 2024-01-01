WITH
	WEEK_CAL
	AS
	(
		SELECT CAST(C.visited_on AS DATE) AS visited_on
		, SUM(amount) SA
		FROM Customer C
		GROUP BY C.visited_on
	)

SELECT WC.visited_on
	, SUM(W.SA) AS amount
	, ROUND(CAST(SUM(W.SA) AS FLOAT) / 7, 2) AS average_amount
FROM WEEK_CAL W
	, WEEK_CAL WC
WHERE DATEDIFF(DAY, W.visited_on, WC.visited_on) BETWEEN 0
		AND 6
GROUP BY WC.visited_on
HAVING WC.visited_on >= DATEADD(DAY, 6, (
			SELECT MIN(visited_on)
FROM Customer
			))
ORDER BY WC.visited_on
