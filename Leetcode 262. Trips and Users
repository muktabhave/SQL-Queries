Leetcode 262. Trips and Users
https://leetcode.com/problems/trips-and-users/

Output Query:

select Request_at as Day,
round(count(case when Status like 'cancelled%' then Id end) / count(Id), 2) as "Cancellation Rate"
from
Trips t 
where t.Client_Id in
(select Users_Id from Users u where u. Banned= 'No')
and t.Driver_Id in 
 (select Users_Id from Users u where u. Banned= 'No' )
 and Request_at between '2013-10-01' and '2013-10-03'
 group by Request_at
