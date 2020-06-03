/* Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything. */

select name as customers 
from Customers c where id not in 
(select customerid from orders)
