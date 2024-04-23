WITH 
  CONFIRMATION AS (
    SELECT
    user_id,
    SUM(IF(action = 'confirmed', 1, 0)) /  COUNT(action) AS confirmation_rate
    FROM Confirmations
    GROUP BY 1
  )

SELECT
  user_id,
  ROUND(IFNULL(confirmation_rate, 0), 3) AS confirmation_rate
FROM Signups
LEFT JOIN CONFIRMATION
  USING(user_id)
