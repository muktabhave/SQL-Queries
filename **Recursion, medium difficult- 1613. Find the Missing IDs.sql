/* https://leetcode.com/problems/find-the-missing-ids/
   Recusrsion in mysql
*/

with recursive e as

( select 1 as cust_no
 union all
 select cust_no +1 from e
 where cust_no< (select max(customer_id) from customers)
)

select cust_no as ids
from e where cust_no not in 
(select customer_id from customers) 
order by cust_no
