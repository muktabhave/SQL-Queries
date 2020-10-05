/* 1205. Monthly Transactions II */

Select trans_month as month,
Country,
count(distinct case when state='approved' then id end) as approved_count,
sum(case when state='approved' then amount else 0 end) as approved_amount,
sum(is_chargeback) as chargeback_count,
sum(case when is_chargeback= 1 then amount else 0 end ) as chargeback_amount
from
(select id, country, state, amount, to_char(trans_date, 'YYYY-MM') as 
trans_month , 0 as is_chargeback from transactions

union

select c.trans_id , t.country, null as state, t.amount,
to_char(c.trans_date, 'YYYY-MM') as trans_month, 1 as is_chargeback
from transactions t join chargebacks c 
On (t.id= c.trans_id) )
group by trans_month,Country
having (count(distinct case when state='approved' then id end) >0
or sum(case when state='approved' then amount else 0 end)>0 
or sum(is_chargeback) >0
or sum(case when is_chargeback= 1 then amount else 0 end )>0 )
order by trans_month
