/* Write a SQL query to find the highest grade with its corresponding course for each student. In case of a tie, you should find the course with the smallest course_id. The output must be sorted by increasing student_id.*/

select student_id, course_id, grade from
(select student_id, course_id, grade,
row_number() over (partition by student_id order by grade desc,course_id) as rn
from enrollments)
where rn=1
