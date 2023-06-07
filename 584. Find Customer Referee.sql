/* Given a table customer holding customers information and the referee. */

method-1
select name from customer where nvl(referee_id, 0) <>2


method-2
select name from customer
where referee_id is null or referee_id!=2
