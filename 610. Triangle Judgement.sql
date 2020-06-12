/* Could you help Tim by writing a query to judge whether these three sides can form a triangle, assuming table triangle holds the length of the three sides x, y and z. */

select
x,
y,
z,
case when x+y>z and x+z>y and y+z>x then 'Yes' else 'No' end as triangle
from triangle
