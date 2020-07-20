/* Write an SQL query to find the person_name of the last person who will fit in the elevator without exceeding the weight limit. It is guaranteed that the person who is first in the queue can fit in the elevator. */

/* solution with joins
select person_name from Queue p3 
join
(select  p1.turn, sum(p2.weight) as weight,
rank() over (order by sum(p2.weight) desc) as rn
from 
(select turn, weight from Queue) p1
join (select turn, weight from Queue)  p2
on (p1.turn>= p2.turn)
group by p1.turn
having sum(p2.weight)<=1000) p4
on (p3.turn= p4.turn
and p4.rn=1)
*/

select person_name from
(select person_name
from(
select person_name,sum(weight) over(order by turn) as tol ,turn
from Queue
)m
where tol<=1000
order by tol desc)
where rownum=1
