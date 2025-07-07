--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 1075 Project Employees I

Create table if not exists 30Project_1075 (
    project_id int,
    employee_id int,
    PRIMARY KEY (project_id, employee_id)
);

insert into 30Project_1075 VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

mysql> select * from 30Project_1075;
+------------+-------------+
| project_id | employee_id |
+------------+-------------+
|          1 |           1 |
|          1 |           2 |
|          1 |           3 |
|          2 |           1 |
|          2 |           4 |
+------------+-------------+
5 rows in set (0.00 sec)


create table if not exists 30_1ProjectEmployeesI1075(
    employee_id int primary key,
    name varchar(50),
    experience_years int
);


insert into 30_1ProjectEmployeesI1075 values 
(1, 'Khalid', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);


mysql> select * from 30_1ProjectEmployeesI1075;
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
|           1 | Khalid |                3 |
|           2 | Ali    |                2 |
|           3 | John   |                1 |
|           4 | Doe    |                2 |
+-------------+--------+------------------+
4 rows in set (0.02 sec)



--Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
--Return the result table in any order.

select a.project_id, Round(avg(b.experience_years),2) as average_years 
from 30Project_1075 a
left join 30_1ProjectEmployeesI1075 b
on a.employee_id = b.employee_id
group by a.project_id;


+------------+---------------+
| project_id | average_years |
+------------+---------------+
|          1 |          2.00 |
|          2 |          2.50 |
+------------+---------------+
2 rows in set (0.05 sec)