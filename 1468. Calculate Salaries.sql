/* Write an SQL query to find the salaries of the employees after applying taxes.

The tax rate is calculated for each company based on the following criteria:

0% If the max salary of any employee in the company is less than 1000$.
24% If the max salary of any employee in the company is in the range [1000, 10000] inclusive.
49% If the max salary of any employee in the company is greater than 10000$.
Return the result table in any order. Round the salary to the nearest integer.

 */


select a.company_id, employee_id , employee_name , round(a.salary-(a.salary*tax_per)) as salary
from salaries a join
(select company_id,
case when max(salary)<1000 then 0
     when max(salary) between 1000 and 10000 then 0.24
     else 0.49 end as tax_per
from salaries
group by company_id) b
on (a.company_id=b.company_id)
order by a.company_id, employee_id
