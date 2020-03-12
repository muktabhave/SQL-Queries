/* Write your PL/SQL query statement below */

select user_id, join_date, 
count(order_id)
from users u join orders o
on (u.user_id = o.buyer_id)
where to_char(o.order_date, 'YYYY')='2019'
group by user_id, join_date
