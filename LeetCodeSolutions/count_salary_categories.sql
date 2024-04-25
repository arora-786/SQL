WITH
  CATEGORIES AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary' AS category
    UNION ALL
    SELECT 'High Salary' AS category
  )

SELECT
  category,
  IFNULL(accounts_count, 0) AS accounts_count
FROM  CATEGORIES
LEFT JOIN (
  SELECT
    CASE 
      WHEN income < 20000 THEN 'Low Salary'
      WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
      ELSE 'High Salary' 
      END AS category,
    COUNT(account_id) AS accounts_count
  FROM Accounts
  GROUP BY 1
  ) A
  USING(category)
