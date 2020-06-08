/* Write an SQL query to get the names of products with greater than or equal to 100 units ordered in February 2020 and their amount. */

select p.product_name, sum(unit) as unit 
from products p join orders o
on (p.product_id=o.product_id)
where to_char(o.order_date, 'YYYY-MM')= '2020-02'
group by p.product_name
having sum(unit)>=100
