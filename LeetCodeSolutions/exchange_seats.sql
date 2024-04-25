SELECT
  CASE
    WHEN id % 2 = 0 THEN id - 1
    WHEN id % 2 != 0 AND (SELECT COUNT(1) FROM Seat) = id THEN id
    ELSE id + 1
    END AS id,
  student
FROM Seat
ORDER BY 1
