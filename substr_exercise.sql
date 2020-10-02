/* city name ends with vowel */
select distinct city from station
where substr(city, length(city),1) in ('a','e','i','o','u');

/* order by last 3 words city name*/

select name from students where marks>75 
order by substr(name,-3), id;
