WITH 
  RAW_DATA AS (
    SELECT
      E.employee_id,
      M.name AS manager_name,
      E.reports_to AS manager_id,
      E.age AS employee_age
    FROM Employees AS E
    LEFT JOIN Employees AS M
      ON E.reports_to = M.employee_id
  )

SELECT
  manager_id AS employee_id,
  manager_name AS name,
  COUNT(employee_id) AS reports_count,
  ROUND(AVG(employee_age)) AS average_age
FROM RAW_DATA
WHERE manager_id IS NOT NULL
GROUP BY 1, 2
ORDER BY 1
