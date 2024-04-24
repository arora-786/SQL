SELECT 
  product_id, 
  year AS first_year, 
  quantity, 
  price
FROM (
    SELECT
      product_id, 
      year, 
      quantity, 
      price,
      RANK() OVER(PARTITION BY product_id ORDER BY year) AS r
    FROM Sales
) AS SubQuery
WHERE r = 1
