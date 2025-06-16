--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1068 Product sales analysis I

Create table if not exists 16ProductSalesAnalysis1068(
    sales_id int,
    product_id int,
    year int,
    quantity int,
    price int,
    Primary key (sales_id, year)
);

insert into 16ProductSalesAnalysis1068 values 
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);


mysql> select * from 16ProductSalesAnalysis1068;
+----------+------------+------+----------+-------+
| sales_id | product_id | year | quantity | price |
+----------+------------+------+----------+-------+
|        1 |        100 | 2008 |       10 |  5000 |
|        2 |        100 | 2009 |       12 |  5000 |
|        7 |        200 | 2011 |       15 |  9000 |
+----------+------------+------+----------+-------+


create table if not exists 16_1Product1068(
    product_id int primary key,
    product_name varchar(50)
);


Insert into 16_1Product1068 values 
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

mysql> select * from 16_1Product1068;
+------------+--------------+
| product_id | product_name |
+------------+--------------+
|        100 | Nokia        |
|        200 | Apple        |
|        300 | Samsung      |
+------------+--------------+


--Write a solution to report the product_name, year, and price 
--for each sale_id in the Sales table.
--Return the resulting table in any order.



Select b.product_name, a.year, a.price
from 16ProductSalesAnalysis1068 a
left join 16_1Product1068 b
on a.product_id = b.product_id


Output

+--------------+------+-------+
| product_name | year | price |
+--------------+------+-------+
| Nokia        | 2008 |  5000 |
| Nokia        | 2009 |  5000 |
| Apple        | 2011 |  9000 |
+--------------+------+-------+


--------------------------------------------------------------------------



