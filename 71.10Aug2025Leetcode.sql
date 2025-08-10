--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1890 The latest login in 2020

create table if not exists 62LatestLoginIn2020_1890(
    user_id int,
    time_stamp datetime,
    primary key (user_id, time_stamp)
);

insert into 62LatestLoginIn2020_1890 values
(6, '2020-06-30 15:06:07'),
(6, '2021-04-21 14:06:06'),
(6, '2019-03-07 00:18:15'),
(8, '2020-02-01 05:10:53'),
(8, '2020-12-30 00:46:50'),
(2, '2020-01-16 02:49:50'),
(2, '2019-08-25 07:59:08'),
(14, '2019-07-14 09:00:00'),
(14, '2021-01-06 11:59:59');



mysql> select * from 62LatestLoginIn2020_1890;
+---------+---------------------+
| user_id | time_stamp          |
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


-- Write a solution to report the latest login for all users in the year 2020. 
-- Do not include the users who did not login in 2020.
-- Return the result table in any order.


Select user_id, Max(time_stamp) as time_stamps
from 62LatestLoginIn2020_1890 
where year(time_stamp) = 2020
GROUP BY user_id; 


Output 

+---------+---------------------+
| user_id | time_stamps          |
+---------+---------------------+
|       2 | 2020-01-16 02:49:50 |
|       6 | 2020-06-30 15:06:07 |
|       8 | 2020-12-30 00:46:50 |
+---------+---------------------+