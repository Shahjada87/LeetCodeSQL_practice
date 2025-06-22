--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 511 Game play analysis I

create table if not exists 18GamePlayAnalysisI511(
    player_id int,
    device_id int,
    event_date date,
    games_played int,
    Primary key (player_id, event_date)
);


insert into 18GamePlayAnalysisI511 values 
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);


mysql> select * from 18GamePlayAnalysisI511;
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
|         1 |         2 | 2016-03-01 |            5 |
|         1 |         2 | 2016-05-02 |            6 |
|         2 |         3 | 2017-06-25 |            1 |
|         3 |         1 | 2016-03-02 |            0 |
|         3 |         4 | 2018-07-03 |            5 |
+-----------+-----------+------------+--------------+



--Write a solution to find the first login date for each player.
--Return the result table in any order.

select player_id, min(event_date) as first_login
FROM 18GamePlayAnalysisI511 
group by player_id 


Output 

+-----------+-------------+
| player_id | first_login |
+-----------+-------------+
|         1 | 2016-03-01  |
|         2 | 2017-06-25  |
|         3 | 2016-03-02  |
+-----------+-------------+





