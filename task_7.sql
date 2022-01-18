-- # creating database usa;
-- CREATE DATABASE usa;

-- # using database
-- USE usa;

-- # creating table states;
-- CREATE TABLE states (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(20),
--     join_year INT,
--     population INT,
--     UNIQUE (name),
--     KEY (join_year)
-- );


-- # inserting datas into table 
-- INSERT INTO states VALUES
-- (1, 'Alabama', 1819, 4661900),
-- (2, 'Alaska', 1959, 686293),
-- (3, 'Arizona', 1912, 6500180),
-- (4, 'Arkansas', 1836, 2855390),
-- (5, 'California', 1850, 36756666),
-- (6, 'Colorado', 1876, 4939456),
-- (7, 'Connecticut', 1788, 3501252),
-- (8, 'Delaware', 1787, 873092),
-- (9, 'Florida', 1845, 18328340),
-- (10, 'Georgia', 1788, 9685744),
-- (11, 'Hawaii', 1959, 1288198),
-- (12, 'Idaho', 1890, 1523816),
-- (13, 'Illinois', 1818, 12901563),
-- (14, 'Indiana', 1816, 6376792),
-- (15, 'Iowa', 1846, 3002555),
-- (16, 'Kansas', 1861, 2802134),
-- (17, 'Kentucky', 1792, 4269245),
-- (18, 'Louisiana', 1812, 4410796),
-- (19, 'Maine', 1820, 1316456),
-- (20, 'Maryland', 1788, 5633597),
-- (21, 'Massachusetts', 1788, 6497967),
-- (22, 'Michigan', 1837, 10003422),
-- (23, 'Minnesota', 1858, 5220393),
-- (24, 'Mississippi', 1817, 2938618),
-- (25, 'Missouri', 1821, 5911605),
-- (26, 'Montana', 1889, 967440),
-- (27, 'Nebraska', 1867, 1783432),
-- (28, 'Nevada', 1864, 2600167),
-- (29, 'New Hampshire', 1788, 1315809),
-- (30, 'New Jersey', 1787, 8682661),
-- (31, 'New Mexico', 1912, 1984356),
-- (32, 'New York', 1788, 19490297),
-- (33, 'North Carolina', 1789, 9222414),
-- (34, 'North Dakota', 1889, 641481),
-- (35, 'Ohio', 1803, 11485910),
-- (36, 'Oklahoma', 1907, 3642361),
-- (37, 'Oregon', 1859, 3790060),
-- (38, 'Pennsylvania', 1787, 12448279),
-- (39, 'Rhode Island', 1790, 1050788),
-- (40, 'South Carolina', 1788, 4479800),
-- (41, 'South Dakota', 1889, 804194),
-- (42, 'Tennessee', 1796, 6214888),
-- (43, 'Texas', 1845, 24326974),
-- (44, 'Utah', 1896, 2736424),
-- (45, 'Vermont', 1791, 621270),
-- (46, 'Virginia', 1788, 7769089),
-- (47, 'Washington', 1889, 6549224),
-- (48, 'West Virginia', 1863, 1814468),
-- (49, 'Wisconsin', 1848, 5627967),
-- (50, 'Wyoming', 1890, 532668);

-- Task 1
-- select * from states group by join_year;

-- Task 2 
-- select group_concat(name separator ',') as all_states,join_year from states group by join_year;

-- Task 3
-- select * from states where join_year = 1787;

-- Task 4
-- select COUNT(*) from states where join_year = 1787;

-- Task 5
-- select MAX(population), MIN(population),AVG(population) from states;

-- Taask 6
-- select SUM(population) from states;

-- Task 7
-- select COUNT(*) from states;

-- Task 8
-- select sum(if (population > 5000000,1,0)) as big_states, sum(if (population <= 5000000,1,0)) as small_states from states;

-- TAsk 9
/*
SELECT 
    SUM(
        IF(population > 5000000, 1, 0)
    ) AS big_states,
    SUM(
        IF(population <= 5000000, 1, 0)
    ) AS small_states
FROM states;
*/

-- Task 10
-- select * from states where join_year = (select MAX(join_year) from states);

-- Task 11
-- select * from states where population = (select MIN(population) from states);

-- Task 12
/*
(select * from states where name like 'n%')
UNION
(select * from states where population > 10000000);
*/

-- Task 13
-- SELECT
-- COUNT(*),
-- CASE
--     WHEN population > 5000000 THEN 'big'
--     WHEN population > 1000000 THEN 'medium'
--     ELSE 'small' END
-- AS state_size
-- FROM states GROUP BY state_size;

-- Task 14
-- select group_concat(name SEPARATOR ',') as state_names,COUNT(*),
-- CASE
--     WHEN population > 5000000 THEN 'big'
--     WHEN population > 1000000 THEN 'medium'
--     ELSE 'small' END
-- AS state_size
-- FROM states GROUP BY state_size;


-- Task 15
-- select COUNT(*), join_year from states group by join_year HAVING COUNT(*) > 1;