--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q610. Triangle Judgement

Create table if not exists 56TriangleJudgment610
(
X int primary key,
Y int,
Z int
);

Insert into 56TriangleJudgment610 values (13,15,30),(10,20,15);

mysql> select * from 56TriangleJudgment610;
+----+------+------+
| X  | Y    | Z    |
+----+------+------+
| 10 |   20 |   15 |
| 13 |   15 |   30 |
+----+------+------+
2 rows in set (0.00 sec)


Select *, case when x+y>z AND y+z>x AND x+z > y then 'Yes' else 'No' end as Triangle
From 56TriangleJudgment610;


Output 

+----+------+------+----------+
| X  | Y    | Z    | Triangle |
+----+------+------+----------+
| 10 |   20 |   15 | Yes      |
| 13 |   15 |   30 | No       |
+----+------+------+----------+
2 rows in set (0.00 sec)
