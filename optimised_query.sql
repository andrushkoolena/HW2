DROP INDEX idx_200507_force ON accidents2005and2007;
DROP INDEX idx_0507_force ON accidents2005and2007;
DROP INDEX idx_0911_force ON accidents2009and2011;
DROP INDEX idx_1214_force ON accidents2012and2014;

CREATE INDEX idx_0507_force ON accidents2005and2007 (Police_Force);
CREATE INDEX idx_0911_force ON accidents2009and2011 (Police_Force);
CREATE INDEX idx_1214_force ON accidents2012and2014 (Police_Force);

EXPLAIN ANALYZE
WITH joined_accidents AS (
    SELECT 
        a05.Accident_Index AS id_0507,
        a09.Accident_Index AS id_0911,
        a12.Accident_Index AS id_1214,
        a05.Police_Force,
        a05.Accident_Severity,
        a05.Number_of_Vehicles,
        a05.Number_of_Casualties,
        a05.Date
    FROM accidents2005and2007 a05 FORCE INDEX (idx_0507_force)
    LEFT JOIN accidents2009and2011 a09 
        ON a05.Police_Force = a09.Police_Force
    LEFT JOIN accidents2012and2014 a12 
        ON a05.Police_Force = a12.Police_Force
    WHERE 
        (
            a05.Number_of_Vehicles <= 3
            OR a09.Accident_Severity = 2
            OR a12.Number_of_Casualties >= 1
        )
        AND STR_TO_DATE(a05.Date, '%d/%m/%Y') BETWEEN '2005-01-01' AND '2013-12-31'
        AND a05.Accident_Severity IN (2, 3)
)
SELECT *
FROM joined_accidents
ORDER BY Number_of_Casualties DESC
LIMIT 100;

EXPLAIN SELECT *
FROM accidents2005and2007 FORCE INDEX (idx_0507_force)
WHERE Police_Force IS NOT NULL;

# I added indexes on Police_Force so the joins wouldn’t be so heavy and used FORCE INDEX so 
# MySQL would actually use them. I also moved the main query into a CTE to make it cleaner 
# and easier for MySQL to process.

