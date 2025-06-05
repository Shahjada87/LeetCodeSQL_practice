--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1327 List the Products Ordered in a Period


Create table if not exists 8ListingProductsOrderedInAPeriod1327(
    product_id int primary key,
    product_name varchar(50),
    product_category varchar(50)
);

insert into 8ListingProductsOrderedInAPeriod1327 values 
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');


mysql> select * from 8ListingProductsOrderedInAPeriod1327;
+------------+-----------------------+------------------+
| product_id | product_name          | product_category |
+------------+-----------------------+------------------+
|          1 | Leetcode Solutions    | Book             |
|          2 | Jewels of Stringology | Book             |
|          3 | HP                    | Laptop           |
|          4 | Lenovo                | Laptop           |
|          5 | Leetcode Kit          | T-shirt          |
+------------+-----------------------+------------------+


create table if not exists 8_1orders1327(
    product_id int,
    order_date date,
    unit int,
    Foreign Key (product_id) REFERENCES 8ListingProductsOrderedInAPeriod1327(product_id)
);

insert into 8_1orders1327 values 
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);


mysql> select * from 8_1orders1327;
+------------+------------+------+
| product_id | order_date | unit |
+------------+------------+------+
|          1 | 2020-02-05 |   60 |
|          1 | 2020-02-10 |   70 |
|          2 | 2020-01-18 |   30 |
|          2 | 2020-02-11 |   80 |
|          3 | 2020-02-17 |    2 |
|          3 | 2020-02-24 |    3 |
|          4 | 2020-03-01 |   20 |
|          4 | 2020-03-04 |   30 |
|          4 | 2020-03-04 |   60 |
|          5 | 2020-02-25 |   50 |
|          5 | 2020-02-27 |   50 |
|          5 | 2020-03-01 |   50 |
+------------+------------+------+


--Write a solution to get the names of products that have at least 100 units ordered 
--in February 2020 and their amount.
--Return the result table in any order.


with cte as 
(select product_id, sum(unit) as total_unit
from 8_1orders1327
where MONTH(order_date) = 2 AND YEAR(order_date) = 2020
group by product_id)
Select b.product_name, a.total_unit 
from cte a
left join 8ListingProductsOrderedInAPeriod1327 b
on a.product_id = b.product_id
where total_unit >= 100;


Output

+--------------------+------------+
| product_name       | total_unit |
+--------------------+------------+
| Leetcode Solutions |        130 |
| Leetcode Kit       |        100 |
+--------------------+------------+


--------------------------------------------------------------------------

Q. 1795 Rearrange products table

create table if not exists 39RearrangeProductsTable1795(
    product_id int primary key,
    store1 int,
    store2 int,
    store3 int
)

insert into 39RearrangeProductsTable1795 values 
(0,95,100,105),
(1,70,null,80);

mysql> select * from 39RearrangeProductsTable1795;
+------------+--------+--------+--------+
| product_id | store1 | store2 | store3 |
+------------+--------+--------+--------+
|          0 |     95 |    100 |    105 |
|          1 |     70 |   NULL |     80 |
+------------+--------+--------+--------+
2 rows in set (0.00 sec)


--Write a solution to rearrange the Products table so that each row has (product_id, store, price). 
--If a product is not available in a store, do not include a row with that product_id and 
--store combination in the result table.
--Return the result table in any order.


SELECT product_id, 'store1' AS store, store1 AS price 
FROM 39RearrangeProductsTable1795 
WHERE store1 IS NOT NULL
UNION 
SELECT product_id, 'store2' AS store, store2 AS price 
FROM 39RearrangeProductsTable1795 
WHERE store2 IS NOT NULL
UNION 
SELECT product_id, 'store3' AS store, store3 AS price 
FROM 39RearrangeProductsTable1795 
WHERE store3 IS NOT NULL


Output

+------------+--------+-------+
| product_id | store  | price |
+------------+--------+-------+
|          0 | store1 |    95 |
|          1 | store1 |    70 |
|          0 | store2 |   100 |
|          0 | store3 |   105 |
|          1 | store3 |    80 |
+------------+--------+-------+

--------------------------------------------------------------------------

use leetcode;

show tables;


Q. 1873 Calculate special bonus

Create table if not exists 40CalculateSpecialBonus1873(
    employee_id int primary key,
    name varchar(50),
    salary int
);

insert into 40CalculateSpecialBonus1873 values
(2, 'Meir', 3000),
(3, 'Michael', 3800),
(7, 'Addilyn', 7400),
(8, 'Juan', 6100),
(9, 'Kannon', 7700);

mysql> select * from 40CalculateSpecialBonus1873;
+-------------+---------+--------+
| employee_id | name    | salary |
+-------------+---------+--------+
|           2 | Meir    |   3000 |
|           3 | Michael |   3800 |
|           7 | Addilyn |   7400 |
|           8 | Juan    |   6100 |
|           9 | Kannon  |   7700 |
+-------------+---------+--------+


--Write a solution to calculate the bonus of each employee. 
--The bonus of an employee is 100% of their salary if the ID of the employee is an odd number
--and the employee's name does not start with the character 'M'. The bonus of an employee is 0 otherwise.
--Return the result table ordered by employee_id.

Select employee_id, 
case when employee_id % 2 != 0 AND name not like 'M%' then salary 
else 0 end as bonus 
from 40CalculateSpecialBonus1873
order by employee_id;

Output 

+-------------+-------+
| employee_id | bonus |
+-------------+-------+
|           2 |     0 |
|           3 |     0 |
|           7 |  7400 |
|           8 |     0 |
|           9 |  7700 |
+-------------+-------+


--------------------------------------------------------------------------

Q. 1890 The latest login in 2020

create table if not exists 41LatestLoginIn2020year1890(
    user_id int,
    time_stamp date,
    Primary Key (user_id,time_stamp)
)

Alter table 41LatestLoginIn2020year1890 
modify column time_stamp datetime;

Delete from 41LatestLoginIn2020year1890;


Insert into 41LatestLoginIn2020year1890 values 
(6, '2020-06-30 15:06:07'),
(6, '2021-04-21 14:06:06'),
(6, '2019-03-07 00:18:15'),
(8, '2020-02-01 05:10:53'),
(8, '2020-12-30 00:46:50'),
(2, '2020-01-16 02:49:50'),
(2, '2019-08-25 07:59:08'),
(14, '2019-07-14 09:00:00'),
(14, '2021-01-06 11:59:59');


mysql> select * from 41LatestLoginIn2020year1890;
+---------+---------------------+
| user_id | time_stamp          |
+---------+---------------------+
|       2 | 2019-08-25 07:59:08 |
|       2 | 2020-01-16 02:49:50 |
|       6 | 2019-03-07 00:18:15 |
|       6 | 2020-06-30 15:06:07 |
|       6 | 2021-04-21 14:06:06 |
|       8 | 2020-02-01 05:10:53 |
|       8 | 2020-12-30 00:46:50 |
|      14 | 2019-07-14 09:00:00 |
|      14 | 2021-01-06 11:59:59 |
+---------+---------------------+


--Write a solution to report the latest login for all users in the year 2020. 
--Do not include the users who did not login in 2020.
--Return the result table in any order.

select user_id, max(time_stamp) as last_stamp
from 41LatestLoginIn2020year1890 
where year(time_stamp) = 2020
GROUP BY user_id;


Output

+---------+---------------------+
| user_id | last_stamp          |
+---------+---------------------+
|       2 | 2020-01-16 02:49:50 |
|       6 | 2020-06-30 15:06:07 |
|       8 | 2020-12-30 00:46:50 |
+---------+---------------------+

