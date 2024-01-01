/* Write your T-SQL query statement below */

WITH A AS
	(
					SELECT RQ.requester_id AS id
		, (
			SELECT COUNT(RA.accepter_id)
				FROM RequestAccepted RA
				WHERE RQ.requester_id = RA.accepter_id
			) + (
			SELECT COUNT(RA.requester_id)
				FROM RequestAccepted RA
				WHERE RQ.requester_id = RA.requester_id
			) AS num
			FROM RequestAccepted RQ
			GROUP BY RQ.requester_id
		UNION
			SELECT RQ.accepter_id AS id
		, (
			SELECT COUNT(RA.accepter_id)
				FROM RequestAccepted RA
				WHERE RQ.accepter_id = RA.accepter_id
			) + (
			SELECT COUNT(RA.requester_id)
				FROM RequestAccepted RA
				WHERE RQ.accepter_id = RA.requester_id
			) AS num
			FROM RequestAccepted RQ
			GROUP BY RQ.accepter_id

	)

SELECT TOP 1
	Id
	, num
FROM A
ORDER BY num DESC
