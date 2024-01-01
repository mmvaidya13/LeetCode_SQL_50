	SELECT 'Low Salary' AS category
	, ISNULL((
			SELECT COUNT(AC.account_id)
		FROM Accounts AC
		WHERE AC.income < 20000
			), 0) AS accounts_count

UNION

	SELECT 'Average Salary' AS category
	, ISNULL((
			SELECT COUNT(AC.account_id) AS accounts_count
		FROM Accounts AC
		WHERE AC.income >= 20000
			AND AC.income <= 50000
			), 0) AS accounts_count

UNION

	SELECT 'High Salary' AS category
	, ISNULL((
			SELECT COUNT(AC.account_id) AS accounts_count
		FROM Accounts AC
		WHERE AC.income > 50000
			), 0) AS accounts_count

