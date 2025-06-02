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