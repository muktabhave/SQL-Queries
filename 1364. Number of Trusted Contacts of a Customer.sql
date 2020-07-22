/* Write an SQL query to find the following for each invoice_id:

customer_name: The name of the customer the invoice is related to.
price: The price of the invoice.
contacts_cnt: The number of contacts related to the customer.
trusted_contacts_cnt: The number of contacts related to the customer and at the same time they are customers to the shop. (i.e His/Her email exists in the Customers table.)
Order the result table by invoice_id.
*/

select invoice_id, cs.customer_name, price, count(ct.contact_name) as contacts_cnt, 
count( case when ct.contact_email in (select email from Customers) then ct.contact_email end) as trusted_contacts_cnt
from 
customers cs 
left outer join contacts ct
on (cs.customer_id=ct.user_id)
right outer join invoices i
on (cs.customer_id= i.user_id)
group by invoice_id, cs.customer_name, price
order by 1
