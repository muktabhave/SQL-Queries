/* 1596. The Most Frequently Ordered Products for Each Customer */

Faster Solution:

SELECT customer_id, p1.product_id, p2.product_name 
FROM
(SELECT customer_id, product_id,
DENSE_RANK() over (partition by customer_id order by count(order_id) desc) as dr
FROM orders 
GROUP BY customer_id, product_id) p1
JOIN products p2
ON (p1.product_id= p2.product_id)
WHERE dr=1


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
