select id from
(select
id,
temperature,
recordDate,
lag(recordDate) OVER (order by recordDate) as prevDate,
lag(temperature) OVER (order by recordDate) as prevTemp
from weather)
where temperature>prevTemp and recordDate-prevDate=1;
