/* Write your T-SQL query statement below */
WITH
    Usr_Req
    AS
    
    (
        SELECT SU.user_id 
        , convert(decimal(11, 2),COUNT(CN.user_id)) AS rq_Count
        , convert(decimal(11, 2),COUNT(CASE 
                    WHEN CN.action LIKE 'timeout' 
                        THEN 1 
                END)) AS to_Count
        , convert(decimal(11, 2),COUNT(CASE 
                    WHEN CN.action LIKE 'confirmed' 
                        THEN 1 
                END)) AS cn_Count
        FROM Signups SU
            LEFT JOIN Confirmations CN ON SU.user_id =CN.user_id
        GROUP BY SU.user_id
    )
SELECT UR.user_id 
    , ROUND((CASE 
        WHEN ISNULL(UR.to_Count,0) = 0 AND ISNULL(UR.cn_Count,0) = 0
            THEN 0
        WHEN ISNULL(UR.to_Count,0) > 0 AND ISNULL(UR.cn_Count,0) = 0
            THEN  0  
         WHEN ISNULL(UR.to_Count,0) = 0 AND ISNULL(UR.cn_Count,0) > 0
            THEN  1
        ELSE  
            
                         ISNULL(UR.cn_Count,0) /
                         ISNULL(UR.rq_Count,0)
        END      
    ),2) AS confirmation_rate
FROM Usr_Req UR