-- DELIMITER $$
-- create function RegionSize(
--     population INT
-- )
-- returns VARCHAR(20)
-- DETERMINISTIC
-- BEGIN
--     declare regionSize VARCHAR(20);

--     if population >= 1000000 THEN
--         set regionSize = 'big region';
--     elseif population < 1000000 THEN
--         set regionSize = 'small region';
--     END IF;
--         return (regionSize);
-- END $$

-- DELIMITER ;

DELIMITER $$
create function getPercentageArea(
    area_of_region INT
)
returns float
DETERMINISTIC
BEGIN
    declare per_area float;

    set per_area = round(((area_of_region / (select sum(area) from azerbaijan.regions))* 100),2);
    return per_area;
END $$
DELIMITER ;
