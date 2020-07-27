/* Write an SQL query for a report that provides the customer ids from the Customer table that bought all the products in the Product table. */

select customer_id from customer
group by customer_id
having count(distinct product_key)=
(select count(product_key) from product)
