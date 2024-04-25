WITH
  T1 AS (
    SELECT
      product_id,
      new_price,
      LAG(change_date) OVER(
        PARTITION BY product_id 
        ORDER BY change_date
        ) AS old_change_date,
      change_date
    FROM Products
  ),
  T2 AS (
    SELECT
      product_id,
      IF(old_change_date IS NULL AND change_date > '2019-08-16', 10, new_price) AS new_price,
      IF(old_change_date IS NULL AND change_date > '2019-08-16', '2019-08-16', change_date) AS change_date
    FROM T1
  ),
  T3 AS (
    SELECT
        product_id,
        new_price AS price,
        change_date,
        MAX(change_date) OVER(
            PARTITION BY product_id
            ) AS latest_change_date
    FROM T2
    WHERE change_date <= '2019-08-16'
  )

SELECT product_id, price 
FROM T3 
WHERE change_date = latest_change_date
