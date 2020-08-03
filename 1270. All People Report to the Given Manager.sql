/*
employee_id is the primary key for this table.
Each row of this table indicates that the employee with ID employee_id and name employee_name reports his work to his/her direct manager with manager_id
The head of the company is the employee with employee_id = 1.

Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

The indirect relation between managers will not exceed 3 managers as the company is small.

Return result table in any order without duplicates.

*/

select 
e3.employee_id from
--e3.*, e4.manager_id as mgr_2 from
(select e1.employee_id, e1.manager_id, e2.manager_id as mgr_1 
from employees e1
left outer join employees e2
on (e1.manager_id=e2.employee_id) ) e3
join employees e4
on (e3.mgr_1)= e4.employee_id
where e4.manager_id= 1
and e3.employee_id<>1
