Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| revenue     | int     |
| month       | varchar |
+-------------+---------+
In SQL,(id, month) is the primary key of this table.
The table has information about the revenue of each department per month.
The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
 

Reformat the table such that there is a department id column and a revenue column for each month.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+
Output: 
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+
Explanation: The revenue from Apr to Dec is null.
Note that the result table has 13 columns (1 for the department id + 12 for the months).

Solution__________________________________________________________________________________________________________________

  
select
id,
sum(case when month= 'Jan' then revenue end) as jan_revenue,
sum(case when month= 'Feb' then revenue end) as feb_revenue,
sum(case when month= 'Mar' then revenue end) as mar_revenue,
sum(case when month= 'Apr' then revenue end) as apr_revenue,
sum(case when month= 'May' then revenue end) as may_revenue,
sum(case when month= 'Jun' then revenue end) as jun_revenue,
sum(case when month= 'Jul' then revenue end) as jul_revenue,
sum(case when month= 'Aug' then revenue end) as aug_revenue,
sum(case when month= 'Sep' then revenue end) as sep_revenue,
sum(case when month= 'Oct' then revenue end) as oct_revenue,
sum(case when month= 'Nov' then revenue end) as nov_revenue,
sum(case when month= 'Dec' then revenue end) as dec_revenue
from department
group by id
