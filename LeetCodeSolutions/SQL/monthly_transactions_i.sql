SELECT 
  month, 
  country, 
  COUNT(id) AS trans_count,
  COUNT(IF(STATE = "approved", id, NULL)) AS approved_count,
  SUM(amount) AS trans_total_amount,
  SUM(IF(state = "approved", amount, 0)) AS approved_total_amount
FROM (
  SELECT 
    id, 
    country, 
    state, 
    amount, 
    SUBSTR(DATE_FORMAT(trans_date, '%Y-%m-%d'), 1, 7) AS month
  FROM transactions) AS A
GROUP BY 1, 2
