--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 607 Sales Person

Create table 26SalesPerson607(
    sales_id int primary key,
    name varchar(50),
    salary int,
    comission_rate int,
    hire_date date
);

insert into 26SalesPerson607 values 
(1, 'John', 100000, 6, '2006-04-01'),
(2, 'Amy', 12000, 5, '2010-05-01'),
(3, 'Mark', 65000, 12, '2008-12-25'),
(4, 'Pam', 25000, 25, '2005-01-01'),
(5, 'Alex', 5000, 10, '2007-02-03');


mysql> select * from 26salesperson607;
+----------+------+--------+----------------+------------+
| sales_id | name | salary | comission_rate | hire_date  |
+----------+------+--------+----------------+------------+
|        1 | John | 100000 |              6 | 2006-04-01 |
|        2 | Amy  |  12000 |              5 | 2010-05-01 |
|        3 | Mark |  65000 |             12 | 2008-12-25 |
|        4 | Pam  |  25000 |             25 | 2005-01-01 |
|        5 | Alex |   5000 |             10 | 2007-02-03 |
+----------+------+--------+----------------+------------+
5 rows in set (0.00 sec)


create table 26_1Company607(
    com_id int PRIMARY KEY,
    name varchar(50),
    city VARCHAR(50)
);


insert into 26_1Company607 VALUES
(1, 'RED', 'Boston'),
(2, 'ORANGE', 'New York'),
(3, 'YELLOW', 'Boston'),
(4, 'GREEN', 'Austin');


mysql> select * from 26_1Company607;
+--------+--------+----------+
| com_id | name   | city     |
+--------+--------+----------+
|      1 | RED    | Boston   |
|      2 | ORANGE | New York |
|      3 | YELLOW | Boston   |
|      4 | GREEN  | Austin   |
+--------+--------+----------+
4 rows in set (0.01 sec)


create table if not exists 26_2Orders607(
    order_id int primary key,
    order_date date,
    com_id int,
    sales_id int,
    amount int,
    Foreign Key (com_id) REFERENCES 26_1Company607(com_id),
    Foreign Key (sales_id) REFERENCES 26SalesPerson607(sales_id)
);


insert into 26_2Orders607 values
(1, '2014-01-01', 3, 4, 10000),
(2, '2014-02-01', 4, 5, 5000),
(3, '2014-03-01', 1, 1, 50000),
(4, '2014-04-01', 1, 4, 25000);


mysql> select * from 26_2Orders607;
+----------+------------+--------+----------+--------+
| order_id | order_date | com_id | sales_id | amount |
+----------+------------+--------+----------+--------+
|        1 | 2014-01-01 |      3 |        4 |  10000 |
|        2 | 2014-02-01 |      4 |        5 |   5000 |
|        3 | 2014-03-01 |      1 |        1 |  50000 |
|        4 | 2014-04-01 |      1 |        4 |  25000 |
+----------+------------+--------+----------+--------+
4 rows in set (0.00 sec)


--Write a solution to find the names of all the salespersons who did not have any orders 
--related to the company with the name "RED".
--Return the result table in any order.

with cte as 
(select a.sales_id
from 26_2Orders607 a
left join 26_1Company607 b
on a.com_id = b.com_id
where b.name like 'RED')
Select name 
from 26salesperson607 
where sales_id not in (select sales_id from cte);


Output 

+------+
| name |
+------+
| Amy  |
| Mark |
| Alex |
+------+
3 rows in set (0.01 sec)