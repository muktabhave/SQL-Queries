/* Each row of this table contains the ID of each employee and their respective team.
Write an SQL query to find the team size of each of the employees.*/

select employee_id,
count(employee_id) over (partition by team_id) as team_size
from employee

-- select a.employee_id, b.team_size 
-- from employee a join 
-- (select team_id, count(employee_id) as team_size
-- from employee
-- group by team_id) b
-- on a. team_id= b.team_id
