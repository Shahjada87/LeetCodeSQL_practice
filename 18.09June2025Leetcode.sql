--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1587 Bank account summary II

create table if not exists 10BankAccountSummaryII1587(
    account int primary key,
    name varchar(50)
);

insert into 10BankAccountSummaryII1587 values 
(900001, 'Alice'),
(900002, 'Bob'),
(900003, 'Charlie');


mysql> select * from 10BankAccountSummaryII1587;
+---------+---------+
| account | name    |
+---------+---------+
|  900001 | Alice   |
|  900002 | Bob     |
|  900003 | Charlie |
+---------+---------+


create table if not exists 10_1Transactions1587(
    trans_id int primary key,
    account int,
    amount int,
    transacted_on date
);

insert into 10_1Transactions1587 values
(1, 900001, 7000, '2020-08-01'),
(2, 900001, 7000, '2020-09-01'),
(3, 900001, -3000, '2020-09-02'),
(4, 900002, 1000, '2020-09-12'),
(5, 900003, 6000, '2020-08-07'),
(6, 900003, 6000, '2020-09-07'),
(7, 900003, -4000, '2020-09-11');


mysql> select * from 10_1Transactions1587;
+----------+---------+--------+---------------+
| trans_id | account | amount | transacted_on |
+----------+---------+--------+---------------+
|        1 |  900001 |   7000 | 2020-08-01    |
|        2 |  900001 |   7000 | 2020-09-01    |
|        3 |  900001 |  -3000 | 2020-09-02    |
|        4 |  900002 |   1000 | 2020-09-12    |
|        5 |  900003 |   6000 | 2020-08-07    |
|        6 |  900003 |   6000 | 2020-09-07    |
|        7 |  900003 |  -4000 | 2020-09-11    |
+----------+---------+--------+---------------+


--Write a solution to report the name and balance of users with a balance higher than 10000. 
--The balance of an account is equal to the sum of the amounts of all transactions involving that account.
--Return the result table in any order.


Select a.name, sum(b.amount) as balance
from 10BankAccountSummaryII1587 a 
left join 10_1Transactions1587 b
on a.account = b.account 
group by a.account
having sum(b.amount) >= 10000



