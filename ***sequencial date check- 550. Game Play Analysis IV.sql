/* Write an SQL query that reports the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players. */

select 
round(count(distinct case when rn=2 and event_date-1=lg then player_id end)/
count(distinct player_id) ,2) as fraction
from
(select player_id,event_date,
 lag(event_date, 1) over (partition by player_id order by event_date) as lg,
rank() over (partition by player_id order by event_date) as rn
from activity)
