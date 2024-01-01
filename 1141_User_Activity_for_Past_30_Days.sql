/* Write your T-SQL query statement below */
SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users 
FROM 
    Activity
WHERE 
    DATEDIFF(DAY, activity_date, '2019-07-27') < 30
    and
    activity_date <= '2019-07-27'
GROUP BY 
    activity_date;