--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 620 Not boring movies 

Create table if not exists 67NotBoringMovies620 (
    id int PRIMARY KEY,
    movie varchar(255),
    description varchar(255),
    rating float
);

INSERT into 67NotBoringMovies620 VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);


mysql> select * from 67NotBoringMovies620;
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
|  1 | War        | great 3D    |    8.9 |
|  2 | Science    | fiction     |    8.5 |
|  3 | irish      | boring      |    6.2 |
|  4 | Ice song   | Fantacy     |    8.6 |
|  5 | House card | Interesting |    9.1 |
+----+------------+-------------+--------+
5 rows in set (0.02 sec)


--Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
--Return the result table ordered by rating in descending order.


select id, description
from 67NotBoringMovies620
where id % 2 != 0 AND description not like 'boring'
order by rating desc;


+----+-------------+
| id | description |
+----+-------------+
|  5 | Interesting |
|  1 | great 3D    |
+----+-------------+
2 rows in set (0.00 sec)