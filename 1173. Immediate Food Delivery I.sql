/* If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise it's called scheduled.

Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal places.

*/

select 
round(count(case when order_Date= customer_pref_delivery_date then delivery_id end)*100/
count(delivery_id), 2) as immediate_percentage
from delivery
