SELECT U.user_id 
, UPPER(SUBSTRING(U.name, 1, 1))+LOWER(SUBSTRING(U.name, 2, LEN(U.name))) AS name
FROM Users U
ORDER BY U.user_id 