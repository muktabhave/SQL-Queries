/* Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020. */

select  c.customer_id, name from
customers c join orders o
on (c.customer_id= o.customer_id)
join product p
on (p.product_id=o.product_id)
where order_date between '2020-06-01' and '2020-07-31'
group by c.customer_id, name
having sum(case when to_char(order_date, 'YYYY-MM')= '2020-06' then quantity*price end)>=100 
and sum(case when to_char(order_date, 'YYYY-MM')= '2020-07' then quantity*price end)>=100
