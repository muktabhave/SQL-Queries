/* Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on some day if he/she made at least one activity on that day. */

select to_char(activity_date, 'YYYY-MM-DD') as day , count(distinct user_id) as active_users from activity
where activity_date between (to_date('2019-07-27')- 29 ) and to_date('2019-07-27')
group by to_char(activity_date, 'YYYY-MM-DD')
