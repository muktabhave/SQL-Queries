/* Write your PL/SQL query statement below */

select
to_char(o.order_date, 'DAY') as day,
i.item_category,
sum(o.quantity) as sum_item
from orders o join items i
on (o.item_id= c.item_id)
group by 
to_char(o.order_date, 'DAY'),
i.item_category
