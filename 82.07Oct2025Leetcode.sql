--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1179 Reformat Department Table

create table if not exists 73ReformatDepartmentTable1179(
    id int,
    revenue int,
    month varchar(50)
);

insert into 73ReformatDepartmentTable1179 values
(1, 8000, 'Jan'),
(2, 9000, 'Jan'),
(3, 10000, 'Feb'),
(1, 7000, 'Feb'),
(1, 6000, 'Mar');


mysql> select * from 73ReformatDepartmentTable1179;
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
|    1 |    8000 | Jan   |
|    2 |    9000 | Jan   |
|    3 |   10000 | Feb   |
|    1 |    7000 | Feb   |
|    1 |    6000 | Mar   |
+------+---------+-------+
5 rows in set (0.01 sec)


--Reformat the table such that there is a department id column and a revenue column for each month.
--Return the result table in any order.


select id,
Sum(case when month='jan' then revenue else null end) as Jan_Revenue,
Sum(case when month='feb' then revenue else null end) as Feb_Revenue,
Sum(case when month='mar' then revenue else null end) as March_Revenue,
Sum(case when month='april' then revenue else null end) as April_Revenue,
Sum(case when month='may' then revenue else null end) as May_Revenue,
Sum(case when month='june' then revenue else null end) as June_Revenue,
Sum(case when month='july' then revenue else null end) as July_Revenue,
Sum(case when month='aug' then revenue else null end) as Aug_Revenue,
Sum(case when month='Sept' then revenue else null end) as Sept_Revenue,
Sum(case when month='Oct' then revenue else null end) as Oct_Revenue,
Sum(case when month='Nov' then revenue else null end) as Nov_Revenue,
Sum(case when month='Dec' then revenue else null end) as Dec_Revenue
from 73ReformatDepartmentTable1179
group by id

