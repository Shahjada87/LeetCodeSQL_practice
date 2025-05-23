Q.619 Biggest Single Number 

Create table if not exists 10BiggestSingleNumber (
    num int
);

INSERT INTO 10BiggestSingleNumber (num) VALUES
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);

rename TABLE 10BiggestSingleNumber TO 10BiggestSingleNumber619;

select * from 10BiggestSingleNumber619;

WITH Cte as
(SELECT num
From 10BiggestSingleNumber619 
Group by num  
Having count(num) = 1)

Select case when count(*) > 0 then MAX(num)
else NULL
end as num
From Cte;


Q.620 Not Boring Movies

Create table if not exists 11NotBoringMovies620 (
    id int PRIMARY KEY,
    movie varchar(255),
    description varchar(255),
    rating float
);

INSERT into 11NotBoringMovies620 VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);

SELECT * from 11NotBoringMovies620;

Select * from 11NotBoringMovies620
Where description not like '%boring%'
AND id % 2 =1
order by rating desc;

Q.627 Swap Salary

Create table if not exists 12SwapSalary627 (
    id int PRIMARY KEY,
    name varchar(20),
    sex enum('F', 'M'),
    salary int
);

INSERT into 12SwapSalary627 VALUES
(1, 'A', 'M', 2500),
(2, 'B', 'F', 1500),
(3, 'C', 'M', 5500),
(4, 'D', 'F', 500);

select * from 12SwapSalary627;

update 12SwapSalary627 set sex = 
case when sex = 'M' then 'F'
Else 'M' end
where sex in ('M', 'F');
select * from 12SwapSalary627;

Q.1050 Actors and Directors Who Cooperated At Least Three Times

Create table if not exists 13ActorsAndDirectors1050 (
    actor_id int,
    director_id int,
    timeStamp int PRIMARY KEY
);

insert into 13ActorsAndDirectors1050 values
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 2, 3),
(1, 2, 4),
(2, 1, 5),
(2, 1, 6);

select * from 13ActorsAndDirectors1050;

Select actor_id, director_id
From 13ActorsAndDirectors1050 
Group by actor_id,director_id
Having count(*) >= 3;