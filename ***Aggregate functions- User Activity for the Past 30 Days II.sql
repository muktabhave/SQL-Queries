/* 1142. User Activity for the Past 30 Days II */


select round(nvl(avg(sid),0),2) as average_sessions_per_user 
from
(select count(distinct session_id) as sid from activity 
where activity_date between 
 (to_date('2019-07-27')-29) and to_date('2019-07-27')
group by user_id)
