/* Write an SQL query to find the names of all the activities with neither maximum, nor minimum number of participants.

Return the result table in any order. Each activity in table Activities is performed by any person in the table Friends. */

select m2.name as activity from
(select max(countid) as maxcount,
min(countid) as mincount
from 
(select activity , count(id) as countid
from friends
group by activity)) m1 
join 
(
select a.name, count(f.name) as countfname
from activities a left outer join friends f
on (a.name=f.activity)
group by a.name
) m2
on (m2.countfname!= m1.maxcount and m2.countfname!= m1.mincount)

 
 /* Alternative with almost same complexity
 
 select activity from
(select activity, 
rank() over(order by ppl) as ar, 
rank() over(order by ppl desc) as dr
from
(select activity, count(name) as ppl from friends group by 1 )t)z 
where ar<> 1 
and dr<> 1 
 
 */
