SELECT person_name 
FROM queue 
WHERE turn = (
    SELECT MAX(turn) 
    FROM (
      SELECT person_name, turn 
      FROM (
        SELECT *, sum(weight) OVER(ORDER BY turn) AS total_wt 
        FROM queue) A
      WHERE total_wt <= 1000) B
    )
