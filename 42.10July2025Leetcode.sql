--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1251 Average Selling Price


create table if not exists 33AverageSellingPrice1251(
    product_id int,
    start_date date,
    end_date date,
    price int,
    Primary Key (product_id, start_date, end_date)
);


insert into 33AverageSellingPrice1251 values 
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

mysql> select * from 33AverageSellingPrice1251;
+------------+------------+------------+-------+
| product_id | start_date | end_date   | price |
+------------+------------+------------+-------+
|          1 | 2019-02-17 | 2019-02-28 |     5 |
|          1 | 2019-03-01 | 2019-03-22 |    20 |
|          2 | 2019-02-01 | 2019-02-20 |    15 |
|          2 | 2019-02-21 | 2019-03-31 |    30 |
+------------+------------+------------+-------+
4 rows in set (0.02 sec)



create table if not exists 33_1UnitsSold1251(
    product_id int,
    purchase_date date,
    units int
);

insert into 33_1UnitsSold1251 values
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);


mysql> select * from 33_1UnitsSold1251;
+------------+---------------+-------+
| product_id | purchase_date | units |
+------------+---------------+-------+
|          1 | 2019-02-25    |   100 |
|          1 | 2019-03-01    |    15 |
|          2 | 2019-02-10    |   200 |
|          2 | 2019-03-22    |    30 |
+------------+---------------+-------+
4 rows in set (0.01 sec)


--Write a solution to find the average selling price for each product. 
--average_price should be rounded to 2 decimal places. 
--If a product does not have any sold units, its average selling price is assumed to be 0.
--Return the result table in any order.

Select a.product_id, Ifnull(Round(Sum(b.units * a.price) / sum(b.units),2),0) as average_price
from 33AverageSellingPrice1251 a
left join 33_1UnitsSold1251 b
on a.product_id = b.product_id
AND purchase_date BETWEEN a.start_date and a.end_date
group by a.product_id


Output

+------------+---------------+
| product_id | average_price |
+------------+---------------+
|          1 |          6.96 |
|          2 |         16.96 |
+------------+---------------+
2 rows in set (0.02 sec)


-----------------------------------------------------------------------------------------------


Q.1327 List the Products Ordered in a Period

create table if not exists 34ProductsOrderedInAPeriod1327(
    product_id int primary key,
    product_name varchar(50),
    product_category varchar(200)
);


insert into 34ProductsOrderedInAPeriod1327 values
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');


mysql> select * from 34ProductsOrderedInAPeriod1327;
+------------+-----------------------+------------------+
| product_id | product_name          | product_category |
+------------+-----------------------+------------------+
|          1 | Leetcode Solutions    | Book             |
|          2 | Jewels of Stringology | Book             |
|          3 | HP                    | Laptop           |
|          4 | Lenovo                | Laptop           |
|          5 | Leetcode Kit          | T-shirt          |
+------------+-----------------------+------------------+
5 rows in set (0.00 sec)


create table if not exists 34_1Orders1327(
    product_id int,
    order_date date,
    unit int,
    Foreign key (product_id) references 34ProductsOrderedInAPeriod1327(product_id)
);

insert into 34_1Orders1327 values
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



mysql> select * from 34_1Orders1327;
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
12 rows in set (0.01 sec)



--Write a solution to get the names of products that have at least 100 units 
--ordered in February 2020 and their amount.
--Return the result table in any order.


with cte as 
(select product_id, sum(unit) as unit
from 34_1Orders1327
where Year(order_date) = 2020
AND MONTH(order_date) = 02
group by product_id)
select a.product_name, b.unit
from 34ProductsOrderedInAPeriod1327 a
left join cte b
on a.product_id = b.product_id
where b.unit >= 100


Output 


+--------------------+------+
| product_name       | unit |
+--------------------+------+
| Leetcode Solutions |  130 |
| Leetcode Kit       |  100 |
+--------------------+------+
2 rows in set (0.07 sec)