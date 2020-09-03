/* Given three tables: salesperson, company, orders.
Output all the names in the table salesperson, who didn’t have sales to company 'RED'.*/

select name from salesperson where name not in
(select s.name
from salesperson s join 
orders o on (o.sales_id= s.sales_id)
join company c
on (o.com_id= c.com_id)
where c.name= 'RED')
