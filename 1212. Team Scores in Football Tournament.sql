{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #1212. Team Scores in Football Tournament\
\
select t2.team_id as team_id, t2.team_name as team_name, sum(ifnull(points,0)) as num_points from\
( select match_id, host_team as team, \
case when host_goals> guest_goals then 3\
when host_goals= guest_goals then 1\
else 0 end as points \
from Matches\
\
union all\
\
select match_id, guest_team as team,\
case when guest_goals> host_goals then 3\
when host_goals= guest_goals then 1\
else 0 end as points \
from Matches\
) as t right outer join Teams as t2\
on (t.team= t2.team_id)\
group by 1,2\
order by 1\
\
}