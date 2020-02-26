 select t.team_id, t.team_name, 
sum(nvl(team_points,0)) as num_points from
(select host_team as team,
case when host_goals>guest_goals then 3
    when host_goals=guest_goals then 1
    when host_goals<guest_goals then 0
    end as team_points
from Matches

union all

select guest_team as team,
case when host_goals>guest_goals then 0
    when host_goals=guest_goals then 1
    when host_goals<guest_goals then 3
    end as team_points
from Matches) m right outer join Teams t
on(m.team=t.team_id)
group by t.team_id, t.team_name
order by num_points desc, t.team_id
