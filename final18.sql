create table usernames(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40),
    surname VARCHAR(40),
    age INT
);


DELIMITER //
create trigger check_usernames
before insert on usernames for each row
BEGIN
    if new.age < 18 THEN
        SIGNAL SQLSTATE '45000'
        set MESSAGE_TEXT = "Age must be 18 +";
    END IF;
END //

DELIMITER ;