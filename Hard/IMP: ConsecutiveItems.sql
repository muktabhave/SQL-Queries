/* https://leetcode.com/problems/human-traffic-of-stadium 
601. Human Traffic of Stadium */

SQL Schema
Pandas Schema
Table: Stadium

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| visit_date    | date    |
| people        | int     |
+---------------+---------+
visit_date is the column with unique values for this table.
Each row of this table contains the visit date and visit id to the stadium with the number of people during the visit.
As the id increases, the date increases as well.
 

Write a solution to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.

Return the result table ordered by visit_date in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Stadium table:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-09 | 188       |
+------+------------+-----------+
Output: 
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-09 | 188       |
+------+------------+-----------+
Explanation: 
The four rows with ids 5, 6, 7, and 8 have consecutive ids and each of them has >= 100 people attended. Note that row 8 was included even though the visit_date was not the next day after row 7.
The rows with ids 2 and 3 are not included because we need at least three consecutive ids.

ANS:

/* using join */

select s.id , to_char(s.visit_date, 'YYYY-MM-DD') as visit_date
--,dt.visit_date as vs1, count(dt.visit_date) from
(select id , visit_date, people from stadium where people>100) s 
join
(select distinct visit_date from stadium where people>100) dt
on (s.visit_date>= dt.visit_date+2)
group by s.id , s.visit_date
having count(dt.visit_date)>=3
order by s.visit_date



/* Using window function */

select id , to_char(visit_date, 'YYYY-MM-DD') as visit_date , people from
(select id , visit_date , people,
lag(id, 1) over (order by visit_date) as lag_id_1,
lag(id, 2) over (order by visit_date) as lag_id_2,
lead(id, 1) over (order by visit_date) as lead_id_1,
lead(id, 2) over (order by visit_date) as lead_id_2
from 
(select id , visit_date , people from stadium where people>=100)
)
where (id- lag_id_1= 1 and id- lag_id_2=2) or
(id- lag_id_1= 1 and lead_id_1- id= 1) or
(lead_id_1- id= 1 and lead_id_2- id= 2 )
