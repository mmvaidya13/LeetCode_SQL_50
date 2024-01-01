
SELECT P.patient_id 
, P.patient_name 
, P.conditions
FROM Patients P
WHERE ISNULL(conditions,'') LIKE '% DIAB1%'
    OR ISNULL(conditions,'') LIKE 'DIAB1%'