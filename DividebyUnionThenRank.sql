/* https://leetcode.com/problems/tournament-winners/
1194. Tournament Winners */


select distinct group_id, player_id from
(
select p.group_id, player_id,
dense_rank() over (partition by p.group_id order by sum(score) desc, player_id asc) as dr
from
(select match_id, first_player as player, first_score as score from matches
union all
select match_id, second_player as player, second_score as score from matches
) a join players p
on (a.player = p.player_id)
group by p.group_id, player_id
)
where dr=1
