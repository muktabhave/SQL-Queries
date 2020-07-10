/* Write an SQL query to find for each month and country, the number of approved transactions and their total amount, the number of chargebacks and their total amount. */

select month, country,
sum(approved_count) as approved_count,
sum(approved_amount) as approved_amount,
sum(chargeback_count) as chargeback_count,
sum(chargeback_amount) as chargeback_amount from
(select 
to_char(t.trans_date , 'YYYY-MM') as month, t.country, 
count( case when t.state= 'approved' then t.id end) as approved_count,
sum (case when t.state= 'approved' then t.amount end) as approved_amount,
0 as chargeback_count,
0 as chargeback_amount
from transactions t 
group by to_char(t.trans_date, 'YYYY-MM'), t.country

union

select 
to_char(c.trans_date, 'YYYY-MM') as month,
t.country, 
0 as approved_count,
0 as approved_amount,
count(c.trans_id) as chargeback_count,
sum(t.amount) as chargeback_amount
from chargebacks c join transactions t 
on (c.trans_id= t.id)
group by to_char(c.trans_date, 'YYYY-MM'), t.country
)
group by month, country
having (sum(approved_count) >0 or sum(approved_amount)>0 or sum(chargeback_count)>0 or sum(chargeback_amount)>0)
