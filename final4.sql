create database university;
use university;

create table students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50),
    student_surname VARCHAR(50),
    faculty varchar(30)
);

create table subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(50),
    teacher_name VARCHAR(50)
);


create table assignments(
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_id INT,
    student_id INT,
    score INT(2),
    term VARCHAR(40),
    t_year INT(4)    
);

/* alter table assignments for foreign key subject_ID */
alter table assignments
    add constraint fk_subject_id
    foreign key(subject_id) references subjects(subject_id)
    on update cascade on delete RESTRICT;

alter table assignments
    add constraint fk_student_id
    foreign key(student_id) references students(student_id)
    on update cascade on delete RESTRICT;

INSERT INTO students
VALUES
(NULL, 'Farid', 'Mammadov', 'engineering'),
(NULL, 'Lamiya', 'Mammadova', 'engineering'),
(NULL, 'Ilkin', 'Alizade', 'engineering'),
(NULL, 'Arzu', 'Aliyeva', 'computer science'),
(NULL, 'Rufat', 'Mammadov', 'engineering'),
(NULL, 'Nijat', 'Mammadov', 'engineering'),
(NULL, 'Shabnam', 'Bakshaliyeva', 'computer science'),
(NULL, 'Binnet', 'Musayev', 'computer science');



INSERT INTO subjects
VALUES
(NULL, 'Web Programming 1', 'Mahammad Sharifov'),
(NULL, 'Web Programming 2', 'Mahammad Sharifov'),
(NULL, 'Object Oriented Programming', 'Rashad Khaligov'),
(NULL, 'Fundamentals Of Algorithms', 'Javad Mehri'),
(NULL, 'Introduction To Computer Science', 'Nuru Safarov'),
(NULL, 'Multimedia Systems', 'Mahammad Sharifov'),
(NULL, 'Computer Applications', 'Etibar Rzazadeh'),
(NULL, 'Computer Graphics', 'Javad Mehri');


INSERT INTO assignments
VALUES
(NULL, 1, 1, 96, 'fall', 2015),
(NULL, 1, 2, 90, 'fall', 2015),
(NULL, 1, 3, 76, 'fall', 2015),
(NULL, 1, 4, 98, 'fall', 2015),
(NULL, 1, 5, 86, 'fall', 2015),
(NULL, 1, 6, 91, 'fall', 2015),
(NULL, 2, 1, 94, 'spring', 2016),
(NULL, 2, 4, 76, 'spring', 2016),
(NULL, 2, 5, 63, 'spring', 2016),
(NULL, 2, 8, 73, 'spring', 2016),
(NULL, 3, 5, 63, 'spring', 2016),
(NULL, 3, 6, 73, 'spring', 2016),
(NULL, 3, 7, 88, 'spring', 2016),
(NULL, 3, 8, 43, 'spring', 2016),
(NULL, 4, 1, 63, 'fall', 2015),
(NULL, 4, 2, 53, 'fall', 2015),
(NULL, 4, 3, 77, 'fall', 2015),
(NULL, 4, 4, 78, 'fall', 2015),
(NULL, 4, 5, 80, 'fall', 2015),
(NULL, 4, 6, 69, 'fall', 2015),
(NULL, 4, 7, 33, 'fall', 2015),
(NULL, 4, 8, 63, 'fall', 2015),
(NULL, 5, 1, 63, 'fall', 2015),
(NULL, 5, 5, 73, 'fall', 2015),
(NULL, 5, 8, 97, 'fall', 2015),
(NULL, 6, 2, 73, 'spring', 2016),
(NULL, 6, 3, 83, 'spring', 2016),
(NULL, 6, 5, 55, 'spring', 2016),
(NULL, 6, 6, 75, 'spring', 2016),
(NULL, 6, 7, 85, 'spring', 2016),
(NULL, 6, 8, 77, 'spring', 2016);


select subjects.teacher_name, subjects.subject_name, assignments.t_year from subjects, assignments where subjects.subject_id = assignments.subject_id AND subjects.teacher_name = 'Mahammad Sharifov' group by subjects.subject_name;

select CONCAT(S.student_name,S.student_surname SEPARATOR ', ') as stud_name, A.score, C.subject_name, C.teacher_name, A.t_year from students as S, subjects AS C, assignments AS C whereC.subject_ID = A.subject_ID and S.student_id = A.student_id AND A.score >= (select AVG(A.score) from assignments) AND C.subject_name LIKE 'Web Programming%' order by A.score; 


SELECT CONCAT_WS(', ', S.student_name,  S.student_surname) AS stud_name,
A.score, C.subject_name, C.teacher_name, A.t_year
FROM students AS S, subjects AS C, assignments AS A
WHERE 
C.subject_id = A.subject_id
AND 
S.student_id = A.student_id
AND 
A.score >= (SELECT AVG(A.score) FROM assignments)
AND 
C.subject_name LIKE 'Web Programming%'
ORDER BY A.score;


select CONCAT(students.student_name,". ",students.student_surname) as stud_name, assignments.score,subjects.subject_name,subjects.teacher_name, assignments.t_year from subjects,assignments,students where subjects.subject_id = assignments.subject_id,students.student_id = assignments.student_id AND assignments.score >= (select avg(assignments.score) from assignments) AND subjects.subject_name like 'Web Programming' order by assignments.score;


SELECT GROUP_CONCAT(students.student_name,  students.student_surname) AS advanced_students,
assignments.score, subjects.subject_name, subjects.teacher_name, assignments.t_year
FROM students, subjects, assignments
WHERE 
subjects.subject_id = assignments.subject_id
AND 
students.student_id = assignments.student_id
AND assignments.score >= 90
AND subjects.subject_name LIKE 'Web Programming%'
GROUP BY subjects.subject_name;


select GROUP_CONCAT(students.student_name,' ',students.student_surname) as advanced_students, assignments.score, subjects.subject_name, subjects.teacher_name,assignments.t_year from students,subjects,assignments where students.student_id = assignments.student_id AND subjects.subject_id = assignments.subject_id and assignments.score >= 90 and subjects.subject_name like 'Web Programming%' group by subjects.subject_name;