create database papers;
use papers;

create table students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50)
);

create table paper (
    title VARCHAR(100) PRIMARY KEY,
    grade INT,
    student_id INT,
    foreign key(student_id) references students(id)
    on delete CASCADE
    on update CASCADE
);

INSERT INTO students (firstName) VALUES 
    ('Roya'), 
    ('Emiliya'), 
    ('Ilkay'), 
    ('Sevilay'), 
    ('Lisa');
     
INSERT INTO paper (student_id, title, grade ) VALUES
    (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (3, 'Introduction to Programming', 94),
    (3, 'The history of Ottoman Empiry', 98),
    (4, 'Magical Realism', 89);

