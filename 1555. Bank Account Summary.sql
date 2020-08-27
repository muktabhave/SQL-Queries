/* Write an SQL query to report.

user_id
user_name
credit, current balance after performing transactions.  
credit_limit_breached, check credit_limit ("Yes" or "No") */

select
user_id, 
user_name, 
(credit-debt+crdt) as credit,
case when (credit-debt+crdt)<0 then 'Yes' else 'No' end as credit_limit_breached
from
(
select
user_id, 
user_name, 
credit,
sum(nvl(case when u.user_id= t.paid_by then amount end ,0)) as debt,
sum(nvl(case when u.user_id= t.paid_to then amount end,0)) as crdt
from users u 
left outer join transaction t 
on ((u.user_id= t.paid_by) or (u.user_id= t.paid_to))
group by user_id, user_name, credit)


