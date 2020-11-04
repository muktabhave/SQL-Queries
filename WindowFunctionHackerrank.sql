/*
https://www.hackerrank.com/challenges/harry-potter-and-wands/submissions/code/182461320
*/

select id, age, coins_needed, power from
(select id, age, coins_needed, power ,
dense_rank() over (partition by age, power order by coins_needed, power desc) as wand_rank
from Wands w join Wands_Property p
on (w.code= p.code)
where p.is_evil=0 )
where wand_rank=1
order by power desc, age desc;
