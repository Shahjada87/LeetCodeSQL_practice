--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 1141 User Activity for the Past 30 Days I

create table if not exists 52Activity1141(
    user_id int,
    session_id int,
    activity_date date,
    activity_type enum('open_session', 'end_session', 'scroll_down', 'send_message')
);

insert into 52Activity1141 VALUES
(1, 1, '2019-07-20', 'open_session'),
(1, 1, '2019-07-20', 'scroll_down'),
(1, 1, '2019-07-20', 'end_session'),
(2, 4, '2019-07-20', 'open_session'),
(2, 4, '2019-07-21', 'send_message'),
(2, 4, '2019-07-21', 'end_session'),
(3, 2, '2019-07-21', 'open_session'),
(3, 2, '2019-07-21', 'send_message'),
(3, 2, '2019-07-21', 'end_session'),
(4, 3, '2019-06-25', 'open_session'),
(4, 3, '2019-06-25', 'end_session');

select * from 52activity1141;
+---------+------------+---------------+---------------+
| user_id | session_id | activity_date | activity_type |
+---------+------------+---------------+---------------+
|       1 |          1 | 2019-07-20    | open_session  |
|       1 |          1 | 2019-07-20    | scroll_down   |
|       1 |          1 | 2019-07-20    | end_session   |
|       2 |          4 | 2019-07-20    | open_session  |
|       2 |          4 | 2019-07-21    | send_message  |
|       2 |          4 | 2019-07-21    | end_session   |
|       3 |          2 | 2019-07-21    | open_session  |
|       3 |          2 | 2019-07-21    | send_message  |
|       3 |          2 | 2019-07-21    | end_session   |
|       4 |          3 | 2019-06-25    | open_session  |
|       4 |          3 | 2019-06-25    | end_session   |
+---------+------------+---------------+---------------+
11 rows in set (0.13 sec)




-- Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
-- A user was active on someday if they made at least one activity on that day.

Select activity_date as day, count(DISTINCT user_id)
From 52activity1141
where activity_date BETWEEN DATE_ADD('2019-07-27', Interval -29 DAY) AND '2019-07-27'
group by activity_date;



Output

+------------+-------------------------+
| day        | count(DISTINCT user_id) |
+------------+-------------------------+
| 2019-07-20 |                       2 |
| 2019-07-21 |                       2 |
+------------+-------------------------+
2 rows in set (0.01 sec)