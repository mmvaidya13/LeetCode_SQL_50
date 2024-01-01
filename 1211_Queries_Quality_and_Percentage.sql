/* Write your T-SQL query statement below */
SELECT QU.query_name
	,ROUND(AVG(CONVERT(DECIMAL(16, 2), QU.rating) / CONVERT(DECIMAL(16, 2), QU.position)), 2) AS quality
	,ROUND((
			(
				CONVERT(DECIMAL(16, 2), COUNT(CASE 
							WHEN QU.rating < 3
								THEN 1
							END)) / CONVERT(DECIMAL(16, 2), COUNT(QU.query_name))
				) * 100
			), 2) AS poor_query_percentage
FROM Queries QU
where QU.query_name is not null
GROUP BY QU.query_name
