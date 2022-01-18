CREATE TABLE Sales1 (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);

INSERT INTO Sales1(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2001 Ferrari Enzo',140, 2021,1),
    ('1998 Chrysler Plymouth Prowler', 110,2021,1),
    ('1913 Ford Model T Speedster', 120,2021,1);


create TABLE SalesChanges1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    beforeSale INT,
    afterSale INT,
    changeat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
create trigger after_sale_changes
after update on Sales1 for each row
BEGIN
    if new.quantity <> old.quantity THEN
    insert into SalesChanges1(sale_id,beforeSale,afterSale)
    VALUES (old.id,old.quantity,new.quantity);
    END IF;
END //
DELIMITER ;
    