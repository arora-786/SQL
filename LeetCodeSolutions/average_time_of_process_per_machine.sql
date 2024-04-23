SELECT
  machine_id,
  ROUND(AVG(execution_time), 3) AS processing_time
FROM 
  (
    SELECT
      machine_id,
      process_id,
      SUM(
        IF(activity_type = 'start', -1, 1)
        * timestamp) AS execution_time
    FROM Activity
    GROUP BY 1, 2
  ) executionTime
GROUP BY 1
