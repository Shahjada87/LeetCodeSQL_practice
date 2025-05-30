--Praactice one random question from already solved -- LeetCode problems

Use PracticeRandomSolvedLeetCodeProbs;

Q.1251 Avearge Selling price

Create table if not exists 2AverageSellingPrice1251(
    product_id int,
    start_date date,
    end_date date,
    prcie int,
    Primary Key (product_id, start_date, end_date)
);


Create table if not exists 2_1UnitsSold1251(
    product_id int,
    purchase_date date,
    units int
);

show tables;

insert into  2AverageSellingPrice1251 values
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30)
;

Insert into 2_1UnitsSold1251 values
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);

Select * from 2AverageSellingPrice1251;

Select * from 2_1UnitsSold1251;

-- Query to calculate the average selling price of each product
-- based on the units sold within the specified date ranges
-- and the price during those periods.


Select a.product_id as product_id, IFNULL(round(sum(a.prcie * b.units) / sum(b.units),2),0 as avearage_price
From 2AverageSellingPrice1251 a
left join 2_1UnitsSold1251 b
on a.product_id = b.product_id 
where b.purchase_date BETWEEN a.start_date AND a.end_date
group by a.product_id; 


--------------------------------------------------------------------------
 show tables;


Q.1527 Patients with a condition

Create table if not exists 28PatientsWithCondition1527(
    patient_id int Primary Key,
    patient_name varchar(50),
    conditions varchar(50)
);

insert into 28PatientsWithCondition1527 VALUES
(1, 'Daniel', 'YFEV COUGH'),
(2, 'Alice', ''),
(3, 'Bob', 'DIAB100 MYOP'),
(4, 'George', 'ACNE DIAB100'),
(5, 'Alain', 'DIAB201');

--Write a solution to find the patient_id, patient_name, and conditions 
--of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.
--Return the result table in any order.

select *
from  28PatientsWithCondition1527
where conditions like 'DIAB1%' OR conditions like '% DIAB1%'

Output

+------------+--------------+--------------+
| patient_id | patient_name | conditions   |
+------------+--------------+--------------+
|          3 | Bob          | DIAB100 MYOP |
|          4 | George       | ACNE DIAB100 |
+------------+--------------+--------------+


--------------------------------------------------------------------------








