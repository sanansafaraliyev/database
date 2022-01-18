CREATE TABLE stores(
store_id BIGINT PRIMARY KEY AUTO_INCREMENT,
store_name VARCHAR(50)
);
INSERT INTO stores (store_name) VALUES ('Philadelphia');
INSERT INTO stores (store_name) VALUES ('Galloway');

CREATE TABLE products(
product_id BIGINT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(40),
cost_price DOUBLE,
retail_price DOUBLE,
availability VARCHAR(5)
);
INSERT INTO products (product_name, cost_price, retail_price, availability) 
VALUES 
('WIRELESS MOUSE', '18.23', '30.25','ALL'),
('8 MP CAMERA', '60.40', '85.40','ALL'),
('SMART WATCH', '189.60', '225.30','LOCAL');

CREATE TABLE products_to_stores(
ref_id BIGINT PRIMARY KEY AUTO_INCREMENT,
product_id BIGINT,
store_id BIGINT
);

CREATE TABLE archived_products(
product_id BIGINT PRIMARY KEY ,
product_name VARCHAR(40),
cost_price DOUBLE,
retail_price DOUBLE,
availability VARCHAR(5)
);

CREATE TABLE products_price_history(
product_id BIGINT PRIMARY KEY AUTO_INCREMENT,
price_date DATETIME,
retail_price DOUBLE
);


# TAKS-1:
/* BEFORE INSERT trigger: The trigger will make sure that the retail price 
of a product is greater than the cost price whenever items are inserted 
into the products table. Otherwise, the database user will get an error. */

DELIMITER $$
create trigger before_insert_triggers
before insert on products for each row
BEGIN
    if new.retail_price >= new.cost_price
    THEN
        insert into products(product_name,cost_price,retail_price,availability)
        VALUES(new.product_name,new.cost_price,new.retail_price,new.availability);
    END IF;
    if new.retail_price < new.cost_price
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Password error'; 
    END IF;
END $$

DELIMITER ;