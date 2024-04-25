WITH
  T1 AS (
    SELECT
      user_id,
      name,
      COUNT(movie_id) AS movie_count
    FROM MovieRating
    LEFT JOIN Users
      USING(user_id)
    GROUP BY 1, 2
    ORDER BY 3 DESC, 2
    LIMIT 1
  ),
  T2 AS (
    SELECT
      movie_id,
      title,
      AVG(rating) AS avg_rating
    FROM MovieRating
    LEFT JOIN Movies
      USING(movie_id)
    WHERE MONTH(created_at) = 2 
      AND YEAR(created_at) = 2020
    GROUP BY 1, 2
    ORDER BY 3 DESC, 2
    LIMIT 1
  )

SELECT name AS results FROM T1
UNION ALL
SELECT title FROM T2
