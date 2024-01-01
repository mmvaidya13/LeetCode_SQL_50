/* Write your T-SQL query statement below */
SELECT T.teacher_id 
,COUNT(DISTINCT subject_id ) AS cnt
FROM  Teacher  T
GROUP BY T.teacher_id 