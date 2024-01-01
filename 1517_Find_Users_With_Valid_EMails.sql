
SELECT U.user_id 
    , U.name      
    , U.mail
FROM Users U
WHERE  SUBSTRING(U.mail,PATINDEX('%@%',U.mail),LEN(U.mail)) LIKE '@leetcode.com'
    AND SUBSTRING(U.mail,0,PATINDEX('%@%',U.mail)) LIKE '[A-Za-z]%'
    AND SUBSTRING(U.mail,0,PATINDEX('%@%',U.mail)) NOT LIKE '%[^A-Za-z0-9._-]%'   