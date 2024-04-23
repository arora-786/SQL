SELECT w2.id
FROM weather w1
LEFT JOIN (SELECT * FROM weather) w2
  ON date_add(w1.recordDate, INTERVAL 1 DAY) = w2.recordDate
WHERE w1.temperature < w2.temperature
