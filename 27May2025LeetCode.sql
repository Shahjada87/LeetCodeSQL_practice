Q.1211 Questies Quality and Percentage

Create table 20QuestiesQuality1211 (
    query_name varchar(20),
    result varchar(20),
    position int,
    rating int  
);

insert into `20QuestiesQuality1211` VALUES
('Dog', 'Golden Retriever', 1, 5),
('Dog', 'German Shepherd', 2, 5),
('Dog', 'Mule', 200, 1),
('Cat', 'Shirazi', 5, 2),
('Cat', 'Siamese', 3, 3),
('Cat', 'Sphynx', 7, 4);


Select query_name,
        rouind (avg(rating / position),2) as quality
From `20QuestiesQuality1211`
group by query_name;

