--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1633 Percentage of Users Attended a Contest

Create table if not exists 66PercentOfUsersAttendContest1633(
    user_id int Primary Key,
    user_name varchar(50)
);

insert into 66PercentOfUsersAttendContest1633 values
(6, 'Alice'),
(2, 'Bob'),
(7, 'Alex');


mysql> select * from 66PercentOfUsersAttendContest1633;
+---------+-----------+
| user_id | user_name |
+---------+-----------+
|       2 | Bob       |
|       6 | Alice     |
|       7 | Alex      |
+---------+-----------+
3 rows in set (0.01 sec)


create table if not exists 66_1Register1633(
    contest_id int,
    user_id int,
    Primary key (contest_id, user_id)
);

insert into 66_1Register1633 values
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

mysql> select * from 66_1Register1633;
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
12 rows in set (0.00 sec)




--Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
--Return the result table ordered by percentage in descending order. 
--In case of a tie, order it by contest_id in ascending order.

select contest_id, 
round(count(distinct user_id) * 100 /(select count(user_id) from 66_1Register1633) ,2) as percentage,
count(user_id)
from 66_1Register1633 
group by contest_id
order by percentage desc;



Output


+------------+------------+----------------+
| contest_id | percentage | count(user_id) |
+------------+------------+----------------+
|        208 |      25.00 |              3 |
|        209 |      25.00 |              3 |
|        210 |      25.00 |              3 |
|        215 |      16.67 |              2 |
|        207 |       8.33 |              1 |
+------------+------------+----------------+
5 rows in set (0.01 sec)