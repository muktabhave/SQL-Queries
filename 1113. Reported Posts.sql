/* Write an SQL query that reports the number of posts reported yesterday for each report reason. Assume today is 2019-07-05. */

select extra as report_reason,
count(distinct post_id) as report_count 
from actions
where action= 'report'
and action_date= to_date('2019-07-04')
group by extra
