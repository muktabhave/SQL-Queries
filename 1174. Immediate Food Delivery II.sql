{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # 1174. Immediate Food Delivery II\
\
select\
round((count(case when order_date= customer_pref_delivery_date then 1 end)/\
count(order_date))*100,2) as immediate_percentage       \
from delivery where (customer_id, order_date) in\
(select customer_id, min(order_date) as first_order_date \
from Delivery group by customer_id)}