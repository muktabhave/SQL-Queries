/* Since some IDs have been removed from Logs. Write an SQL query to find the start and end number of continuous ranges in table Logs.
Order the result table by start_id. */

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
