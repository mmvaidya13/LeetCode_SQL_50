/* Write your T-SQL query statement below */
WITH Machine_ts  AS (
SELECT AC.machine_id 
,AC.process_id 
,(SELECT COUNT(process_id) FROM Activity PC WHERE PC.machine_id =AC.machine_id ) AS P_C
FROM Activity AC), PS_TS AS(
    SELECT MTS.machine_id
        ,MTS.process_id
        ,MTS.P_C AS process_Count
        ,((
            SELECT PC.timestamp 
            FROM Activity PC
            WHERE MTS.machine_id =PC.machine_id
                AND MTS.process_id=PC.process_id 
            AND activity_type LIKE 'end') -
            (
            SELECT PC.timestamp 
            FROM Activity PC
            WHERE MTS.machine_id =PC.machine_id
                AND MTS.process_id=PC.process_id 
            AND activity_type LIKE 'start')) AS process_time
    FROM  Machine_ts MTS
)

SELECT MTS.machine_id
,ROUND(SUM(MTS.process_time)/MTS.process_Count,3) AS processing_time 
FROM PS_TS MTS
GROUP BY  MTS.machine_id,MTS.process_Count