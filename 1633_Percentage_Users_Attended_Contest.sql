/* Write your T-SQL query statement below */
UPDATE STATISTICS Users;
UPDATE STATISTICS Register;
DECLARE @UC FLOAT = (
		SELECT COUNT(USR.user_id)
FROM Users USR
		);

WITH
	Register_UC
	AS
	(
		SELECT REG.contest_id
		, (COUNT(REG.user_id)) AS R_UC
		FROM Register REG
		GROUP BY REG.contest_id
	)
	,
	CR
	AS
	(
		SELECT REG.contest_id
		, ((REG.R_UC / @UC)* 100) AS per
		FROM Register_UC REG
	)
SELECT contest_id
	, ROUND(per, 2)  AS percentage
FROM CR
ORDER BY percentage DESC
	,contest_id
