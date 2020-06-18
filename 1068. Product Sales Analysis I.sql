/* Write an SQL query that reports all product names of the products in the Sales table along with their selling year and price. */

select product_name, year, price
from sales s join product p
on(p.product_id= s.product_id)
