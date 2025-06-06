--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1633 Percentage of Users Attended a Contest

create table if not exists 9PercentOfUsersAttendContest1633(
    user_id int primary key,
    user_name varchar(50)
);

insert into 9PercentOfUsersAttendContest1633 values
(6, 'Alice'),
(2, 'Bob'),
(7, 'Alex');

mysql> select * from 9PercentOfUsersAttendContest1633;
+---------+-----------+
| user_id | user_name |
+---------+-----------+
|       2 | Bob       |
|       6 | Alice     |
|       7 | Alex      |
+---------+-----------+


create table if not exists 9_1Register1633(
    contest_id int,
    user_id int,
    Primary Key (contest_id, user_id)
);

insert into 9_1Register1633 values 
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


mysql> select * from 9_1Register1633;
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
--Return the result table ordered by percentage in descending order. In case of a tie, 
--order it by contest_id in ascending order.

select b.contest_id, 
       Round((COUNT(b.user_id) * 100.0) / (select COUNT(*) from 9PercentOfUsersAttendContest1633), 2) as percentage
from 9_1Register1633 b
group by b.contest_id
order by percentage desc, b.contest_id asc;


--------------------------------------------------------------------------

Use leetcode;

show tables;

Q. 3436 Find valid emails 

create table if not exists 44FIndValidEmails3436(
    user_id int primary key,
    email varchar(100)
)


insert into 44FIndValidEmails3436 values 
(1, 'alice@example.com'),
(2, 'bob_at_example.com'),
(3, 'charlie@example.net'),
(4, 'david@domain.com'),
(5, 'eve@invalid');

mysql> select * from 44FIndValidEmails3436;
+---------+---------------------+
| user_id | email               |
+---------+---------------------+
|       1 | alice@example.com   |
|       2 | bob_at_example.com  |
|       3 | charlie@example.net |
|       4 | david@domain.com    |
|       5 | eve@invalid         |
+---------+---------------------+


--Write a solution to find all the valid email addresses. A valid email address meets the following criteria:
--It contains exactly one @ symbol.
--It ends with .com.
--The part before the @ symbol contains only alphanumeric characters and underscores.
--The part after the @ symbol and before .com contains a domain name that contains only letters.
--Return the result table ordered by user_id in ascending order.


select user_id,email 
from 44FIndValidEmails3436
where email REGEXP '^[a-zA-Z0-9_]+@[a-zA-Z]+.com$'
order by user_id asc;


Output 

+---------+-------------------+
| user_id | email             |
+---------+-------------------+
|       1 | alice@example.com |
|       4 | david@domain.com  |
+---------+-------------------+



--------------------------------------------------------------------------



