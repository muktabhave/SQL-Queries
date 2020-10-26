/* 1412. Find the Quiet Students in All Exams
https://leetcode.com/problems/find-the-quiet-students-in-all-exams/
*/

with max_min as
(select exam_id, max(score) as max_score, min(score) as min_score
from exam group by exam_id),

cnt as 
(select student_id, count(exam_id) as cnt_exams 
from exam group by student_id)

select m2.student_id, s.student_name from
(select e.student_id, e.exam_id 
from exam e join max_min m
on (e.exam_id= m.exam_id )
where e.score!= max_score and e.score!= min_score) m2
join student s
on (s.student_id= m2.student_id)
group by m2.student_id, s.student_name
having count(exam_id)= 
(select cnt_exams from cnt c
where c.student_id= m2.student_id)
order by m2.student_id
