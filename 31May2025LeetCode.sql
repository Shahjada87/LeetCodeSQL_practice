--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

show tables;
Q.1148 Article Views I

create table if not exists 3ArticleViewsI(
    article_id int,
    author_id int,
    viewer_id int,
    viewer_date date
)


insert into 3ArticleViewsI values 
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');

mysql> Select * from 3ArticleViewsI;
+------------+-----------+-----------+-------------+
| article_id | author_id | viewer_id | viewer_date |
+------------+-----------+-----------+-------------+
|          1 |         3 |         5 | 2019-08-01  |
|          1 |         3 |         6 | 2019-08-02  |
|          2 |         7 |         7 | 2019-08-01  |
|          2 |         7 |         6 | 2019-08-02  |
|          4 |         7 |         1 | 2019-07-22  |
|          3 |         4 |         4 | 2019-07-21  |
|          3 |         4 |         4 | 2019-07-21  |
+------------+-----------+-----------+-------------+


--Write a solution to find all the authors that viewed at least one of their own articles.

--Return the result table sorted by id in ascending order.

Select distinct a.author_id as id 
From 3ArticleViewsI a
inner join 3ArticleViewsI b
on a.author_id = b.viewer_id
order by id;

Output

+------+
| id   |
+------+
|    4 |
|    7 |
+------+

--------------------------------------------------------------------------

