/* Write an SQL query that reports the first login date for each player. */

select player_id, to_char(min(event_date), 'YYYY-MM-DD') as first_login
from activity
group by player_id
