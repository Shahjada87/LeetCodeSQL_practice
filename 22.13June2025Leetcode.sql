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



Q. 1581 Customer Who Visited but Did Not Make Any Transactions

create table if not exists 15CustomerVsistedButDidNotMakeTransactions1581(
    visitor_id int primary key,
    customer_id int
);


insert into 15CustomerVsistedButDidNotMakeTransactions1581 values 
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);

mysql> select * from 15CustomerVsistedButDidNotMakeTransactions1581;
+------------+-------------+
| visitor_id | customer_id |
+------------+-------------+
|          1 |          23 |
|          2 |           9 |
|          4 |          30 |
|          5 |          54 |
|          6 |          96 |
|          7 |          54 |
|          8 |          54 |
+------------+-------------+



create table if not exists 15_1Transactions1581(
    transaction_id int primary key,
    visit_id int,
    amount int
)

insert into 15_1Transactions1581 values 
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);

mysql> select * from 15_1Transactions1581;
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
|              2 |        5 |    310 |
|              3 |        5 |    300 |
|              9 |        5 |    200 |
|             12 |        1 |    910 |
|             13 |        2 |    970 |
+----------------+----------+--------+


--Write a solution to find the IDs of the users who visited without making any transactions and 
--the number of times they made these types of visits.
--Return the result table sorted in any order.

Select a.customer_id, count(a.visitor_id) as count_no_trans
from 15CustomerVsistedButDidNotMakeTransactions1581 a
left join 15_1Transactions1581 b
on a.visitor_id = b.visit_id
where b.transaction_id IS NULL
group by a.customer_id;


Output

+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
|          30 |              1 |
|          96 |              1 |
|          54 |              2 |
+-------------+----------------+


