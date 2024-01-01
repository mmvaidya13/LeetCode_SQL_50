/* Write your T-SQL query statement below */

SELECT ST.student_id
    ,ST.student_name
    ,SU.subject_name 
    ,ISNULL(
        (SELECT COUNT(student_id)
        FROM Examinations E
        WHERE E.student_id =ST.student_id 
            AND E.subject_name  =SU.subject_name)
    ,0)   AS attended_exams 
FROM Students ST
CROSS JOIN Subjects SU 
ORDER BY  ST.student_id
,SU.subject_name 