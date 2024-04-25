WITH
  T1 AS (
    SELECT
      employee_id,
      name, 
      manager_id,
      salary
    FROM Employees
    WHERE salary < 30000
  ),
  T2 AS (
    SELECT DISTINCT manager_id
    FROM T1
    WHERE manager_id NOT IN (SELECT employee_id FROM Employees)
  )

SELECT employee_id FROM T1 
WHERE manager_id IN (SELECT manager_id FROM T2)
ORDER BY 1
