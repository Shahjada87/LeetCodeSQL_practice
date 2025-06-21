-- Active: 1739013567819@@127.0.0.1@3306@leetcode

show tables;

Q. 178 Rank scores 

create table if not exists 48RankScores178(
    id int primary key,
    score decimal
)


insert into 48RankScores178 values
(1, 3.50),
(2, 3.65),
(3, 4.00),
(4, 3.85),
(5, 4.00),
(6, 3.65);


mysql> select * from 48RankScores178;
+----+-------+
| id | score |
+----+-------+
|  1 |     4 |
|  2 |     4 |
|  3 |     4 |
|  4 |     4 |
|  5 |     4 |
|  6 |     4 |
+----+-------+


ALTER TABLE 48RankScores178 MODIFY Score DECIMAL(5,2);


mysql> select * from 48RankScores178;
+----+-------+
| id | Score |
+----+-------+
|  1 |  3.50 |
|  2 |  3.65 |
|  3 |  4.00 |
|  4 |  3.85 |
|  5 |  4.00 |
|  6 |  3.65 |
+----+-------+


--Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:
--The scores should be ranked from the highest to the lowest.
--If there is a tie between two scores, both should have the same ranking.
--After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
--Return the result table ordered by score in descending order.


SELECT score,
    DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM 48RankScores178;


Output

+-------+------+
| score | rank |
+-------+------+
|  4.00 |    1 |
|  4.00 |    1 |
|  3.85 |    2 |
|  3.65 |    3 |
|  3.65 |    3 |
|  3.50 |    4 |
+-------+------+

