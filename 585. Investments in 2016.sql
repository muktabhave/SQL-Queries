/* Write a query to print the sum of all total investment values in 2016 (TIV_2016), to a scale of 2 decimal places, for all policy holders who meet the following criteria:

Have the same TIV_2015 value as one or more other policyholders.
Are not located in the same city as any other policyholder (i.e.: the (latitude, longitude) attribute pairs must be unique). */

select round(sum(tiv_2016),2) as tiv_2016 from insurance
where tiv_2015 in
(select TIV_2015 as nonuniq_tiv15 from insurance group by TIV_2015
having count(TIV_2015)>1)  
and lat||','||lon in
(select lat||','||lon as uniq_loc from insurance group by lat||','||lon
having count(lat||','||lon)=1 )
