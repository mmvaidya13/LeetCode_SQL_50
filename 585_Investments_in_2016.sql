
SELECT ROUND(SUM(DISTINCT CAST( I.tiv_2016  AS FLOAT)),2) AS tiv_2016
FROM Insurance I
WHERE   EXISTS (
    SELECT 1
    FROM Insurance LI
    WHERE LI.pid<>  I.pid AND I.tiv_2015 =LI.tiv_2015
)
    AND NOT EXISTS (
    SELECT 1
    FROM Insurance LI
    WHERE LI.pid<>  I.pid AND (I.lat = LI.lat AND I.lon = LI.lon)
)