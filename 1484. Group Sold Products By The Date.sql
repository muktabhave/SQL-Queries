/* Write an SQL query to find for each date, the number of distinct products sold and their names.
https://leetcode.com/problems/group-sold-products-by-the-date/
*/


select 
(to_char(sell_date,'YYYY-MM-DD')) as sell_date,
count(product) as num_sold,
listagg(product,',') WITHIN GROUP (ORDER BY product) as products
from (select distinct sell_date,product from Activities)
group by sell_date
