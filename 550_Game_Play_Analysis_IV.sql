/* Write your T-SQL query statement below */
WITH Logged_In_MTO
AS (
	SELECT DL.player_id
		,MIN(DL.event_date) First_Login
	FROM Activity DL
    GROUP BY DL.player_id
	), Con_Login AS(
        SELECT convert(DECIMAL(11, 2),COUNT (AC.player_id)) Con_Count
        FROM Logged_In_MTO FLI
        INNER JOIN Activity AC ON FLI.player_id=AC.player_id
             AND DATEADD(DAY,1,FLI.first_login) =  AC.event_date
    )


SELECT ROUND(
        (SELECT convert(DECIMAL(11, 2),Con_Count)
        FROM Con_Login)/
        (SELECT convert(DECIMAL(11, 2),COUNT(player_id))
        FROM Logged_In_MTO)
    
    ,2) AS fraction

