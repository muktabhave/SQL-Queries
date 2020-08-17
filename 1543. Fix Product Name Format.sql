/* Write an SQL query to report

product_name in lowercase without leading or trailing white spaces.
sale_date in the format ('YYYY-MM') 
total the number of times the product was sold in this month. */

select 
trim(lower(product_name)) as product_name,
to_char(sale_date, 'YYYY-MM') as sale_date,
count(trim(lower(product_name))) as total
from sales
group by
trim(lower(product_name)),
to_char(sale_date, 'YYYY-MM')
order by 1,2
