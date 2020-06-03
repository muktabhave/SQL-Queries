/*Write a SQL query to find all duplicate emails in a table named Person. */

select email from person
group by email
having count(distinct id)>1
