SELECT
  requester_id AS id,
  SUM(c1) AS num
FROM (
  SELECT
    requester_id, 
    COUNT(requester_id) AS c1
  FROM RequestAccepted
  GROUP BY 1
  UNION ALL
  SELECT
    accepter_id,
    COUNT(accepter_id) AS c2
  FROM RequestAccepted
  GROUP BY 1
) A
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
