/* Write an SQL query to find the type of weather in each country for November 2019.

The type of weather is Cold if the average weather_state is less than or equal 15, Hot if the average weather_state is greater than or equal 25 and Warm otherwise. */

select country_name,
case when avg(weather_state) <= 15 then 'Cold'
when avg(weather_state)>=25 then 'Hot'
else 'Warm' end as weather_type
from countries c join weather w
on (c.country_id= w.country_id)
where to_char(day, 'YYYY-MM')= '2019-11'
group by country_name

