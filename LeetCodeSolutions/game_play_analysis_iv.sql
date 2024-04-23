WITH
  FIRST_DAY AS (
    SELECT
      player_id,
      MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY 1
  ),
  CONSECUTIVE_LOGIN AS (
    SELECT
      COUNT(player_id) AS logins
    FROM Activity
    LEFT JOIN FIRST_DAY
      USING(player_id)
    WHERE DATEDIFF(event_date, first_login_date) = 1
  )

SELECT 
  ROUND(
    logins / COUNT(DISTINCT player_id), 
    2) AS fraction 
FROM Activity, CONSECUTIVE_LOGIN
