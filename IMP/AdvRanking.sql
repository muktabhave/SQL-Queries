/* 1596. The Most Frequently Ordered Products for Each Customer */
select customer_id,product_id, product_name from
(select o.customer_id,p.product_id, p.product_name,count(o.order_id),
 dense_rank() over(partition by customer_id order by count(o.order_id) desc) as dr
from orders o join products p
on (p.product_id=o.product_id)
group by o.customer_id,p.product_id, p.product_name
)
where dr=1
