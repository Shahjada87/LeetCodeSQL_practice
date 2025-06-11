--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1731 The number of employees which report to each employee

create table if not exists 13EmployeesWhichReportToEachEmployee1731(
    employee_id int primary key,
    name int,
    reports_to varchar(50),
    age int
);

alter table 13EmployeesWhichReportToEachEmployee1731 modify column name varchar(50), modify column reports_to int;


insert into 13EmployeesWhichReportToEachEmployee1731 values 
(9, 'Hercy', NULL, 43),
(6, 'Alice', 9, 41),
(4, 'Bob', 9, 36),
(2, 'Winston', NULL, 37);


mysql> select * from 13EmployeesWhichReportToEachEmployee1731;
+-------------+---------+------------+------+
| employee_id | name    | reports_to | age  |
+-------------+---------+------------+------+
|           2 | Winston |       NULL |   37 |
|           4 | Bob     |          9 |   36 |
|           6 | Alice   |          9 |   41 |
|           9 | Hercy   |       NULL |   43 |
+-------------+---------+------------+------+


--For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
--Write a solution to report the ids and the names of all managers, 
--the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
--Return the result table ordered by employee_id.

With cte as
(Select reports_to, count(employee_id) as reports_count, Round(avg(age),0) as average_age
FROM 13EmployeesWhichReportToEachEmployee1731
group by reports_to)
select b.employee_id, b.name, a.reports_count, a.average_age
from cte a
left join 13EmployeesWhichReportToEachEmployee1731 b
on a.reports_to = b.employee_id
where a.reports_to IS NOT NULL
order by b.employee_id;


Output

+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
|           9 | Hercy |             2 |          39 |
+-------------+-------+---------------+-------------+


--------------------------------------------------------------------------




