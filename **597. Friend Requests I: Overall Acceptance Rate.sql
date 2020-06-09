/* Write a query to find the overall acceptance rate of requests rounded to 2 decimals, which is the number of acceptance divide the number of requests. */

select 
round(case when sum(accepted)>0 and sum(requested)>0 then sum(accepted)/ sum(requested) else 0 end, 2) as accept_rate from 
(select count(distinct concat(requester_id,accepter_id)) as accepted, 0 as requested from request_accepted
union
select 0 as accepted, count(distinct concat(sender_id, send_to_id)) as requested 
from friend_request )
