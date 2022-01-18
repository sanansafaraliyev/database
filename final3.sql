create database movies;
use movies;

create table movies(
    id INT(5) AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(55),
    category VARCHAR(25)
);

create table members(
    id INT(5) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    movie_id INT(5)
);


alter table members
    add constraint fk_members_id
    FOREIGN KEY(movie_id) references movies(id)
    on update cascade on delete RESTRICT;

INSERT INTO movies(title, category)
VALUES
('ASSASSINS CREED: EMBERS', 'Animations'),
('Real Steel(2012)',	'Animations'),
('Alvin and the Chipmunks', 'Animations'),
('The Adventures of Tin-Tin', 'Animations'),
('Safe (2012)', 'Action'),
('Safe House(2012)', 'Action'),
('GIA', '18+'),
('Deadline 2009', '18+'),
('The Dirty Picture', '18+'),
('Marley and me', 'Romance');


INSERT INTO members(first_name, last_name, movie_id)
VALUES
('Adam', 'Smith', 1),
('Rashid', 'Kumarbaz', 2),
('Susan', 'Davidson', 5),
('Jenny', 'Adrianna', 8),
('Jasmin',	'Sultan', 10);


/* inner join */

select members.`first_name`,members.`last_name`,movies.`title` from members,movies where movies.`id` = members.`movie_id`;

/* left outer join main is movie */

select A.`title`, B.`first_name`, B.`last_name` from `movies` as A LEFT join `members` AS B ON B.`movie_id` = A.`id` order by first_name;


select members.`first_name`,members.`last_name`,movies.`title` from members,movies where movies.`id` = members.`movie_id`;


select A.`title`, B.`first_name`,B.`last_name` from `movies` as A LEFT JOIN `members` as B ON B.`movie_id` = A.`id` order by first_name;