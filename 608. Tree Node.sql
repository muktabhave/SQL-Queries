{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # 608. Tree Node\
\
select id, "Root" as Type from tree\
where p_id is null\
\
union\
\
select id, "Leaf" as Type from tree \
where id not in \
(select  ifnull(p_id,0) from tree)\
and p_id is not null\
\
union\
\
select id, "Inner" as Type from tree \
where p_id is not null\
and id in (select p_id from tree)\
\
order by id}