SELECT
  product_name,
  SUM(unit) AS unit
FROM Orders
LEFT JOIN Products
  USING(product_id)
WHERE YEAR(order_date) = 2020
  AND MONTH(order_date) = 2
GROUP BY 1
HAVING SUM(unit) >= 100
