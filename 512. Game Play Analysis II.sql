/* This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
Write a SQL query that reports the device that is first logged in for each player. */

/* method-1 */

select player_id, device_id from
(select player_id,
device_id,
dense_rank() over (partition by player_id order by event_date) as rn
from activity)
where rn=1


/* method-2 */
select a.player_id, a.device_id from
activity a join
(select player_id,
Min(event_date) as min_eventdate
from activity
group by player_id ) b
on (a.player_id= b.player_id and a.event_date= b.min_eventdate )
