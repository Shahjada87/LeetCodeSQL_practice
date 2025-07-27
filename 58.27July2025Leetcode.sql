--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 1581 Customer Who Visited but Did Not Make Any Transactions

create table if not exists 49CustomerVisitedButDidNotMakeTrasanction1581(
    visit_id int Primary Key,
    customer_id int
);

insert into 49CustomerVisitedButDidNotMakeTrasanction1581 values
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);


mysql> select * from 49CustomerVisitedButDidNotMakeTrasanction1581;
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
|        1 |          23 |
|        2 |           9 |
|        4 |          30 |
|        5 |          54 |
|        6 |          96 |
|        7 |          54 |
|        8 |          54 |
+----------+-------------+
7 rows in set (0.01 sec)




create table if not exists 49_1Transactions1581(
    transaction_id int Primary key,
    visit_id int,
    amount int
);


insert into 49_1Transactions1581 values 
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);


mysql> select * from 49_1Transactions1581;
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
|              2 |        5 |    310 |
|              3 |        5 |    300 |
|              9 |        5 |    200 |
|             12 |        1 |    910 |
|             13 |        2 |    970 |
+----------------+----------+--------+
5 rows in set (0.00 sec)



-- Write a solution to find the IDs of the users who visited 
-- without making any transactions and the number of times they made these types of visits.
-- Return the result table sorted in any order.


select customer_id, count(*) as Number_of_times_no_trnas
from 49CustomerVisitedButDidNotMakeTrasanction1581 a
left join 49_1Transactions1581 b
on a.visit_id = b.visit_id
where transaction_id is Null
GROUP BY a.customer_id;



+-------------+--------------------------+
| customer_id | Number_of_times_no_trnas |
+-------------+--------------------------+
|          30 |                        1 |
|          96 |                        1 |
|          54 |                        2 |
+-------------+--------------------------+
3 rows in set (0.01 sec)