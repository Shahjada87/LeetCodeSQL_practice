--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 3465 Find Products with Valid Serial Numbers

create table if not exists 20ProductsWithValidSerialNumber3465(
    product_id int primary key,
    product_name varchar(40),
    description varchar(50)
);


Alter table 20ProductsWithValidSerialNumber3465 modify column description varchar(200);


insert into 20ProductsWithValidSerialNumber3465 values 
(1, 'Widget A', 'This is a sample product with SN1234-5678'),
(2, 'Widget B', 'A product with serial SN9876-1234 in the description'),
(3, 'Widget C', 'Product SN1234-56789 is available now'),
(4, 'Widget D', 'No serial number here'),
(5, 'Widget E', 'Check out SN4321-8765 in this description');


mysql> select * from 20ProductsWithValidSerialNumber3465;
+------------+--------------+------------------------------------------------------+
| product_id | product_name | description                                          |
+------------+--------------+------------------------------------------------------+
|          1 | Widget A     | This is a sample product with SN1234-5678            |
|          2 | Widget B     | A product with serial SN9876-1234 in the description |
|          3 | Widget C     | Product SN1234-56789 is available now                |
|          4 | Widget D     | No serial number here                                |
|          5 | Widget E     | Check out SN4321-8765 in this description            |
+------------+--------------+------------------------------------------------------+
5 rows in set (0.01 sec)



--Write a solution to find all products whose description contains a valid serial number pattern.
--A valid serial number follows these rules:
--It starts with the letters SN (case-sensitive).
--Followed by exactly 4 digits.
--It must have a hyphen (-) followed by exactly 4 digits.
--The serial number must be within the description (it may not necessarily start at the beginning).
--Return the result table ordered by product_id in ascending order.


select * 
from 20ProductsWithValidSerialNumber3465
where description REGEXP '\\bSN[0-9]{4}-[0-9]{4}\\b'
order by 1


Output


+------------+--------------+------------------------------------------------------+
| product_id | product_name | description                                          |
+------------+--------------+------------------------------------------------------+
|          1 | Widget A     | This is a sample product with SN1234-5678            |
|          2 | Widget B     | A product with serial SN9876-1234 in the description |
|          5 | Widget E     | Check out SN4321-8765 in this description            |
+------------+--------------+------------------------------------------------------+
3 rows in set (0.01 sec)



-----------------------------------------------------------------------------------------


