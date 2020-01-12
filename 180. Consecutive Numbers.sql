180. Consecutive Numbers

https://leetcode.com/problems/consecutive-numbers/

o/p Query:

select distinct l1.num as ConsecutiveNums 
from Logs l1 join logs l2
on (l1.num= l2.num and l1.Id= l2.Id-1)
join logs l3
on(l2.num= l3.num and l1.Id= l3.Id-2)


