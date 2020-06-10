/* Given a table customer holding customers information and the referee. */

select name from customer
where referee_id is null or referee_id!=2
