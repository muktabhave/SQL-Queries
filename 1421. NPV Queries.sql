/* Write an SQL query to find the npv of all each query of queries table. */

select  q.id   , q.year   , nvl(npv ,0) as npv
from npv n right outer join queries q
on (n.id=q.id and n.year=q.year)
