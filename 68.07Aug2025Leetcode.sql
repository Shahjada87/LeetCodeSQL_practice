--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q.1581 Customer Who Visited but Did Not Make Any Transactions


create table if not exists 59CustomerDidNotMakeTransactions1581(
    visit_id int primary key,
    customer_id int
);

insert into 59CustomerDidNotMakeTransactions1581 values 
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);


mysql> select * from 59CustomerDidNotMakeTransactions1581;
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
7 rows in set (0.00 sec)



create table if not exists 59_1Transactions1581(
    transaction_id int primary key,
    visit_id int,
    amount int
);


insert into 59_1Transactions1581 VALUES
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);


mysql> select * from 59_1Transactions1581;
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


--Write a solution to find the IDs of the users who visited without making any transactions and 
--the number of times they made these types of visits.
--Return the result table sorted in any order.

Select a.customer_id, count(*) as count_no_trans
from 59CustomerDidNotMakeTransactions1581 a
left join 59_1Transactions1581 b
on a.visit_id = b.visit_id
where b.amount is null
group by a.customer_id;


Output

+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
|          30 |              1 |
|          96 |              1 |
|          54 |              2 |
+-------------+----------------+
3 rows in set (0.02 sec)