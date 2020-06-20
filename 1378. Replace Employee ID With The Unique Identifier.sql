/* Write an SQL query to show the unique ID of each user, If a user doesn't have a unique ID replace just show null. */

select unique_id, name 
from employees e left outer join employeeuni u
on (e.id=u.id)
