180. Consecutive Numbers

https://leetcode.com/problems/consecutive-numbers/

  Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.


________________________________________________________________________________________________________________________  

  o/p Query:

-- 1) join 2 instances of table based on num and abs(1.id-2.id) =1
-- 2) Count all such ids and return only that whare count id>=3

-- select nvl(l1.num, l2.num) as consecutivenums
-- from logs l1 join logs l2
-- on (l1.num= l2.num 
-- and abs(l1.id- l2.id)=1 )
-- group by nvl(l1.num, l2.num)
-- having count(distinct l1.id)>=3 or count(distinct l2.id)>=3 

select distinct num as ConsecutiveNums from
(select 
 num, 
 id,
 lag(id,2) over (partition by num order by id) as lag_2_id
from logs)
where (id-lag_2_id)=2

/* third way */  
select distinct l1.num as ConsecutiveNums 
from Logs l1 join logs l2
on (l1.num= l2.num and l1.Id= l2.Id-1)
join logs l3
on(l2.num= l3.num and l1.Id= l3.Id-2)


