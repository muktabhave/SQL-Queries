/* Write an SQL query to report the Total sales amount of each item for each year, with corresponding product name, product_id, product_name and report_year.

Dates of the sales years are between 2018 to 2020. Return the result table ordered by product_id and report_year. */

select a.product_id, product_name, report_year, total_amount from
(
select product_id, to_char(period_start, 'YYYY') as report_year,
((period_end - period_start)+1) * average_daily_sales as  total_amount
from sales where to_char(period_start, 'YYYY')= to_char(period_end, 'YYYY')

union

select  product_id, to_char(period_start, 'YYYY') as report_year,
(((ADD_MONTHS(TRUNC (period_start ,'YEAR'),12)-1) - period_start)+1) * average_daily_sales as total_amount
from sales s
where to_number(to_char(period_start, 'YYYY'))= to_number(to_char(period_end, 'YYYY')) -1

union

select  product_id, to_char(period_end, 'YYYY') as report_year,
(( period_end- TRUNC(period_end , 'YEAR'))+1) * average_daily_sales as total_amount
from sales s
where to_number(to_char(period_start, 'YYYY'))= to_number(to_char(period_end, 'YYYY')) -1

union
    
select  product_id, to_char(period_start, 'YYYY') as report_year,  
((ADD_MONTHS(TRUNC (period_start ,'YEAR'),12)-1) - period_start +1) * average_daily_sales as total_amount  
from sales s
where to_number(to_char(period_start, 'YYYY'))= to_number(to_char(period_end, 'YYYY')) -2

union

select  product_id, to_char(add_months(period_start, 12), 'YYYY') as report_year,
( (ADD_MONTHS(TRUNC (period_start ,'YEAR'),24)-1)- (ADD_MONTHS(TRUNC (period_start ,'YEAR'),12)) +1) * average_daily_sales as total_amount
from sales s
where to_number(to_char(period_start, 'YYYY'))= to_number(to_char(period_end, 'YYYY')) -2

union
    
select  product_id, to_char(period_end, 'YYYY') as report_year,
(( period_end- TRUNC(period_end , 'YEAR'))+1) * average_daily_sales as total_amount
from sales s
where to_number(to_char(period_start, 'YYYY'))= to_number(to_char(period_end, 'YYYY')) -2
) 
a
join Product p
on (a.product_id= p.product_id)
order by a.product_id, report_year
