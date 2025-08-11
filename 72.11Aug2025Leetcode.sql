--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 3436 Find valid emails 

create table if not exists 63FIndValidEmails3436(
    user_id int primary key,
    email varchar(100)
)


insert into 63FIndValidEmails3436 values 
(1, 'alice@example.com'),
(2, 'bob_at_example.com'),
(3, 'charlie@example.net'),
(4, 'david@domain.com'),
(5, 'eve@invalid');

mysql> select * from 63FIndValidEmails3436;
+---------+---------------------+
| user_id | email               |
+---------+---------------------+
|       1 | alice@example.com   |
|       2 | bob_at_example.com  |
|       3 | charlie@example.net |
|       4 | david@domain.com    |
|       5 | eve@invalid         |
+---------+---------------------+


--Write a solution to find all the valid email addresses. A valid email address meets the following criteria:
--It contains exactly one @ symbol.
--It ends with .com.
--The part before the @ symbol contains only alphanumeric characters and underscores.
--The part after the @ symbol and before .com contains a domain name that contains only letters.
--Return the result table ordered by user_id in ascending order.


select user_id,email 
from 63FIndValidEmails3436
where email REGEXP '^[a-zA-Z0-9_]+@[a-zA-Z]+.com$'
order by user_id asc;


Output 

+---------+-------------------+
| user_id | email             |
+---------+-------------------+
|       1 | alice@example.com |
|       4 | david@domain.com  |
+---------+-------------------+
