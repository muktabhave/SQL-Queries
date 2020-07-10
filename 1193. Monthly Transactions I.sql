/*Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount. */

select to_char(trans_date, 'YYYY-MM') as month,
country,
count(id) as trans_count,
count(case when state='approved' then id end) as approved_count,
sum(amount) as trans_total_amount,
sum(case when state='approved' then amount else 0 end) as approved_total_amount
from transactions
group by to_char(trans_date, 'YYYY-MM'),
country
