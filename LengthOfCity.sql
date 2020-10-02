/* https://www.hackerrank.com/challenges/weather-observation-station-5/problem */

SELECT MIN(CITY),LENGTH(CITY) FROM STATION 
GROUP BY LENGTH(CITY)
having (LENGTH(CITY) = (select min(LENGTH(CITY)) from station) or
LENGTH(CITY) = (select max(LENGTH(CITY)) from station))
ORDER BY LENGTH(CITY);
