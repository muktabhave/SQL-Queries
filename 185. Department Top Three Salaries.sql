185. Department Top Three Salaries

https://leetcode.com/problems/department-top-three-salaries/

o/p code:

select Department, Employees, Salary from
(select d.Name  as Department, e.Name as Employee, Salary,
 ROW_NUMBER() OVER(PARTITION BY d.Name ORDER BY Salary DESC) as rn
from Department d join Employee e
on (e.DepartmentId= d.Id))
where rn <= 3
 
