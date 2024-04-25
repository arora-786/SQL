SELECT
  DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
      num,
      LEAD(num, 1) OVER(ORDER BY id) num1,
      LEAD(num, 2) OVER(ORDER BY id) num2
    FROM logs) A
WHERE num = num1 
  AND num = num2
