/* Write an SQL query that reports for each player and date, how many games played so far by the player. That is, the total number of games played by the player until that date. Check the example for clarity. */

select a1.player_id, 
to_char(a1.event_date, 'YYYY-MM-DD') as event_date, 
sum(a2.games_played) as games_played_so_far
from activity a1 join activity a2
on ( a1.player_id= a2.player_id and a2.event_date<= a1.event_date)
group by a1.player_id,a1.event_date 
