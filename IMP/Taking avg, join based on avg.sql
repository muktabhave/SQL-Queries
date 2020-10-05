/*
select distinct event_type, 
round((count(event_type) over (partition by event_type) /count(event_type) over()) ,2)as avg_eventtype
from events)
*/

select e.business_id from
(
select business_id, event_type, sum(occurences) as tot_occurence from
events group by business_id, event_type )  e 
join
(select event_type, sum(occurences)/ count(event_type) as avg_occurance
from events
group by event_type) ev
on (e.event_type= ev.event_type and e. tot_occurence > ev.avg_occurance)
group by business_id
having count(distinct e.event_type)>1
