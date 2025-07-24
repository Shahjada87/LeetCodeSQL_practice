--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 610 Triangle Judgement

create table if not exists 46TriangleJudgement610(
    X int primary key,
    Y int,
    Z int
)


Insert into 46TriangleJudgement610 values 
(13,15,30),
(10,20,15);



mysql> select * from 46TriangleJudgement610;
+----+------+------+
| X  | Y    | Z    |
+----+------+------+
| 10 |   20 |   15 |
| 13 |   15 |   30 |
+----+------+------+
2 rows in set (0.00 sec)



--Report for every three line segments whether they can form a triangle.
--Return the result table in any order.


select *,
case when x + y > z AND Y + Z > x AND x + z > Y  then 'Yes'
    else 'No' END
as Triangle 
from 46TriangleJudgement610;


Output 


+----+------+------+----------+
| X  | Y    | Z    | Triangle |
+----+------+------+----------+
| 10 |   20 |   15 | Yes      |
| 13 |   15 |   30 | No       |
+----+------+------+----------+
2 rows in set (0.00 sec)


------------------------------------------------------------------------------------

use leetcode;

show tables;


Q. 1069 Product sales analysis II


Create table if not exists 53ProductSalesAnalysisII_1069(
    sales_id int,
    product_id int,
    year int,
    quantity int,
    price int,
    Primary Key(sales_id, product_id)
);


insert into 53ProductSalesAnalysisII_1069 values 
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);


mysql> select * from 53ProductSalesAnalysisII_1069;
+----------+------------+------+----------+-------+
| sales_id | product_id | year | quantity | price |
+----------+------------+------+----------+-------+
|        1 |        100 | 2008 |       10 |  5000 |
|        2 |        100 | 2009 |       12 |  5000 |
|        7 |        200 | 2011 |       15 |  9000 |
+----------+------------+------+----------+-------+
3 rows in set (0.00 sec)



Create table if not exists 53_1Product1069(
    product_id int primary key,
    product_name varchar(50)
);


insert into 53_1Product1069 values
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');



mysql> select * from 53_1Product1069;
+------------+--------------+
| product_id | product_name |
+------------+--------------+
|        100 | Nokia        |
|        200 | Apple        |
|        300 | Samsung      |
+------------+--------------+
3 rows in set (0.00 sec)


-- write an sql query to report the total quantity sold for every product id.

select a.product_id, sum(quantity) as total_quantity
from 53ProductSalesAnalysisII_1069 a
left join 53_1Product1069 b
on a.product_id = b.product_id
group by a.product_id;



Output 

+------------+----------------+
| product_id | total_quantity |
+------------+----------------+
|        100 |             22 |
|        200 |             15 |
+------------+----------------+
2 rows in set (0.02 sec)




------------------------------------------------------------------------------------


show tables;



Q. 1076 Project Employees II

create table if not exists 54ProjectEmployeesII_1076(
    project_id int,
    employee_id int,
    primary key (project_id, employee_id)
);


insert into 54ProjectEmployeesII_1076 values 
(1, 1),
(2, 3),
(2, 1),
(1, 2),
(4, 4);


mysql> select * from 54ProjectEmployeesII_1076;
+------------+-------------+
| project_id | employee_id |
+------------+-------------+
|          1 |           1 |
|          1 |           2 |
|          2 |           1 |
|          2 |           3 |
|          4 |           4 |
+------------+-------------+
5 rows in set (0.01 sec)



create table if not exists 54_1Employees1076(
    employee_id int primary key,
    name varchar(50),
    experience_years int
);


insert into 54_1Employees1076 values 
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);


mysql> Select * from 54_1Employees1076;
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
|           1 | Khaled |                3 |
|           2 | Ali    |                2 |
|           3 | John   |                1 |
|           4 | Doe    |                2 |
+-------------+--------+------------------+
4 rows in set (0.00 sec)



-- write an sql query that reports all the project that have the most employees 


with cte as 
(Select a.project_id, count(a.employee_id) as count
From 54ProjectEmployeesII_1076 a
left join 54_1Employees1076 b
on a.employee_id = b.employee_id
GROUP BY a.project_id)
select cte.project_id
from cte 
where cte.count = (select Max(cte.count) from cte)



Output 

+------------+
| project_id |
+------------+
|          1 |
|          2 |
+------------+
2 rows in set (0.01 sec)

---------------------------------------------------------------------------------------



