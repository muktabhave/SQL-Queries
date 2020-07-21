/* Write your PL/SQL query statement below */


select invoice_id, customer_name, price, 
count(contact_name) as contcats_cnt,
count(case when ct.contact_email= cs.email then 1 end ) as trusted_contcats_cnt
from 
customers cs join contacts ct
on (cs.customer_id=ct.user_id)
join invoices i
on (cs.customer_id= i.user_id)
group by invoice_id, customer_name, price
order by 1
