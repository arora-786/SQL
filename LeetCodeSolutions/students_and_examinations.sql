WITH 
  RAW_DATA AS (
    SELECT
      student_id,
      student_name,
      subject_name
    FROM Students, Subjects
  ),
  EXAM_STATS AS (
    SELECT
      student_id,
      subject_name,
      COUNT(
        CONCAT(
            CAST(student_id AS CHAR), 
            subject_name)) AS attended_exams
    FROM Examinations
    GROUP BY 1, 2
  )

SELECT 
  RAW_DATA.student_id,
  student_name,
  RAW_DATA.subject_name,
  IFNULL(attended_exams, 0) AS attended_exams
FROM RAW_DATA
LEFT JOIN  EXAM_STATS
  ON RAW_DATA.student_id = EXAM_STATS.student_id
  AND RAW_DATA.subject_name = EXAM_STATS.subject_name
ORDER BY student_id, subject_name
