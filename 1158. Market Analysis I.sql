/* Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.*/

select
user_id as buyer_id,
to_char(join_date, 'YYYY-MM-DD') as join_date,
count( case when to_char(o.order_date, 'YYYY')= '2019' then order_id end) as orders_in_2019
from users u left outer join orders o
on (u.user_id= o.buyer_id)
group by 
user_id,
join_date
order by user_id
