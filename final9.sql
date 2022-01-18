DROP DATABASE IF EXISTS uniDBMS;
CREATE DATABASE uniDBMS;
USE uniDBMS;



CREATE TABLE instructor(
instructorID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
instructorName VARCHAR(30) NOT NULL,
jobType VARCHAR(30) NOT NULL,
departmentID INT(3) UNSIGNED NOT NULL
);

CREATE TABLE department(
departmentID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
departmentName VARCHAR(30) NOT NULL
);

CREATE TABLE course(
courseID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
courseName VARCHAR(30) NOT NULL,
instructorID INT(3) UNSIGNED NOT NULL
);

CREATE TABLE student(
studentID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
studentDOB INT(5) NOT NULL,
studentName VARCHAR(30) NOT NULL,
studentSurname VARCHAR(30) NOT NULL
);

CREATE TABLE enrollment(
courseID INT(3) UNSIGNED NOT NULL,
studentID INT(3) UNSIGNED NOT NULL
);


ALTER table instructor
ADD CONSTRAINT department_fk
FOREIGN KEY (departmentID) REFERENCES department(departmentID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER table course
ADD CONSTRAINT instructor_fk
FOREIGN KEY (instructorID) REFERENCES instructor(instructorID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER table enrollment
ADD CONSTRAINT course_fk
FOREIGN KEY (courseID) REFERENCES course(courseID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER table enrollment
ADD CONSTRAINT student_fk
FOREIGN KEY (studentID) REFERENCES student(studentID)
ON UPDATE CASCADE
ON DELETE CASCADE;



INSERT INTO department (departmentName)
VALUES
("IT"),
("PAM"),
("NQ");

INSERT INTO instructor (instructorName, jobType, departmentID)
VALUES
("Elvira Kerimova", "full-time", 3),
("Sultan Memmedova", "part-time", 2),
("Sevil Yunisova", "full-time", 2);

INSERT INTO course (courseName, instructorID)
VALUES
("Math", 2),
("English", 2),
("Technology", 1),
("Helth and Safety", 3);

INSERT INTO student (studentDOB, studentName, studentSurname)
VALUES
("1999", "name_111", "surname_111"),
("2000", "name_222", "surname_222"),
("2001", "name_333", "surname_333"),
("2002", "name_444", "surname_444"),
("2003", "name_555", "surname_555");

INSERT INTO enrollment (courseID, studentID)
VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 3),
(1, 4),
(2, 5),
(3, 1),
(2, 3),
(3, 4),
(1, 5),
(3, 2),
(1, 2);


select course.courseName,group_concat(student.studentName," ") as names,count(student.studentName) as count from student,course,enrollment where course.courseID = enrollment.courseID and student.studentID = enrollment.studentID group by course.courseName;


/* to find age of students */

DELIMITER $$
create function getAge(
    date_of_birth INT
)
returns INT
DETERMINISTIC
BEGIN
    declare age INT;

    set age = 2022 - date_of_birth;
    return age;
END $$

DELIMITER ;
