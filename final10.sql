CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE| DELETE }
ON table_name FOR EACH ROW
trigger_body;


First, specify the name of the trigger that you want to create after the CREATE TRIGGER
keywords. Note that the trigger name must be unique within a database.
• Next, specify the trigger action time which can be either BEFORE or AFTER which indicates 
that the trigger is invoked before or after each row is modified.
• Then, specify the operation that activates the trigger, which can be INSERT, UPDATE, or 
DELETE.
• After that, specify the name of the table to which the trigger belongs after the ON keyword.
• Finally, specify the statement to execute when the trigger activates. If you want to execute 
multiple statements, you use the BEGIN END compound statement.

CREATE TABLE employees_audit (
 id INT AUTO_INCREMENT PRIMARY KEY,
 employeeNumber INT NOT NULL,
 lastname VARCHAR(50) NOT NULL,
 changedat DATETIME DEFAULT NULL,
 action VARCHAR(50) DEFAULT NULL
);


create table salaries(
    employeeNumber INT PRIMARY KEY,
    validFrom Date NOT NULL,
    amount DEC(12,2) NOT NULL DEFAULT 0
);

INSERT INTO salaries(employeeNumber,validFrom,amount)
VALUES
    (1002,'2000-01-01',50000),
    (1056,'2000-01-01',60000),
    (1076,'2000-01-01',70000);

create table SalaryArchive(
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT,
    validFrom Date NOT NULL,
    amount DEC(12,2) NOT NULL DEFAULT 0,
    deletedAt TIMESTAMP DEFAULT NOW()
);

DELIMITER $$
create trigger before_salaries_delete
BEFORE DELETE on salaries FOR EACH ROW
BEGIN
    INSERT INTO SalaryArchive(employeeNumber,validFrom,amount)
    VALUES (OLD.employeeNumber,OLD.validFrom,OLD.amount);
END $$

DELIMITER ;

DELIMITER $$
create trigger after_salaries_update
after INSERT on salaries for each row
BEGIN
    INSERT INTO SalaryArchive(employeeNumber,validFrom,amount)
    VALUES(new.employeeNumber,new.validFrom,new.amount);
END $$

DELIMITER ;


create table users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    age INT
);

DELIMITER $$
create trigger must_be_adult
before insert on users for each row
BEGIN
    if new.age < 18
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'MUST BE AN ADULT!';
    END IF;
END $$

DELIMITER ;


create table customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
);

DELIMITER $$
create trigger check_password
before update on customers for each row
BEGIN
    if new.password = old.password
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Password error';
    END IF;
END $$

DELIMITER ;






DELIMITER $$
create trigger after_sales_update
after update on salaries for each row
BEGIN
    if old.quantity <> new.quantity
    THEN 
        insert into SalesChanges(salesID,beforeQuantity,afterQuantity)
        VALUES(old.id,old.quantity,new.quantity)
    END IF;
END $$

DELIMITER ;


DELIMITER $$
create trigger after_members_insert
after insert on members for each row
BEGIN
    if new.birthDate is NULL
    insert into reminders(memberID,message)
    VALUES(new.id,CONCAT('HI ',new.name,' ,please update your birth date'));
    END IF;
END $$

DELIMITER ;