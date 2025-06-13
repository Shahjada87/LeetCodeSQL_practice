--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1789 Primary department for each employee

Create table if not exists 14PrimaryDepartmentForEachEmployee1789(
    employee_id int,
    department_id int,
    primary_flag varchar(50),
    primary key (employee_id, department_id) 
 );

insert into 14PrimaryDepartmentForEachEmployee1789 values 
(1, 1, 'N'),
(2, 1, 'Y'),
(2, 2, 'N'),
(3, 3, 'N'),
(4, 2, 'N'),
(4, 3, 'Y'),
(4, 4, 'N');


mysql> select * from 14PrimaryDepartmentForEachEmployee1789;
+-------------+---------------+--------------+
| employee_id | department_id | primary_flag |
+-------------+---------------+--------------+
|           1 |             1 | N            |
|           2 |             1 | Y            |
|           2 |             2 | N            |
|           3 |             3 | N            |
|           4 |             2 | N            |
|           4 |             3 | Y            |
|           4 |             4 | N            |
+-------------+---------------+--------------+



--Employees can belong to multiple departments. When the employee joins other departments, 
--they need to decide which department is their primary department. 
--Note that when an employee belongs to only one department, their primary column is 'N'.
--Write a solution to report all the employees with their primary department. 
--For employees who belong to one department, report their only department.
--Return the result table in any order.


Select employee_id,
case when count(distinct department_id) = 1 then Max(department_id) 
else MAX(caSE WHEN primary_flag = 'Y' then department_id end) end as department_id
from 14PrimaryDepartmentForEachEmployee1789
group by employee_id


Output

+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
|           1 |             1 |
|           2 |             1 |
|           3 |             3 |
|           4 |             3 |
+-------------+---------------+



--------------------------------------------------------------------------


