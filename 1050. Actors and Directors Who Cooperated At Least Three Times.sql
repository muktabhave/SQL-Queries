/* Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor have cooperated with the director at least 3 times. */

select actor_id, director_id
from ActorDirector 
group by actor_id, director_id
having count(timestamp)>=3
