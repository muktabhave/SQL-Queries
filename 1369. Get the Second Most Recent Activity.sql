/* Write an SQL query to show the second most recent activity of each user.

If the user only has one activity, return that one. 

A user can't perform more than one activity at the same time. Return the result table in any order. */

select username,activity,to_char(startdate, 'YYYY-MM-DD') as startdate, to_char(enddate, 'YYYY-MM-DD') as enddate from
(select username,activity,startdate, enddate,
row_number() over (partition by username order by startdate desc) as rn
from useractivity)
where rn=2

union

select
u1.username, u1.activity,to_char(u1.startdate, 'YYYY-MM-DD') as startdate, to_char(u1.enddate, 'YYYY-MM-DD') as enddate
from userActivity u1 join 
(select username from userActivity group by username having count(activity)=1) u2
on u1.username= u2.username

