/* Write your PL/SQL query statement below */


select player_id, min(event_date) as install_date 
from Activity
group by player_id
