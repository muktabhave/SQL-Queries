/* Write an SQL query to report the number of calls and the total call duration between each pair of distinct persons (person1, person2) where person1 < person2. */

select from_id as person1, to_id as person2,
count(from_id) as call_count,
sum(duration) as total_duration
from
(select from_id, to_id, duration
from calls where from_id<to_id

union all

select to_id as from_id, from_id as to_id, duration
from calls where from_id>to_id )
group by from_id, to_id
