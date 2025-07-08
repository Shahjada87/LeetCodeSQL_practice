--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 1084 Sales Analysis III

create table if not exists 31SalesAnalysisIII1084(
    product_id int primary key,
    Product_name varchar(50),
    unit_price int
);


insert into 31SalesAnalysisIII1084 values 
(1,'S8',1000),
(2,'G4',800),
(3,'iPhone',1400);

mysql> select * from 31SalesAnalysisIII1084;
+------------+--------------+------------+
| product_id | Product_name | unit_price |
+------------+--------------+------------+
|          1 | S8           |       1000 |
|          2 | G4           |        800 |
|          3 | iPhone       |       1400 |
+------------+--------------+------------+
3 rows in set (0.01 sec)



create table if not exists 31_1Sales1084(
    seller_id int,
    product_id int,
    buyer_id int,
    seller_date date,
    quantity int,
    price int,
    Foreign Key (product_id) REFERENCES 31SalesAnalysisIII1084(product_id)
);


insert into 31_1Sales1084 values 
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1, 800),
(2, 2, 3, '2019-06-02', 1, 800),
(3, 3, 4, '2019-05-13', 1, 2800);


mysql> select * from 31_1Sales1084;
+-----------+------------+----------+-------------+----------+-------+
| seller_id | product_id | buyer_id | seller_date | quantity | price |
+-----------+------------+----------+-------------+----------+-------+
|         1 |          1 |        1 | 2019-01-21  |        2 |  2000 |
|         1 |          2 |        2 | 2019-02-17  |        1 |   800 |
|         2 |          2 |        3 | 2019-06-02  |        1 |   800 |
|         3 |          3 |        4 | 2019-05-13  |        1 |  2800 |
+-----------+------------+----------+-------------+----------+-------+
4 rows in set (0.01 sec)


--Write a solution to report the products that were only sold in the first quarter of 2019. 
--That is, between 2019-01-01 and 2019-03-31 inclusive.
--Return the result table in any order.

select a.product_id, a.product_name
from 31SalesAnalysisIII1084 a 
left join 31_1Sales1084 b
on a.product_id = b.product_id
group by a.product_id
having min(seller_date) >= '2019-01-01' AND MAX(seller_date) <= '2019-03-31';

Output

+------------+--------------+
| product_id | product_name |
+------------+--------------+
|          1 | S8           |
+------------+--------------+
1 row in set (0.03 sec)