/* Write an SQL query to find the average for daily percentage of posts that got removed after being reported as spam, rounded to 2 decimal places. 

https://leetcode.com/problems/reported-posts-ii/

*/

select round(avg(avg_percent),2) as average_daily_percent from
(select
action_date,
(count(distinct case when r.remove_date>= a.action_date then a.post_id end) 
 /
count( distinct a.post_id))*100 as avg_percent 
from actions a left outer join removals r
on (a.post_id= r.post_id)
where action='report' and extra='spam'
group by action_date) 
