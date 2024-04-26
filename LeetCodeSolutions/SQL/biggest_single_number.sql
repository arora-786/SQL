SELECT MAX(num) AS num
FROM (
    SELECT num 
    FROM MyNumbers 
    GROUP BY 1 
    HAVING COUNT(num) = 1
) AS A
