SELECT assignments.day AS day, COUNT(assignments.id) AS total_assignments
FROM assignments
GROUP BY assignments.day
HAVING COUNT(assignments.id) >= 10
ORDER BY assignments.day;