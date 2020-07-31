/* Please write a query to display the records which have 3 or more consecutive rows and the amount of people more than 100(inclusive). */

select a.id, a.date, a.people from 
(select id, 
 date, 
 people,
 LAG(people, 2) over(order by date) as before_ystday,
 LAG(people, 1) over(order by date) as ystday,
 LEAD(people, 1) over(order by date) as snd_day, 
 LEAD(people, 2) over(order by date) as third_day
 from stadium) a
where (a.people>=100 and a.snd_day<=100 and a.third_day>=100) or (a.before_ystday>=100 and a.ystday<=100 and a.people>=100) or (a.ystday>=100 and a.people<=100 and a.snd_day>=100);
