DELETE FROM person WHERE id NOT IN (
    SELECT id FROM (
        SELECT
            MIN(id) AS id,
            email
        FROM person
        GROUP BY 2) A 
    )
