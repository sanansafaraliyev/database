-- with out and in 
-- procedure 5
-- get total sum of population and total area of each region

DELIMITER $$

create procedure GetAreaPopulationbyRegion(
    IN regName VARCHAR(30),
    OUT totalPopulation INT,
    OUT totalArea FLOAT(10,2)
)

BEGIN 
-- sum of population
    Select sum(population)
    into totalPopulation
    from administrative_divisions
    where region = regName;
-- sum of area
    select sum(area)
    into totalArea
    from administrative_divisions
    where region = regName;
END $$
DELIMITER ;

call GetAreaPopulationbyRegion("Shaki-Zaqatala",@totalPopulation,@totalArea);


-- custom function

DELIMITER $$
create function REgionSize(
    population INT
)

RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    DECLARE regionSize VARCHAR(20);
    if population >= 10000000 THEN
    set regionSize = 'big region';
    ELSEIF population < 10000000 THEN
    set regionSize = 'small_region';
    END IF;
RETURN (regionSize);
END$$
DELIMITER ;
