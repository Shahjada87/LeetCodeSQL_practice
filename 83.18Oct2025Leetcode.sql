--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1890 The latest login in 2020


create table if not exists 74The2020LatestLogin1890(
    user_id int,
    timeStamp datetime,
    Primary key (user_id, timeStamp)
);


insert into 74The2020LatestLogin1890 values 
(6, '2020-06-30 15:06:07'),
(6, '2021-04-21 14:06:06'),
(6, '2019-03-07 00:18:15'),
(8, '2020-02-01 05:10:53'),
(8, '2020-12-30 00:46:50'),
(2, '2020-01-16 02:49:50'),
(2, '2019-08-25 07:59:08'),
(14, '2019-07-14 09:00:00'),
(14, '2021-01-06 11:59:59');


mysql> select * from 74The2020LatestLogin1890;
+---------+---------------------+
| user_id | timeStamp           |
+---------+---------------------+
|       2 | 2019-08-25 07:59:08 |
|       2 | 2020-01-16 02:49:50 |
|       6 | 2019-03-07 00:18:15 |
|       6 | 2020-06-30 15:06:07 |
|       6 | 2021-04-21 14:06:06 |
|       8 | 2020-02-01 05:10:53 |
|       8 | 2020-12-30 00:46:50 |
|      14 | 2019-07-14 09:00:00 |
|      14 | 2021-01-06 11:59:59 |
+---------+---------------------+
9 rows in set (0.00 sec)


--Write a solution to report the latest login for all users in the year 2020. 
--Do not include the users who did not login in 2020.
--Return the result table in any order.


select user_id, max(timeStamp) as latest_login_date
from 74The2020LatestLogin1890
where YEAR(timeStamp) = 2020
GROUP BY user_id;


Output 



+---------+---------------------+
| user_id | latest_login_date   |
+---------+---------------------+
|       2 | 2020-01-16 02:49:50 |
|       6 | 2020-06-30 15:06:07 |
|       8 | 2020-12-30 00:46:50 |
+---------+---------------------+
3 rows in set (0.02 sec)
