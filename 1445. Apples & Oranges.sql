/* Write an SQL query to report the difference between number of apples and oranges sold each day.

Return the result table ordered by sale_date in format ('YYYY-MM-DD'). */

select to_char(sale_date, 'YYYY-MM-DD') as sale_date,
(sum(case when fruit= 'apples' then sold_num end) - 
sum(case when fruit= 'oranges' then sold_num end)) as diff
from sales
group by to_char(sale_date, 'YYYY-MM-DD')
order by sale_date 
