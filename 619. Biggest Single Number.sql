/* Table my_numbers contains many numbers in column num including duplicated ones.
Can you write a SQL query to find the biggest number, which only appears once. */

select max(num) as num from
(select num
from my_numbers
group by num
having count(num)=1)
