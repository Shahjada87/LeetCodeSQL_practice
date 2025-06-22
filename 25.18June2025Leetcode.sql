
show tables;

Q. 176 Second highest salary

create table if not exists 47SecondHighestSalary176(
    id int primary key,
    salary int
);

insert into 47SecondHighestSalary176 VALUES
(1,100),
(2,200),
(3,300);


mysql> select * from 47SecondHighestSalary176;
+----+--------+
| id | salary |
+----+--------+
|  1 |    100 |
|  2 |    200 |
|  3 |    300 |
+----+--------+


--Write a solution to find the second highest distinct salary from the Employee table. 
--If there is no second highest salary, return null (return None in Pandas).

select
(select distinct Salary 
from 47SecondHighestSalary176 order by salary desc 
limit 1 offset 1) 
as SecondHighestSalary


Output

+---------------------+
| SecondHighestSalary |
+---------------------+
|                 200 |
+---------------------+


--------------------------------------------------------------------------



select distinct Max(salary)
from 47SecondHighestSalary176
where id % 2 = 0
order by salary desc 


