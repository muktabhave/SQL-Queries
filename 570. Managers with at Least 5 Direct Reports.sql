select e2.name as Name
from Employee e1 join Employee e2 
on(e1.managerid=e2.id)
group by e1.managerid
having count(e1.id)>=5
