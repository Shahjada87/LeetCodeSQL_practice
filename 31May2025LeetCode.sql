--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

show tables;
Q.1148 Article Views I

create table if not exists 3ArticleViewsI(
    article_id int,
    author_id int,
    viewer_id int,
    viewer_date date
)


insert into 3ArticleViewsI values 
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');

mysql> Select * from 3ArticleViewsI;
+------------+-----------+-----------+-------------+
| article_id | author_id | viewer_id | viewer_date |
+------------+-----------+-----------+-------------+
|          1 |         3 |         5 | 2019-08-01  |
|          1 |         3 |         6 | 2019-08-02  |
|          2 |         7 |         7 | 2019-08-01  |
|          2 |         7 |         6 | 2019-08-02  |
|          4 |         7 |         1 | 2019-07-22  |
|          3 |         4 |         4 | 2019-07-21  |
|          3 |         4 |         4 | 2019-07-21  |
+------------+-----------+-----------+-------------+


--Write a solution to find all the authors that viewed at least one of their own articles.

--Return the result table sorted by id in ascending order.

Select distinct a.author_id as id 
From 3ArticleViewsI a
inner join 3ArticleViewsI b
on a.author_id = b.viewer_id
order by id;

Output

+------+
| id   |
+------+
|    4 |
|    7 |
+------+

--------------------------------------------------------------------------

Use leetcode;


Q. 1587. Bank Account Summary II

create table if not exists 30BankAccountSummaryII1587(
    account int Primary Key,
    name varchar(50)
);

insert into 30BankAccountSummaryII1587 values 
(900001, 'Alice'),
(900002, 'Bob'),
(900003, 'Charlie');


create table if not exists 30_1Transactions1587(
    trans_id int Primary key,
    account int,
    amount int,
    transaction_on date
);

insert into 30_1Transactions1587 values 
(1, 900001, 7000, '2020-08-01'),
(2, 900001, 7000, '2020-09-01'),
(3, 900001, -3000, '2020-09-02'),
(4, 900002, 1000, '2020-09-12'),
(5, 900003, 6000, '2020-08-07'),
(6, 900003, 6000, '2020-09-07'),
(7, 900003, -4000, '2020-09-11');

mysql> select * from 30BankAccountSummaryII1587;
+---------+---------+
| account | name    |
+---------+---------+
|  900001 | Alice   |
|  900002 | Bob     |
|  900003 | Charlie |
+---------+---------+
3 rows in set (0.00 sec)

mysql> select * from 30_1Transactions1587;
+----------+---------+--------+----------------+
| trans_id | account | amount | transaction_on |
+----------+---------+--------+----------------+
|        1 |  900001 |   7000 | 2020-08-01     |
|        2 |  900001 |   7000 | 2020-09-01     |
|        3 |  900001 |  -3000 | 2020-09-02     |
|        4 |  900002 |   1000 | 2020-09-12     |
|        5 |  900003 |   6000 | 2020-08-07     |
|        6 |  900003 |   6000 | 2020-09-07     |
|        7 |  900003 |  -4000 | 2020-09-11     |
+----------+---------+--------+----------------+



--Write a solution to report the name and balance of users with a balance higher than 10000. 
--The balance of an account is equal to the sum of the amounts of all transactions involving that account.
--Return the result table in any order.

Select a.name as name, sum(b.amount) as balance
from 30BankAccountSummaryII1587 a
left join 30_1Transactions1587 b
on a.account = b.account
group by a.name
having sum(b.amount) > 10000;


Output

+-------+---------+
| name  | balance |
+-------+---------+
| Alice |   11000 |
+-------+---------+


--------------------------------------------------------------------------



Q.1633 Percentage of Users Attended a Contest

Create table if not exists 31PercentOfUsersAttendContest1633(
    user_id int Primary Key,
    user_name varchar(50)
);

insert into 31PercentOfUsersAttendContest1633 values
(6, 'Alice'),
(2, 'Bob'),
(7, 'Alex');

create table if not exists 31_1Register1633(
    contest_id int,
    user_id int,
    Primary key (contest_id, user_id)
);

insert into 31_1Register1633 values
(215, 6),
(209, 2),
(208, 2),
(210, 6),
(208, 6),
(209, 7),
(209, 6),
(215, 7),
(208, 7),
(210, 2),
(207, 2),
(210, 7);


mysql> select * from 31PercentOfUsersAttendContest1633;
+---------+-----------+
| user_id | user_name |
+---------+-----------+
|       2 | Bob       |
|       6 | Alice     |
|       7 | Alex      |
+---------+-----------+
3 rows in set (0.00 sec)

mysql> Select * from 31_1Register1633;
+------------+---------+
| contest_id | user_id |
+------------+---------+
|        207 |       2 |
|        208 |       2 |
|        208 |       6 |
|        208 |       7 |
|        209 |       2 |
|        209 |       6 |
|        209 |       7 |
|        210 |       2 |
|        210 |       6 |
|        210 |       7 |
|        215 |       6 |
|        215 |       7 |
+------------+---------+


--Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
--Return the result table ordered by percentage in descending order. 
--In case of a tie, order it by contest_id in ascending order.

select 
contest_id, 
round(count(distinct user_id) * 100 /(select count(user_id) from 31PercentOfUsersAttendContest1633) ,2) as percentage
from  31_1Register1633
group by contest_id
order by percentage desc,contest_id;


Output

+------------+------------+
| contest_id | percentage |
+------------+------------+
|        208 |  100.00000 |
|        209 |  100.00000 |
|        210 |  100.00000 |
|        215 |   66.66667 |
|        207 |   33.33333 |
+------------+------------+