--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 620 Not boring movies 

Create table if not exists 45NotBoringMovies620 (
    id int PRIMARY KEY,
    movie varchar(255),
    description varchar(255),
    rating float
);

INSERT into 45NotBoringMovies620 VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);


mysql> Select * from 45NotBoringMovies620;
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
|  1 | War        | great 3D    |    8.9 |
|  2 | Science    | fiction     |    8.5 |
|  3 | irish      | boring      |    6.2 |
|  4 | Ice song   | Fantacy     |    8.6 |
|  5 | House card | Interesting |    9.1 |
+----+------------+-------------+--------+
5 rows in set (0.05 sec)




--Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
--Return the result table ordered by rating in descending order.

select *
from 45NotBoringMovies620
where description not like 'boring'
AND id % 2 = 1
order by rating desc;


+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
|  5 | House card | Interesting |    9.1 |
|  1 | War        | great 3D    |    8.9 |
+----+------------+-------------+--------+
2 rows in set (0.01 sec)