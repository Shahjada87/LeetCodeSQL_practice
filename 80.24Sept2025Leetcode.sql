
--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q.619 Biggest Single Number 

Create table if not exists 71BiggestSingleNumber619 (
    num int
);

INSERT INTO 71BiggestSingleNumber619 VALUES
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);


mysql> select * from 71BiggestSingleNumber619;
+------+
| num  |
+------+
|    8 |
|    8 |
|    3 |
|    3 |
|    1 |
|    4 |
|    5 |
|    6 |
+------+
8 rows in set (0.00 sec)


--A single number is a number that appeared only once in the MyNumbers table.

--Find the largest single number. If there is no single number, report null.


With cte as 
(Select num 
from 71BiggestSingleNumber619 
group by num
Having count(num) = 1)
Select case when count(*) >= 0 then MAX(num) else null end as number
from cte;


Output 

+---------+
|  number |
+---------+
|    6    |
+---------+





