-- Task 1
-- select CONCAT(division_name,",",capital),population as capitals from administrative_divisions;

-- Task 2
-- select CONCAT_WS('-',division_name,capital) as capitals from administrative_divisions;

-- Task 3
-- select CONCAT(SUBSTRING(division_name,1,10),"...") as division_short from administrative_divisions;

-- Task 4
-- select CONCAT(SUBSTRING(division_name,1,4),"...") as divis, CONCAT(SUBSTRING(capital,1,3),"...") as caps from administrative_divisions;

-- Task 5
-- select REPLACE(capital,'A','AAA') as new_col from administrative_divisions;

-- Task 6
-- select CONCAT('My favorite city is','--',UPPER(capital)) as sentence from administrative_divisions;
