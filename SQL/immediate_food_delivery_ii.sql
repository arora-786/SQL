SELECT 
  ROUND((
    COUNT(IF(order_date = customer_pref_delivery_date, 1, NULL)) / 
    COUNT(1)) * 100, 2) AS immediate_percentage
FROM delivery
WHERE delivery_id IN (
  SELECT delivery_id 
  FROM (
    SELECT
      delivery_id,
      RANK() over(PARTITION BY customer_id ORDER BY order_date) AS r
    FROM delivery
    GROUP BY 1) AS B
  WHERE r = 1)
