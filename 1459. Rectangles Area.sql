/* Write an SQL query to report of all possible rectangles which can be formed by any two points of the table. 

Each row in the result contains three columns (p1, p2, area) where:

p1 and p2 are the id of two opposite corners of a rectangle and p1 < p2.
Area of this rectangle is represented by the column area.
Report the query in descending order by area in case of tie in ascending order by p1 and p2.*/


select 
pa.id as p1, 
pb.id as p2, 
abs(pa.x_value  -pb.x_value )*abs(pa.y_value  -pb.y_value ) as area
from
points pa join points pb
on (pa.id< pb.id)
where abs(pa.x_value  -pb.x_value )*abs(pa.y_value  -pb.y_value )>0
order by area desc, pa.id, pb.id 
