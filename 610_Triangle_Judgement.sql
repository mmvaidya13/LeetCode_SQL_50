SELECT T.x
, T.y
, T.z
, CASE 
  WHEN (T.x + T.y > T.z)
    AND (T.x + T.z > T.y)
    AND (T.z + T.y > T.x)
  THEN 'Yes'
  ELSE 'No'
  END triangle
FROM Triangle T