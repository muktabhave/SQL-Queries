/* Write your PL/SQL query statement below */

select 
user_id,
favorite_brand,

select seller_id,item_id,
row_number() over (partition by seller_id order by order_date) as rn
from orders 

from users u join orders o
on (u.user_id= o.seller_id)




join items i
on (i.item_id= o.item_id)
