--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 1731 The number of employees which report to each employee


create table if not exists 48Employees1731(
    employee_id int primary key,
    name varchar(30),
    reports_to int,
    age int
)

insert into 48Employees1731 values
(9, 'Hercy', NULL, 43),
(6, 'Alice', 9, 41),
(4, 'Bob', 9, 36),
(2, 'Winston', NULL, 37);


mysql> select * from 48Employees1731;
+-------------+---------+------------+------+
| employee_id | name    | reports_to | age  |
+-------------+---------+------------+------+
|           2 | Winston |       NULL |   37 |
|           4 | Bob     |          9 |   36 |
|           6 | Alice   |          9 |   41 |
|           9 | Hercy   |       NULL |   43 |
+-------------+---------+------------+------+
4 rows in set (0.01 sec)


--For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
--Write a solution to report the ids and the names of all managers, 
--the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
--Return the result table ordered by employee_id.


With cte as (
select reports_to as employee_id, count(employee_id) as reports_coutn, round(avg(age),0) as avg_age
from 48Employees1731
where reports_to is not NULL
group By reports_to
)
select a.employee_id,b.name,a.reports_coutn, a.avg_age
from cte a
left join 48Employees1731 b 
on a.employee_id = b.employee_id
order by b.employee_id


Output 

+-------------+-------+---------------+---------+
| employee_id | name  | reports_coutn | avg_age |
+-------------+-------+---------------+---------+
|           9 | Hercy |             2 |      39 |
+-------------+-------+---------------+---------+
1 row in set (0.07 sec)

