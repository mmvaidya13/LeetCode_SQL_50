/* Write your T-SQL query statement below */
SELECT FORMAT(TR.trans_date, 'yyyy-MM') AS month
	,TR.country
	,COUNT(TR.id) AS trans_count
	,COUNT(CASE 
			WHEN TR.STATE LIKE 'approved'
				THEN 1
			END) AS approved_count
	,SUM(amount) AS trans_total_amount
	,ISNULL(SUM(CASE 
			WHEN TR.STATE LIKE 'approved'
				THEN amount
			END),0) AS approved_total_amount
FROM Transactions TR
GROUP BY FORMAT(TR.trans_date, 'yyyy-MM')
	,TR.country
