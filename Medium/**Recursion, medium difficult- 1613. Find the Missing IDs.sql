/* https://leetcode.com/problems/find-the-missing-ids/
   Recusrsion in mysql
*/

SQL Schema
Pandas Schema
Table: Customers

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| customer_name | varchar |
+---------------+---------+
customer_id is the column with unique values for this table.
Each row of this table contains the name and the id customer.
 

Write a solution to find the missing customer IDs. The missing IDs are ones that are not in the Customers table but are in the range between 1 and the maximum customer_id present in the table.

Notice that the maximum customer_id will not exceed 100.

Return the result table ordered by ids in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Customers table:
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 1           | Alice         |
| 4           | Bob           |
| 5           | Charlie       |
+-------------+---------------+
Output: 
+-----+
| ids |
+-----+
| 2   |
| 3   |
+-----+
Explanation: 
The maximum customer_id present in the table is 5, so in the range [1,5], IDs 2 and 3 are missing from the table.



ANSWER:

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
