
\f0\fs24 \cf0 #1070. Product Sales Analysis III\
\
select product_id, year as first_year, quantity, price from Sales\
where (product_id, year) in\
(select product_id, min(year) as first_year from Sales group by product_id)}
