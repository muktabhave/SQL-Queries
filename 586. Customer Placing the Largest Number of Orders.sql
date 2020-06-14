/* Query the customer_number from the orders table for the customer who has placed the largest number of orders. */

select customer_number from
(select customer_number, count(distinct order_number) as order_count
from orders
group by customer_number
order by count(distinct order_number) desc )
where rownum=1
