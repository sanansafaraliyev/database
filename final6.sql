/* Procedure */
-- DELIMITER //
-- create procedure GetRegionbyName(
--     in regName VARCHAR(100)
-- )
-- BEGIN 
--     select * from regions where region_name = regName;

-- END //
-- DELIMITER ;


-- DELIMITER //
-- create procedure getCitiesByregion(
--     in regName VARCHAR(50)
-- )

-- BEGIN 
--     select administrative_divisions.division_name,administrative_divisions.capital, administrative_divisions.population,
--     administrative_divisions.area,administrative_divisions.region, regions.region_name from regions,administrative_divisions where 
--     regions.region_name = regName and regions.region_name = administrative_divisions.region;
-- END //

-- DELIMITER ;


-- DELIMITER //
-- create procedure GetCityCountsByRegion(
--     in regName VARCHAR(50),
--     out cityCOunt INT
-- )
-- BEGIN
--     select count(*) into cityCOunt from administrative_divisions where region = regName;
-- END //

-- DELIMITER ;


-- DELIMITER //
-- create procedure getSomeElements(
--     in regname VARCHAR(50),
--     out count_capitals INT,
--     out count_noncapitals INT,
--     out count_cities INT
-- )
-- BEGIN
--     select count(capital) into count_capitals from administrative_divisions where region = regname;
--     select count(*) into count_noncapitals from administrative_divisions where capital = NULL and region = regName;
--     select count(*) into count_cities from administrative_divisions where region = regName;
-- END //

-- DELIMITER ;

DELIMITER //
create procedure getAreaPopulation(
    in regName VARCHAR(50),
    out totalPopulation INT,
    out totalArea FLOAT(10,2)
)
BEGIN  
    select sum(population) into totalPopulation from administrative_divisions where region = regName;
    select sum(area) into totalArea from administrative_divisions where region = regName;
END //

DELIMITER ;