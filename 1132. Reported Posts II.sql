select 
round(avg(daily_per),2) as average_daily_percent from
(select 
 (count(case when remove_date is not null then a.post_id end)/count(a.post_id))*100 as daily_per,
action_date
from Actions a left outer join removals r 
on (a.post_id=r.post_id) 
where action='report' and extra='spam'
group by action_date)
