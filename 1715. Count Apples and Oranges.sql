/* Write an SQL query to count the number of apples and oranges in all the boxes. If a box contains a chest, you should also include the number of apples and oranges it has.
*/

select
sum(chest_apple+apple_Count) as apple_count,
sum(chest_orange+orange_count) as orange_count 
from
(select
box_id, 
nvl(case when b.chest_id is not null then c.apple_count end, 0) as chest_apple,
nvl(case when b.chest_id is not null then c.orange_count end, 0) as chest_orange,
b.apple_count,
b.orange_count
from boxes b left outer join chests c
on (b.chest_id=c.chest_id) )
