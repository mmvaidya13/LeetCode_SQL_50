SELECT C.id
FROM Weather AS P
    INNER JOIN Weather AS C ON DATEADD(DAY, 1, P.recordDate) = C.recordDate
        AND C.Temperature > P.Temperature