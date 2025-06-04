Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q.1141 User activity from past 30days I

create table if not exists 7UserActivityPast30DaysI1141(
    user_id int,
    session_id int,
    activity_date date,
    activity_type enum('open_session', 'end_session', 'scroll_down', 'send_message')
);


insert into 7UserActivityPast30DaysI1141 values 
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


mysql> select * from 7UserActivityPast30DaysI1141;
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


--Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
--A user was active on someday if they made at least one activity on that day.
--Return the result table in any order.

Select activity_date, count(DISTINCT user_id)  as active_users 
from 7UserActivityPast30DaysI1141
where activity_date BETWEEN DATE_ADD('2019-07-27', interval -29 day) AND '2019-07-27'
group by activity_date;