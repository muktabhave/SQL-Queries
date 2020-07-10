/* Write an SQL query that reports the most experienced employees in each project. In case of a tie, report all employees with the maximum number of experience years. */

select project_id, employee_id from
(select project_id, e.employee_id,
dense_rank() over (partition by project_id order by experience_years desc) as dr
from employee e join project p
on (e.employee_id=p.employee_id) )
where dr=1
