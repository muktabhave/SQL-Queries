/* 1596. The Most Frequently Ordered Products for Each Customer */

Faster Solution:

-- 1) assign rank based for product on partition by customer_id count(order date)
-- 2) select custimer_id,product with rank=1
-- 3) join customer to get customer name

with prod_rank as
(select customer_id,
product_id,
dense_rank() over (partition by customer_id order by count(order_date) desc) as dr
from orders
group by customer_id,
product_id )

select r.customer_id, r.product_id, p.product_name
from prod_rank r join products p
on (r.product_id=p.product_id)
where r.dr=1

/*
select customer_id,product_id, product_name from
(select o.customer_id,p.product_id, p.product_name,count(o.order_id),
 dense_rank() over(partition by customer_id order by count(o.order_id) desc) as dr
from orders o join products p
on (p.product_id=o.product_id)
group by o.customer_id,p.product_id, p.product_name
)
where dr=1
*/
