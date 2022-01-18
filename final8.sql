DELIMITER $$
create function getProfit(
    cost FLOAT,
    price FLOAT
)
returns DECIMAL(10,2)
DETERMINISTIC
BEGIN
    declare profit DECIMAL(10,2);

    set profit = price - cost;
    return profit;

END $$
DELIMITER ;