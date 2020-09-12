/* Write an SQL query to report how many units in each category have been ordered on each day of the week.

Return the result table ordered by category. */

select
item_category as category,
sum(nvl(case when day='MONDAY' then sum_item end, 0)) as MONDAY,
sum(nvl(case when day='TUESDAY' then sum_item end, 0)) as TUESDAY,
sum(nvl(case when day='WEDNESDAY' then sum_item end, 0)) as WEDNESDAY,
sum(nvl(case when day='THURSDAY' then sum_item end, 0)) as THURSDAY,
sum(nvl(case when day='FRIDAY' then sum_item end, 0)) as FRIDAY,
sum(nvl(case when day='SATURDAY' then sum_item end, 0)) as SATURDAY,
sum(nvl(case when day='SUNDAY' then sum_item end, 0)) as SUNDAY
from
(
select
trim(to_char(o.order_date, 'DAY')) as day,
i.item_category,
sum(o.quantity) as sum_item
from orders o right outer join items i
on (o.item_id= i.item_id)
group by 
trim(to_char(o.order_date, 'DAY')),
i.item_category
)
group by item_category
order by item_category
