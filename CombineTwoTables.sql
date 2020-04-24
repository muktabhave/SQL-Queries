/* 175. Combine Two Tables
Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people
*/


select firstname, lastname, city, state 
from person p left join address a
on (p.personid=a.personid)
