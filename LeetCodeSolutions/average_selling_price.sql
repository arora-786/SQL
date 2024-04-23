WITH
  UNITS_SOLD AS (
    SELECT
      product_id,
      purchase_date,
      SUM(units) AS units
    FROM UnitsSold
    GROUP BY 1, 2
  )

SELECT
  product_id,
  ROUND(
    SUM(price * IFNULL(units, 0)) / SUM(IFNULL(units, 1)), 
    2) AS average_price
FROM Prices
LEFT JOIN UNITS_SOLD
  USING(product_id)
WHERE (purchase_date >= start_date
  AND purchase_date <= end_date)
  OR purchase_date IS NULL 
GROUP BY 1
