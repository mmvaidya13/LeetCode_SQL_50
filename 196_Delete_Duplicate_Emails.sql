
DELETE a
FROM Person A
    INNER JOIN Person B ON A.email = B.email AND A.ID>B.ID