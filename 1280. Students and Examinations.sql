/* Write an SQL query to find the number of times each student attended each exam.

Order the result table by student_id and subject_name. */


select s.student_id, s.student_name, sb.subject_name,
nvl(count(e.subject_name),0) as attended_exams
from students s cross join subjects sb
left outer join Examinations e
on (e.student_id= s.student_id and e.subject_name= sb.subject_name)
group by s.student_id, s.student_name, sb.subject_name
order by  s.student_id, sb.subject_name
