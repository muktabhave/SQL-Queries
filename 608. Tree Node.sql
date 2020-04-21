select id, "Root" as Type from tree
where p_id is null

union

select id, "Leaf" as Type from tree 
where id not in 
(select  ifnull(p_id,0) from tree)
and p_id is not null

union

select id, "Inner" as Type from tree 
where p_id is not null
and id in (select p_id from tree)

order by id
