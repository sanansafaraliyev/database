-- CREATE DATABASE classwork5;
-- use classwork5;

-- create table STUDENTS(
--     student_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(50),
--     surname VARCHAR(50),
--     age INT,
--     department VARCHAR(150),
--     gpa FLOAT(1),
--     birth_city VARCHAR(150),
--     KEY(birth_city)
-- );

-- insert into STUDENTS(name, surname, age, department, gpa, birth_city)
-- VALUES
-- ('Mazahir', 'Mammadov', 19, 'Information Security', 92, 'Moscow'),
-- ('Asmar', 'Shikhamirli', 19, 'Information Security', 92, 'Gakh'),
-- ('Asmar', 'Hajizada', 19, 'Information Security', 93, 'Gazakh'),
-- ('Artoghrul', 'Yusifli', 18, 'Information Security', 73, 'Shaki'),
-- ('Nihat', 'Aliyev', 18, 'Information Security', 81, 'Shaki'),
-- ('Ipak', 'Mammadli', 21, 'Computer Engineering', 95, 'Ordubad'),
-- ('Javahir', 'Mammadli', 23, 'Computer Engineering', 97, 'Ordubad'),
-- ('Malak', 'Susanli', 21, 'Computer Engineering', 53, 'Ordubad'),
-- ('Eshgin', 'Hasanov', 19, 'Information Security', 73, 'Tovuz'),
-- ('Isgandar', 'Isgandarov',19, 'Information Security', 99, 'Baku'),
-- ('Nilufar', 'Seyidli',19, 'Economics', 100, 'Sumgayit'),
-- ('Elmir', 'Yusifli',20, 'Economics', 55, 'Baku'),
-- ('Fuad', 'Hajiyev',19, 'Economics', 89, 'Sumgayit'),
-- ('Javidan', 'Zeynalov',19, 'Chemical Engineering', 100, 'Moscow'),
-- ('Mehin', 'Huseyn',19, 'Chemical Engineering', 65, 'Baku'),
-- ('Farman', 'Ahmadov',19, 'Chemical Engineering', 99, 'Ganja'),
-- ('Azer', 'Verdiyev',19, 'Chemical Engineering',82, 'Ganja'),
-- ('Asiman', 'Hamzayev',18, 'Mathematics', 79, 'Ismayilli');

-- Task 1
-- select CONCAT(name,',',surname) as full_name,birth_city from students;

-- Task 2
-- select CONCAT(SUBSTRING(surname,1,1),'--',name,'--',age) as details,birth_city from students;

-- Task 3
-- select GROUP_CONCAT(SUBSTRING(surname,1,1),'.',name) as full_name,birth_city from students group by birth_city;

-- Task 4
-- select GROUP_CONCAT(SUBSTRING(surname,1,1),'.',name,' ',age) as detail,department from students group by department;

-- Task 5
-- select MIN(gpa),MAX(gpa),AVG(gpa) from students;

-- Task 6
-- select name,gpa from students where gpa >= (select AVG(gpa) from students);

-- Task 7
-- select department,COUNT(*) from students group by department;

-- Task 8
-- select AVG(GPA),birth_city from students group by birth_city;

-- Task 9
select CONCAT(name,',',surname) as full_name,department,gpa,
CASE
    When gpa >= 91 then "A"
    When gpa >=81 then "C"
    ELSE "D" END
as gpa_rate
from students;