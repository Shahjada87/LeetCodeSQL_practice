--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;

Q. 1757 Recyclable and low fat products

create table if not exists 10RecyclableAndLowFatProducts1757(
    product_id int primary key,
    low_fats enum('Y', 'N'),
    recyclable enum('Y', 'N')
);

insert into 10RecyclableAndLowFatProducts1757 values 
(0, 'Y', 'N'),
(1, 'Y', 'Y'),
(2, 'N', 'Y'),
(3, 'Y', 'Y'),
(4, 'N', 'N');


mysql> select * from 10RecyclableAndLowFatProducts1757;
+------------+----------+------------+
| product_id | low_fats | recyclable |
+------------+----------+------------+
|          0 | Y        | N          |
|          1 | Y        | Y          |
|          2 | N        | Y          |
|          3 | Y        | Y          |
|          4 | N        | N          |
+------------+----------+------------+


--Write a solution to find the ids of products that are both low fat and recyclable.
--Return the result table in any order.

select product_id
from 10RecyclableAndLowFatProducts1757
where low_fats = 'Y'
AND recyclable = 'Y';


Output

+------------+
| product_id |
+------------+
|          1 |
|          3 |
+------------+