/* 1355. Activity Participants */


select m2.activity as activity from
(select max(countid) as maxcount,
min(countid) as mincount
from 
(select activity , count(id) as countid
from friends
group by activity)) m1 
join 
(
select activity, count(name) as countfname
from friends a 
group by activity
) m2
on (m2.countfname!= m1.maxcount and m2.countfname!= m1.mincount)
