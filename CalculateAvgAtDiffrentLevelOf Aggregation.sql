/* 615. Average Salary: Departments VS Company
https://leetcode.com/problems/average-salary-departments-vs-company/
*/

with tot as
(select to_char(pay_date, 'YYYY-MM') as pay_month,
avg(amount) as mon_avg
from salary
group by to_char(pay_date, 'YYYY-MM')),

dept as 

(select to_char(pay_date, 'YYYY-MM') as pay_month,
department_id,
avg(amount) as avg_per_dept
from salary s join employee e
on (s.employee_id= e.employee_id)
group by 
to_char(pay_date, 'YYYY-MM'),
department_id)

select dept.pay_month as PAY_MONTH,
dept.department_id as DEPARTMENT_ID,
case when avg_per_dept< mon_avg then 'lower'
when avg_per_dept= mon_avg then 'same'
else 'higher' end as COMPARISON
from
tot join dept
on (tot.pay_month= dept.pay_month)
order by to_date(dept.pay_month, 'YYYY-MM') desc, dept.department_id
