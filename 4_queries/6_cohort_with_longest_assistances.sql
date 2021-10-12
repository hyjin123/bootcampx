SELECT x.name AS name,
AVG(completed_at - started_at) AS average_assistance_time
FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts AS x ON x.id = students.cohort_id
GROUP BY x.name
HAVING AVG(completed_at - started_at) > ALL (
  SELECT AVG(completed_at - started_at) AS average_assistance_time
  FROM assistance_requests
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE x.name != cohorts.name
  GROUP BY cohorts.name
);

--  POSSIBLE ANSWER FROM COMPASS
-- SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
-- FROM assistance_requests 
-- JOIN students ON students.id = assistance_requests.student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts.name
-- ORDER BY average_assistance_time DESC
-- LIMIT 1;