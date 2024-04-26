WITH 
  T1 AS (
    SELECT
      visited_on,
      SUM(amount) AS amount
    FROM Customer
    GROUP BY 1
  )

SELECT * 
FROM (
  SELECT
    visited_on,
    SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
    ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
  FROM T1
) A
WHERE visited_on >= DATE_ADD((SELECT MIN(visited_on) FROM Customer), INTERVAL 6 DAY)
ORDER BY visited_on
