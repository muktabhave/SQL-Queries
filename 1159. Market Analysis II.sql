/* Write your PL/SQL query statement below */

select 
p.seller_id,
case when favorite_brand= p.favbrand then yes else no as 2nd_item_fav_brand
from 
(select seller_id, i.item_brand as favbrand from
(select seller_id,item_id,
row_number() over (partition by seller_id order by order_date) as rn
from orders ) o
join items i
on (i.item_id= o.item_id)
where o.rn=2) p
join users u
on (u.user_id- p.seller_id)
