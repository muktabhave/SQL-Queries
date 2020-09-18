/* Write an SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.*/

select customer_id, count(visit_id) as count_no_trans from 
visits where visit_id not in 
(select visit_id from transactions)
group by customer_id
