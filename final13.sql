select count(*), case
WHEN population > 5000000 THEN 'big'
WHEN population > 1000000 THEN 'medium'
ELSE 'small' END
as state_size from states group by state_size;



select concat(name,' ',surname) as "name/surname", case
WHEN gpa > 90 THEN 'A'
WHEN gpa > 80 THEN 'B'
WHEN gpa > 70 THEN 'C'
WHEN gpa > 60 THEN 'D'
ELSE 'F' END as "grade" from students;


select concat(students.student_name,', ',students.student_surname) as "stud_fullname", assignments.score,subjects.subject_name,subjects.teacher_name where subjects.subject_id = assignments.subject_id and students.student_id = assignments.student_id and assignments.score >= (select avg(assignments.score) from assignments) and subjects.subject_name LIKE 'Web Programming%' order by assignments.score;



select concat(students.student_name,', ',students.student_surname) as "fullname", assignments.score,subjects.subject_name,subjects.teacher_name where subjects.subject_id = assignments.subject_id and students.student_id = assignments.student_id and assignments.score >= (select avg(assignments.score) from assignments) and subjects.subject_name LIKE 'Web Programming%' order by assignments.score;


select group_concat(students.student_name,', ',students.student_surname) as "fullname", assignments.score,subjects.subject_name,subjects.teacher_name,assignments.t_year from students,assignments INNER JOIN subjects where assignments.student_id = students.student_id and assignments.subject_id = subjects.subject_id and assignments.score >= 90 and subjects.subject_name LIKE 'Web Programming%' group by subjects.subject_name;

select members.first_name, members.last_name, movies.title from members INNER JOIN movies where members.movie_id = movies.id;

select movies.title, members.first_name,members.last_name from movies LEFT JOIN members where members.movie_id = movies.id; 

select members.first_name, members.last_name,movies.title from movies RIGHT JOIN members on movies.id = members.movie_id;



DELIMITER //
create procedure getRegionName(
    in regName VARCHAR(40)
)
BEGIN
    select * from regions where region_name = regName;
END //
DELIMITER ;

DELIMITER //
create procedure GetCitiesByRegionNAme(
    in regName VARCHAR(50)
)
BEGIN
    select administrative_divisions.division_name,administrative_divisions.capital,administrative_divisions.population,administrative_divisions.area,regions.region_name from regions,administrative_divisions where regions.region_name = regName and regions.region_name = administrative_divisions.region;
END //
DELIMITER ;


DELIMITER //
create procedure CityCount(
    in regName VARCHAR(50),
    out total INT
)
BEGIN
    select count(*) into total from administrative_divisions where region = regName;
END //

DELIMITER ;


DELIMITER //
create procedure CapitalCities(
    in regName VARCHAR(50),
    out capitals INT,
    out noncapitals INT,
    out cities INT
)
BEGIN
    select count(capital) into capitals from administrative_divisions where region = regName;
    select count(*) into noncapitals from administrative_divisions where region = regName and capital is NULL;
    select count(division_name) into cities from administrative_divisions where region = regName;
END //
DELIMITER ;

