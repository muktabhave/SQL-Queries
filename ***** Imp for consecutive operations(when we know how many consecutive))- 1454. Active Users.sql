/* Write an SQL query to find the id and the name of active users.

Active users are those who logged in to their accounts for 5 or more consecutive days. */

select id, name from accounts where id in
(select distinct id from
(select id, login_date,
lag(login_date, 4) over (partition by id order by login_date) as four_lagdate from
(select distinct id, login_date from logins l
))
where login_date- four_lagdate= 4)
order by id
