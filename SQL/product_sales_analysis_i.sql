SELECT
  product_name,
  year,
  price
FROM sales s
LEFT JOIN product p
  ON s.product_id = p.product_id
