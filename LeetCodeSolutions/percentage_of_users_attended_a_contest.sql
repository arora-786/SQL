WITH
  USER_COUNT AS (
    SELECT COUNT(user_id) users FROM Users
  )
SELECT
  contest_id,
  ROUND(COUNT(contest_id) * 100 / users, 2) AS percentage 
FROM Register, USER_COUNT
GROUP BY 1
ORDER BY 2 DESC, 1
