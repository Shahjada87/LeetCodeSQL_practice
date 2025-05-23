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

Select * from `11NotBoringMovies620`
Where description not like '%boring%'
AND id % 2 =1
order by rating desc;