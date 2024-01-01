SELECT WO.name        
, WO.population
, WO.area
FROM World WO
WHERE WO.population >= 25000000
    OR WO.area >= 3000000 