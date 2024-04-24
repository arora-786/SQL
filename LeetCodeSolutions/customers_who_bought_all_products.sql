WITH
  TOTAL_PRODUCTS AS (
    SELECT COUNT(product_key) AS c FROM Product
  )

SELECT customer_id
FROM (
    SELECT
    customer_id,
    c,
    COUNT(customer_id) AS cust_count
    FROM (
        SELECT
        product_key,
        customer_id,
        c
        FROM Customer, TOTAL_PRODUCTS
        GROUP BY 1, 2
    ) AS A
GROUP BY 1, 2
) AS B
WHERE c = cust_count
