--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q.586 Customer who placed largest no of orders


create table if not exists 25CustomerPlacedLargestNoOfOrders586(
    order_number int primary key,
    customer_number int 
);


insert into 25CustomerPlacedLargestNoOfOrders586 values 
(1,1),
(2,2),
(3,3),
(4,3);


mysql> select * from 25CustomerPlacedLargestNoOfOrders586;
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
|            1 |               1 |
|            2 |               2 |
|            3 |               3 |
|            4 |               3 |
+--------------+-----------------+
4 rows in set (0.00 sec)


--Write a solution to find the customer_number for the customer who has placed the largest number of orders.

--The test cases are generated so that exactly one customer will have placed more orders than any other customer.

WIth cte as 
(select customer_number,Count(order_number) as count 
from 25CustomerPlacedLargestNoOfOrders586
group by customer_number)
select customer_number
from cte
where count = (select MAX(count) from cte);


Output

+-----------------+
| customer_number |
+-----------------+
|               3 |
+-----------------+
1 row in set (0.01 sec)



