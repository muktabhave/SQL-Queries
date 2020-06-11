
/* Write an SQL query to find the average selling price for each product.
average_price should be rounded to 2 decimal places. */

select p.product_id, 
round(sum(price*units)/ sum(units),2) as average_price 
from prices p join unitssold u
on (p.product_id=u.product_id
   and purchase_date>=start_date and purchase_date<=end_date)
group by p.product_id
