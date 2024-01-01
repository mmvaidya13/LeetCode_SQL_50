/* Write your T-SQL query statement below */
SELECT CI.id 
, CI.movie      
, CI.description 
, CI.rating
FROM Cinema CI
WHERE (CI.id % 2)<>0
    AND CI.description NOT LIKE '%boring%'
ORDER BY CI.rating  DESC
