--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;



Q. 176 Second highest salary

create table if not exists 22SecondHighestSalary176(
    id int primary key,
    salary int
);

insert into 22SecondHighestSalary176 VALUES
(1,100),
(2,200),
(3,300);


mysql> select * from 22SecondHighestSalary176;
+----+--------+
| id | salary |
+----+--------+
|  1 |    100 |
|  2 |    200 |
|  3 |    300 |
+----+--------+
3 rows in set (0.00 sec)


--Write a solution to find the second highest distinct salary from the Employee table. 
--If there is no second highest salary, return null (return None in Pandas).

select
(select distinct Salary 
from 22SecondHighestSalary176 order by salary desc 
limit 1 offset 1) 
as SecondHighestSalary


Output


+---------------------+
| SecondHighestSalary |
+---------------------+
|                 200 |
+---------------------+
1 row in set (0.01 sec)
