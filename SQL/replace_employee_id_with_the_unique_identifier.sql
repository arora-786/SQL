SELECT
  unique_id,
  name
FROM Employees AS t1
LEFT JOIN EmployeeUNI AS t2
  ON t1.id = t2.id
