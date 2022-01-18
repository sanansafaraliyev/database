DELIMITER //
create function getregionsize(
    population INT
)
returns VARCHAR(20)
DETERMINISTIC
BEGIN
    declare regionSize VARCHAR(20);
    if population >= 1000000 THEN set regionSize = 'big_region';
    elseif population < 1000000 THEN set regionSize = 'small_region';
    END IF;
    return (regionSize);
END //
DELIMITER ;


DELIMITER //
create function getpercentage(
    area_of_region INT
)
returns float
DETERMINISTIC
BEGIN
    declare are_per float;
    set are_per = round(((area_of_region / (select sum(area) from azerbaijan.regions))*100),2);
    return are_per;
END //

DELIMITER ;