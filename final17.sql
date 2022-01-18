CREATE TABLE Salaries1 (
    employeeNumber INT PRIMARY KEY,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0
);

INSERT INTO Salaries1(employeeNumber,validFrom,amount)
VALUES
    (1002,'2000-01-01',50000),
    (1056,'2000-01-01',60000),
    (1076,'2000-01-01',70000);

create TABLE SalaryArchive1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employe_id INT,
    validFrom DATE,
    amount DEC(12,2) DEFAULT 0,
    deletedat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
create trigger before_delete_salary
before delete on Salaries1 for each row
BEGIN
    insert into SalaryArchive1(employe_id,validFrom,amount)
    VALUES(old.employeeNumber,old.validFrom,old.amount);
END //
DELIMITER ;