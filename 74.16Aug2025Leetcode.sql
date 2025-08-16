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




------------------------------------------------------------------------------------


--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 627 Swap Salary

Create table if not exists 66SwapSalary627 (
    id int PRIMARY KEY,
    name varchar(20),
    sex enum('F', 'M'),
    salary int
);

INSERT into 66SwapSalary627 VALUES
(1, 'A', 'M', 2500),
(2, 'B', 'F', 1500),
(3, 'C', 'M', 5500),
(4, 'D', 'F', 500);


mysql> select * from 66SwapSalary627;
+----+------+------+--------+
| id | name | sex  | salary |
+----+------+------+--------+
|  1 | A    | M    |   2500 |
|  2 | B    | F    |   1500 |
|  3 | C    | M    |   5500 |
|  4 | D    | F    |    500 |
+----+------+------+--------+
4 rows in set (0.01 sec)


--Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) 
--with a single update statement and no intermediate temporary tables.
--Note that you must write a single update statement, do not write any select statement for this problem.

UPDATE 66SwapSalary627
SET sex = CASE 
    WHEN sex = 'M' THEN 'F'
    WHEN sex = 'F' THEN 'M'
END;


mysql> select * from 29SwapSalary627;
+----+------+------+--------+
| id | name | sex  | salary |
+----+------+------+--------+
|  1 | A    | F    |   2500 |
|  2 | B    | M    |   1500 |
|  3 | C    | F    |   5500 |
|  4 | D    | M    |    500 |
+----+------+------+--------+
4 rows in set (0.00 sec)


