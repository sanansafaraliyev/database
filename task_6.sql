-- use azerbaijan;
-- show tables;

-- Task 1 
-- select division_name,capital,area,population from administrative_divisions limit 10;

-- Task 2
-- select division_name,capital,population, region from administrative_divisions group by region;

-- Task 3
-- select division_name,capital,population from administrative_divisions where region = "Aran";

-- Task 4
-- select group_concat(division_name SEPARATOR ',') as divisions, region, count(*) from administrative_divisions group by region;

-- Task 5
-- select region, SUM(population) from administrative_divisions group by region;

-- Task 6
-- select region,capital,population from administrative_divisions where region = 'Aran';

-- Task 7
-- select MAX(population), MIN(population), AVG(population) from administrative_divisions;

-- Task 8
-- select division_name, MAX(population) from administrative_divisions;

-- Task 9
-- select MAX(population), capital from administrative_divisions where region = "Yukhari-Karabakh";