CREATE TABLE members1 (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    birthDate DATE,
    PRIMARY KEY (id)
);

create TABLE reminders1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    message VARCHAR(100)
);


DELIMITER //
create trigger after_insert_remind
after insert on members1 for each row
BEGIN
    if new.birthDate is NULL THEN
    insert into reminders1(name,message)
    VALUES
    (new.name,concat("Hi, ",new.name,', please update birtday date!'));
    END IF;
END //
DELIMITER ;