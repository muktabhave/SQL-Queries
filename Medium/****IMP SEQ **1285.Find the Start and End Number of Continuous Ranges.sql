/* Since some IDs have been removed from Logs. Write an SQL query to find the start and end number of continuous ranges in table Logs.
Order the result table by start_id. */
Table: Logs

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| log_id        | int     |
+---------------+---------+
log_id is the column of unique values for this table.
Each row of this table contains the ID in a log Table.
 

Write a solution to find the start and end number of continuous ranges in the table Logs.

Return the result table ordered by start_id.

The result format is in the following example.

 

Example 1:

Input: 
Logs table:
+------------+
| log_id     |
+------------+
| 1          |
| 2          |
| 3          |
| 7          |
| 8          |
| 10         |
+------------+
Output: 
+------------+--------------+
| start_id   | end_id       |
+------------+--------------+
| 1          | 3            |
| 7          | 8            |
| 10         | 10           |
+------------+--------------+


ANS1:

/* Write your PL/SQL query statement below */

with 
starttab as
(select log_id as start_id,
row_number() over(order by log_id) as rn
from
(select
log_id,
lag(log_id) over (order by log_id) as prev_logid
from logs
)
where prev_logid is null or ((log_id- prev_logid)<>1)
),

endtab as
(
select log_id as end_id,
row_number() over(order by log_id) as rn
from
(select
log_id,
lead(log_id) over (order by log_id) as next_logid
from logs
)
where next_logid is null or ((next_logid-log_id)<>1)
)

select start_id, end_id 
from starttab s join endtab e
on (s.rn=e.rn)


 ANS2:


with e as
(select l1.log_id as end_id, row_number() over(order by l1.log_id) as rn from logs l1 left join logs l2
on l1.log_id = l2.log_id -1
where l2.log_id is null),
s as
(select l1.log_id as start_id, row_number() over(order by l1.log_id) as rn from logs l1 left join logs l2
on l1.log_id = l2.log_id +1
where l2.log_id is null)

select s.start_id, e.end_id 
from s join e 
on(s.rn=e.rn);
