/* https://leetcode.com/problems/number-of-transactions-per-visit/ */


with trans as
(select  no_of_trans as transactions_count, count(visit_date) as visits_count from 
(select v.user_id, visit_date,
nvl(count( case when t.user_id is not null and visit_date=transaction_date then transaction_date end),0) as no_of_trans
from visits v left outer join transactions t
on (v.user_id= t.user_id )
group by v.user_id, visit_date)
group by no_of_trans) ,

full_count AS 
(
    SELECT ROW_NUMBER () OVER (order by  transaction_date) AS transactions_count FROM Transactions
    UNION ALL
    SELECT 0 as transactions_count from dual
)

select 
c.transactions_count, nvl(t.visits_count, 0) as visits_count
from trans t right outer join full_count c
on (t.transactions_count= c.transactions_count)
where c.transactions_count<= (select max(transactions_count) from trans)
order by c.transactions_count
