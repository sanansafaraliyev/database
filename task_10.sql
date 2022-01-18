DELIMITER //
create procedure Getofficeby(
    IN countryName VARCHAR(30)
)

BEGIN
    select * from regions
    where region_name = countryName;

END //
DELIMITER ;

call Getofficeby('Aran');


DELIMITER //
create procedure sanan(
    IN capitalName VARCHAR(50)
)

BEGIN
    select * from administrative_divisions
    where capital = capitalName;
END //

DELIMITER ;

call sanan("Astara");


-- DELIMITER $$
-- create procedure countPOP(
--     IN regionName VARCHAR(40),
--     out total INT

-- )

-- BEGIN
--     select sum(population) into total from administrative_divisions
--     where region = regionName;

-- END$$
-- DELIMITER ;

-- call countPOP('Aran',@total);
-- select @total;


DELIMITER $$
create procedure population_count(
    IN regionName VARCHAR(40),
    out result INT
)
BEGIN
    select count(capital) into result from administrative_divisions
    where region = regionName;
END$$
DELIMITER ;

call population_count("Ganja-Qazakh",@total);
