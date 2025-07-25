--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 1693 Daily leads and Partners 

Create table if not exists 47DailyLeadsPartners1693(
    date_id date,
    make_name varchar(50),
    lead_id int,
    partner_id int
);

Insert into 47DailyLeadsPartners1693 values 
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


mysql> select * from 47DailyLeadsPartners1693;
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


Select date_id,make_name,
    count(DISTINCT lead_id) as lead_id,
    count(DISTINCT partner_id) as partner_id
from 47DailyLeadsPartners1693 
group by date_id, make_name;



Output 


+------------+-----------+---------+------------+
| date_id    | make_name | lead_id | partner_id |
+------------+-----------+---------+------------+
| 2020-12-07 | honda     |       3 |          2 |
| 2020-12-07 | toyota    |       1 |          2 |
| 2020-12-08 | honda     |       2 |          2 |
| 2020-12-08 | toyota    |       2 |          3 |
+------------+-----------+---------+------------+
4 rows in set (0.01 sec)

---------------------------------------------------------------------------------

use leetcode;


show tables;



Q. 1083 Sales analysis II


Create table if not exists 56SalesAnalysisII_1083(
    product_id int primary key,
    product_name varchar(50),
    unit_price int
);


insert into 56SalesAnalysisII_1083 values 
(1, 'S8', 1000),
(2, 'G4', 800),
(3, 'iPhone', 1400);



create table if not exists 56_1Sales1083(
    seller_id int,
    product_id int,
    buyer_id int,
    sale_date date,
    quantity int,
    price int,
    Foreign Key(product_id) References 56SalesAnalysisII_1083(product_id)
);


insert into 56_1Sales1083 values 
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1, 800),
(2, 2, 3, '2019-06-02', 1, 800),
(3, 3, 4, '2019-05-13', 2, 2800);



-- write an sql query that reports the buyer who have bought s8 but not iphone.
--Note that s8 and iphone are products present in the products table.
-- return the table in any order 

with cte as
(Select buyer_id,product_id
from 56_1Sales1083
group by buyer_id,product_id)
select a.buyer_id
from cte a
left join 56SalesAnalysisII_1083 b
on a.product_id = b.product_id
where b.product_name like 'S8'
and b.product_name not like 'iphone'
GROUP BY a.buyer_id;



Output 



+----------+
| buyer_id |
+----------+
|        1 |
+----------+
1 row in set (0.01 sec)