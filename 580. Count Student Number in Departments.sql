/* 580. Count Student Number in Departments */

select d.dept_name as dept_name, count(student_id) as student_number
from student s right outer join department d
on (s.dept_id= d.dept_id)
group by d.dept_name 
order by count(student_id) desc, d.dept_name asc}
