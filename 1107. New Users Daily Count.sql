{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 /*1107. New Users Daily Count */\
\
select to_char(first_login, 'YYYY-MM-DD') as "login_date", count(user_id) as "user_count" from\
(select user_id, min(activity_date) as first_login\
from traffic where activity= 'login' \
group by user_id)\
where first_login <=to_date('2019-06-30') and first_login >=(to_date('2019-06-30')-90)\
group by to_char(first_login, 'YYYY-MM-DD')\
order by to_char(first_login, 'YYYY-MM-DD')}