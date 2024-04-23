SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId 
    FROM (
      SELECT 
        managerId,
        COUNT(id) AS id
      FROM employee
      GROUP BY 1
      HAVING COUNT(id) >= 5
    ) AS m
)
