select e.business_id
from events e join
(select event_type, avg(occurences) as avg_occurances
from events 
group by event_type) o
on (e.event_type= o.event_type)
where e.occurences > o.avg_occurances
group by e.business_id
having count(e.event_type)>1
