--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1729 Find Followers Count

create table if not exists 65FindFollowersCount1729(
    user_id int,
    follower_id int,
    primary key (user_id, follower_id)
);

insert into 65FindFollowersCount1729 values
(0,1),
(1,0),
(2,0),
(2,1);

mysql> select * from 65FindFollowersCount1729;
+---------+-------------+
| user_id | follower_id |
+---------+-------------+
|       0 |           1 |
|       1 |           0 |
|       2 |           0 |
|       2 |           1 |
+---------+-------------+
4 rows in set (0.02 sec)



--Write a solution that will, for each user, return the number of followers.
--Return the result table ordered by user_id in ascending order.


select user_id, count(DISTINCT follower_id)
from 65FindFollowersCount1729
group by user_id
order by user_id asc;


Output 

+---------+-----------------------------+
| user_id | count(DISTINCT follower_id) |
+---------+-----------------------------+
|       0 |                           1 |
|       1 |                           1 |
|       2 |                           2 |
+---------+-----------------------------+
3 rows in set (0.00 sec)
