--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 597 Friend Requests I: Overall acceptance rate

create table 41FrndRqstOverallAcceptanceRate597(
    sender_id int,
    send_to_id int,
    request_date date
);

insert into 41FrndRqstOverallAcceptanceRate597 values
(1, 2, '2016-06-01'),
(1, 3, '2016-06-01'),
(1, 4, '2016-06-01'),
(2, 3, '2016-06-02'),
(3, 4, '2016-06-09');


mysql> select * from 41FrndRqstOverallAcceptanceRate597;
+-----------+------------+--------------+
| sender_id | send_to_id | request_date |
+-----------+------------+--------------+
|         1 |          2 | 2016-06-01   |
|         1 |          3 | 2016-06-01   |
|         1 |          4 | 2016-06-01   |
|         2 |          3 | 2016-06-02   |
|         3 |          4 | 2016-06-09   |
+-----------+------------+--------------+
5 rows in set (0.01 sec)



create table if not exists 41_1RequestAccepted597(
    requester_id int,
    accepter_id int,
    accept_date date
);


insert into 41_1RequestAccepted597 values 
(2, 3, '2016-06-08'),
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(3, 4, '2016-06-09'),
(3, 4, '2016-06-10');


mysql> select * from 41_1RequestAccepted597;
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
|            2 |           3 | 2016-06-08  |
|            1 |           2 | 2016-06-03  |
|            1 |           3 | 2016-06-08  |
|            3 |           4 | 2016-06-09  |
|            3 |           4 | 2016-06-10  |
+--------------+-------------+-------------+
5 rows in set (0.00 sec)


--Write an SQL query to find the overall acceptance rate of requests, 
--which is the number of acceptance divided by the number of requests. 
--Return the answer rounded to 2 decimals places. Note that: 
--• The accepted requests are not necessarily from the table friend_request. 
--In this case, Count the total accepted requests (no matter whether they are in the original requests),
-- and divide it by the number of requests to get the acceptance rate. 
--• It is possible that a sender sends multiple requests to the same receiver, 
--and a request could be accepted more than once. 
--In this case, the 'duplicated' requests or acceptances are only counted once. 
--• If there are no requests at all, you should return 0.00 as the accept_rate. 
--The query result format is in the following example.



Select round(
(select count(*) from
(select distinct requester_id, accepter_id
from 41_1RequestAccepted597)
as total_count)
/
(select  count(*) from
(select distinct sender_id, send_to_id
from 41FrndRqstOverallAcceptanceRate597) 
as toal_count1),2) as acceptance_rate



Output

+-----------------+
| acceptance_rate |
+-----------------+
|            0.80 |
+-----------------+
1 row in set (0.02 sec)