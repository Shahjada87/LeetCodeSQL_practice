--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q.1068 Product sales analysis I

Create table if not exists 5ProductSalesAnalysisI1068(
    sales_id int,
    product_id int,
    year int,
    quantity int,
    price int,
    Primary key (sales_id, year)
);

insert into 5ProductSalesAnalysisI1068 values
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

Select * from 5ProductSalesAnalysisI1068;

mysql> Select * from 5ProductSalesAnalysisI1068;
+----------+------------+------+----------+-------+
| sales_id | product_id | year | quantity | price |
+----------+------------+------+----------+-------+
|        1 |        100 | 2008 |       10 |  5000 |
|        2 |        100 | 2009 |       12 |  5000 |
|        7 |        200 | 2011 |       15 |  9000 |
+----------+------------+------+----------+-------+


create table if not exists 5Product1068(
    Product_id int,
    product_name VARCHAR(50),
    Primary Key (Product_id),
    Foreign Key (Product_id) references 5ProductSalesAnalysisI1068(product_id)
)

insert into 5Product1068 values 
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

mysql> Select * from 5Product1068;
+------------+--------------+
| Product_id | product_name |
+------------+--------------+
|        100 | Nokia        |
|        200 | Apple        |
|        300 | Samsung      |
+------------+--------------+



--Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
--Return the resulting table in any order.

Select s.product_name , p.year, p.price
from 5ProductSalesAnalysisI1068 p
left join 5Product1068 s
on p.product_id = s.product_id;


Output

+--------------+------+-------+
| product_name | year | price |
+--------------+------+-------+
| Nokia        | 2008 |  5000 |
| Nokia        | 2009 |  5000 |
| Apple        | 2011 |  9000 |
+--------------+------+-------+
3 rows in set (0.01 sec)

--------------------------------------------------------------------------

Use leetcode;

show tables;


Q.1667 Fix names in a TABLE

create table if not exists 32FixNamesInTable1667(
    user_id int Primary key,
    name varchar(50)
);


Insert into 32FixNamesInTable1667 VALUES
(1,"shahjada"),
(2,"suMaiya"),
(3,"abdur");

mysql> select * from 32FixNamesInTable1667;
+---------+----------+
| user_id | name     |
+---------+----------+
|       1 | shahjada |
|       2 | suMaiya  |
|       3 | abdur    |
+---------+----------+

--Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
--Return the result table ordered by user_id.

SELECT user_id, CONCAT(
    UPPER(LEFT(name, 1)),
    LOWER(SUBSTRING(name, 2))
) AS name
FROM 32FixNamesInTable1667;

Output

+---------+----------+
| user_id | name     |
+---------+----------+
|       1 | Shahjada |
|       2 | Sumaiya  |
|       3 | Abdur    |
+---------+----------+
3 rows in set (0.03 sec)

--------------------------------------------------------------------------


Q.1693 Daily leads and Partners 

Create table if not exists 33DailyLeadsPartners1693(
    date_id date,
    make_name varchar(50),
    lead_id int,
    partner_id int
);

Insert into 33DailyLeadsPartners1693 values 
('2020-12-08', 'toyota', 0, 1),
('2020-12-08', 'toyota', 1, 0),
('2020-12-08', 'toyota', 1, 2),
('2020-12-07', 'toyota', 0, 2),
('2020-12-07', 'toyota', 0, 1),
('2020-12-08', 'honda', 1, 2),
('2020-12-08', 'honda', 2, 1),
('2020-12-07', 'honda', 0, 1),
('2020-12-07', 'honda', 1, 2),
('2020-12-07', 'honda', 2, 1);

mysql> select * from 33DailyLeadsPartners1693;
+------------+-----------+---------+------------+
| date_id    | make_name | lead_id | partner_id |
+------------+-----------+---------+------------+
| 2020-12-08 | toyota    |       0 |          1 |
| 2020-12-08 | toyota    |       1 |          0 |
| 2020-12-08 | toyota    |       1 |          2 |
| 2020-12-07 | toyota    |       0 |          2 |
| 2020-12-07 | toyota    |       0 |          1 |
| 2020-12-08 | honda     |       1 |          2 |
| 2020-12-08 | honda     |       2 |          1 |
| 2020-12-07 | honda     |       0 |          1 |
| 2020-12-07 | honda     |       1 |          2 |
| 2020-12-07 | honda     |       2 |          1 |
+------------+-----------+---------+------------+
10 rows in set (0.00 sec)


--For each date_id and make_name, find the number of distinct lead_id's and distinct partner_id's.
--Return the result table in any order.


SELECT date_id, make_name, 
       COUNT(DISTINCT lead_id) AS unique_leads, 
       COUNT(DISTINCT partner_id) AS unique_partners
FROM 33DailyLeadsPartners1693
GROUP BY date_id, make_name;

Output

+------------+-----------+--------------+-----------------+
| date_id    | make_name | unique_leads | unique_partners |
+------------+-----------+--------------+-----------------+
| 2020-12-07 | honda     |            3 |               2 |
| 2020-12-07 | toyota    |            1 |               2 |
| 2020-12-08 | honda     |            2 |               2 |
| 2020-12-08 | toyota    |            2 |               3 |
+------------+-----------+--------------+-----------------+
4 rows in set (0.01 sec)

