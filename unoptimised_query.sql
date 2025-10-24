EXPLAIN
SELECT 
    a05.Accident_Index AS id_0507,
    a09.Accident_Index AS id_0911,
    a12.Accident_Index AS id_1214,
    a05.Police_Force,
    a05.Accident_Severity,
    a05.Number_of_Vehicles,
    a05.Number_of_Casualties,
    a05.Date
FROM (
    /*+ SUBQUERY(MATERIALIZATION) */
    SELECT * FROM accidents2005and2007
) AS a05
LEFT JOIN (
    SELECT * FROM accidents2009and2011
) AS a09
    ON a05.Police_Force = a09.Police_Force
LEFT JOIN (
    SELECT * FROM accidents2012and2014
) AS a12
    ON a05.Police_Force = a12.Police_Force
WHERE 
    (
        a05.Number_of_Vehicles <= 3
        OR a09.Accident_Severity = 2
        OR a12.Number_of_Casualties >= 1
    )
    AND STR_TO_DATE(a05.Date, '%d/%m/%Y') BETWEEN '2005-01-01' AND '2013-12-31'
    AND a05.Accident_Severity IN (2, 3)
ORDER BY a05.Number_of_Casualties DESC;

# So basically, I just joined three accident tables from 2005 to 2014 using LEFT JOIN on the police force.
# I filtered the accidents with up to three vehicles, or where the severity was 2, or at least one person was injured.
# Then I limited it by date and sorted it by the number of casualties.
# I also added the /*+ SUBQUERY(MATERIALIZATION) */ hint so MySQL would save the subquery results temporarily instead of 
# recalculating them each time.
