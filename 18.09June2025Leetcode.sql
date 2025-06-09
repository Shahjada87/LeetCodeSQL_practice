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


Output 

+-------+---------+
| name  | balance |
+-------+---------+
| Alice |   11000 |
+-------+---------+


--------------------------------------------------------------------------

use leetcode;

show tables;


Q. 3465 Find Products with Valid Serial Numbers

create table if not exists 45ProductsWithValidSerialNumber3465(
    product_id int primary key,
    product_name varchar(40),
    description varchar(50)
);


Alter table 45ProductsWithValidSerialNumber3465 modify column description varchar(200);


insert into 45ProductsWithValidSerialNumber3465 values 
(1, 'Widget A', 'This is a sample product with SN1234-5678'),
(2, 'Widget B', 'A product with serial SN9876-1234 in the description'),
(3, 'Widget C', 'Product SN1234-56789 is available now'),
(4, 'Widget D', 'No serial number here'),
(5, 'Widget E', 'Check out SN4321-8765 in this description');


mysql> select * from 45ProductsWithValidSerialNumber3465;
+------------+--------------+------------------------------------------------------+
| product_id | product_name | description                                          |
+------------+--------------+------------------------------------------------------+
|          1 | Widget A     | This is a sample product with SN1234-5678            |
|          2 | Widget B     | A product with serial SN9876-1234 in the description |
|          3 | Widget C     | Product SN1234-56789 is available now                |
|          4 | Widget D     | No serial number here                                |
|          5 | Widget E     | Check out SN4321-8765 in this description            |
+------------+--------------+------------------------------------------------------+


--Write a solution to find all products whose description contains a valid 
--serial number pattern. A valid serial number follows these rules:
--It starts with the letters SN (case-sensitive).
--Followed by exactly 4 digits.
--It must have a hyphen (-) followed by exactly 4 digits.
--The serial number must be within the description (it may not necessarily start at the beginning).
--Return the result table ordered by product_id in ascending order.


Select * 
From 45ProductsWithValidSerialNumber3465 
where description REGEXP '\\bSN[0-9]{4}-[0-9]{4}\\b'
order by 1;


Output 

+------------+--------------+------------------------------------------------------+
| product_id | product_name | description                                          |
+------------+--------------+------------------------------------------------------+
|          1 | Widget A     | This is a sample product with SN1234-5678            |
|          2 | Widget B     | A product with serial SN9876-1234 in the description |
|          5 | Widget E     | Check out SN4321-8765 in this description            |
+------------+--------------+------------------------------------------------------+