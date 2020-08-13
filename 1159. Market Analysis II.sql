/* Write your PL/SQL query statement below */

select 
u.user_id as seller_id,
case when u.favorite_brand= p.favbrand then 'yes' else 'no' end as "2nd_item_fav_brand"
from 
(select seller_id, i.item_brand as favbrand from
(select seller_id,item_id,
dense_rank() over (partition by seller_id order by order_date) as rn
from orders ) o
join items i
on (i.item_id= o.item_id)
where o.rn=2) p
right outer join users u
on (u.user_id= p.seller_id)
order by 1
