/* Get the highest answer rate question from a table survey_log with these columns: id, action, question_id, answer_id, q_num, timestamp. */

select question_id as  survey_log from
(select question_id,
nvl(count(answer_id)/ count(action),0) as answer_rate
from survey_log
group by question_id
order by answer_rate desc
) where rownum=1
