--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Show tables;


Q. 627 Swap Salary

Create table if not exists 75SwapSalary627 (
    id int PRIMARY KEY,
    name varchar(20),
    sex enum('F', 'M'),
    salary int
);

INSERT into 75SwapSalary627 VALUES
(1, 'A', 'M', 2500),
(2, 'B', 'F', 1500),
(3, 'C', 'M', 5500),
(4, 'D', 'F', 500);


mysql> select * from 75SwapSalary627;
+----+------+------+--------+
| id | name | sex  | salary |
+----+------+------+--------+
|  1 | A    | M    |   2500 |
|  2 | B    | F    |   1500 |
|  3 | C    | M    |   5500 |
|  4 | D    | F    |    500 |
+----+------+------+--------+
4 rows in set (0.01 sec)


--Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) 
--with a single update statement and no intermediate temporary tables.
--Note that you must write a single update statement, do not write any select statement for this problem.

UPDATE 75SwapSalary627
SET sex = CASE 
    WHEN sex = 'M' THEN 'F'
    WHEN sex = 'F' THEN 'M'
END;


mysql> select * from 75SwapSalary627;
+----+------+------+--------+
| id | name | sex  | salary |
+----+------+------+--------+
|  1 | A    | F    |   2500 |
|  2 | B    | M    |   1500 |
|  3 | C    | F    |   5500 |
|  4 | D    | M    |    500 |
+----+------+------+--------+
4 rows in set (0.00 sec)
