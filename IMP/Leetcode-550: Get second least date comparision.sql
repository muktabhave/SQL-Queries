--550. Game Play Analysis IV

select round(count(distinct case when dr=2 and event_date-lag_date= 1 then b.player_id end)/
count(distinct b.player_id),2) as fraction
from 
(select player_id,
event_date,
 dense_rank() over (partition by player_id order by event_date) as dr,
lag(event_date, 1) over (partition by player_id order by event_date) as lag_date
from activity)b
