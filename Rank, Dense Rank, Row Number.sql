/* Rank, Dense Rank, Row Number functions are used to rank data based on given partition and given sort order */

Select emptied, empname, deptname, sal,
rank() over (partition by deptname order by sal) as sal_rank,
dense_rank() over (partition by deptname order by sal) as sal_dense_rank,
row_number() over (partition by deptname order by sal) as sal_rownum
From employees;

