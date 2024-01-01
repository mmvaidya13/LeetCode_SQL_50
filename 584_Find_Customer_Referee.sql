SELECT CO.name
FROM Customer CO
WHERE ISNULL(CO.referee_id,0)  <> 2