--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1251 Average Selling Price

Create table if not exists 36AverageSellingPrice1251 (
    product_id int,
    start_date date,
    end_date date,
    prcie int,
    Primary Key (product_id, start_date, end_date)
);


insert into  36AverageSellingPrice1251 values
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30)
;


mysql> select * from 36AverageSellingPrice1251;
+------------+------------+------------+-------+
| product_id | start_date | end_date   | prcie |
+------------+------------+------------+-------+
|          1 | 2019-02-17 | 2019-02-28 |     5 |
|          1 | 2019-03-01 | 2019-03-22 |    20 |
|          2 | 2019-02-01 | 2019-02-20 |    15 |
|          2 | 2019-02-21 | 2019-03-31 |    30 |
+------------+------------+------------+-------+
4 rows in set (0.00 sec)



Create Table if not exists 36_1UnitsSold1251 (
    product_id int,
    purchase_date date,
    units int
);

Insert into 36_1UnitsSold1251 values
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);


mysql> select * from 36_1UnitsSold1251;
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


select a.product_id,
Ifnull(round(sum(b.units*a.prcie)/ sum(b.units),2),0) as average_price
from 36AverageSellingPrice1251 a
left join 36_1UnitsSold1251 b
on a.product_id = b.product_id
AND b.purchase_date BETWEEN a.start_date and a.end_date
group by a.product_id



Output

+------------+---------------+
| product_id | average_price |
+------------+---------------+
|          1 |          6.96 |
|          2 |         16.96 |
+------------+---------------+
2 rows in set (0.03 sec)