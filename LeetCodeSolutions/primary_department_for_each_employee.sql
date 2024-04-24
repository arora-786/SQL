WITH
  ONE_DEPT AS (
    SELECT employee_id FROM Employee 
    GROUP BY 1
    HAVING COUNT(employee_id) = 1
  )

SELECT
  employee_id,
  department_id
FROM Employee
WHERE primary_flag = 'Y'
UNION DISTINCT
SELECT
  employee_id,
  department_id
FROM Employee
WHERE employee_id IN (SELECT * FROM ONE_DEPT)
