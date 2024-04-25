SELECT 
  department, 
  employee, 
  salary 
FROM (
  SELECT 
    *, 
    dense_rank() OVER(PARTITION BY department ORDER BY salary DESC) AS r 
  FROM (
    SELECT 
      d.name AS department, 
      e.name AS employee, 
      salary 
    FROM employee e
    LEFT JOIN department d
      ON e.departmentId = d.id) a
  ) b
WHERE r <= 3
