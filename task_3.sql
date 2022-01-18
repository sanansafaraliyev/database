-- -- create region table and assign attributes
-- create table regions(
--     regionID INT(2) AUTO_INCREMENT PRIMARY KEY,
--     regionName VARCHAR(30) NOT NULL,
--     area FLOAT(10,2) NOT NULL,
--     population INT(10)
-- );

-- -- insert values
-- insert into regions (regionName,area,population)
-- values
-- ("Absheron",5.420,2613000),
-- ("Ganja-Qazakh",12.480,1191700);

-- -- add new column
-- alter table regions
-- add capital VARCHAR(25) after regionName;

-- -- add records into new column
-- update regions
-- set capital = "Baku"
-- where regionName = "Absheron";

-- update regions
-- set capital = "Ganja"
-- where regionName = "Ganja-Qazakh";

-- Task 1
-- select regionName,capital from regions;

-- -- add new values into table
-- insert into regions (regionName,area,population)
-- VALUES
-- ("Shaki-Zaqatala",8.969,543400),
-- ("Lankaran",6.140,926500);

-- Task 2
-- select * from regions where area > 6.00;

-- update regions
-- set capital = "Shaki"
-- where regionName = "Shaki-Zaqatala";

-- update regions
-- set capital = "Lankaran"
-- where regionName = "Lankaran";

-- using select statement, equal, not equal, or, like, limit, offset
-- Task 3
-- select * from regions where capital != "Ganja";

-- Task 4
-- select * from regions where (regionName = "Absheron" or capital = "Shaki");

-- -- Task 5
-- select * from regions where regionName like '%a%';

-- Task 6
-- select * from regions order by area desc;

-- Task 7
-- select * from regions limit 2;

-- Task 8
-- select * from regions limit 1,3;