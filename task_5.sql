-- create database today;
-- use today;

-- create table tickets (
--     id INT AUTO_INCREMENT primary key,
--     title VARCHAR(60) NOT NULL,
--     priority ENUM('Low','Medium','High') NOT NULL
-- );

-- insert into tickets(title,priority)
-- VALUES
-- ('scan for viruses','Medium'),
-- ('scan for boot','High'),
-- ('create a new user','High'),
-- ('upgrade windows for 11 version','Low'),
-- ('install new game','Low');

-- alter table tickets
-- add completed BOOLEAN after priority;

-- update tickets
-- set completed = 0 where id = 5;

-- type: JSON
-- create table events(
--     id int auto_increment primary key,
--     event_name varchar(50),
--     visitor varchar(10),
--     properties JSON,
--     browser JSON
-- );

-- insert into events(event_name, visitor, properties, browser)
-- values
-- (
--     'pageview',
--     '1',
--     '{ "page": "/" }',
--     '{ "name": "Safari", "os": "Mac", "resolution": {"x": 1920, "y": 1080} }'
-- ),
-- (
--     'pageview',
--     '2',
--     '{ "page": "/contact" }',
--     '{ "name": "Firefox", "os": "Windows", "resolution": {"x": 2560, "y": 16000} }'
-- ),
-- (
--     'pageview',
--     '1',
--     '{ "page": "/products" }',
--     '{ "name": "Safari", "os": "Mac", "resolution": {"x": 1920, "y": 1080} }'
-- ),
-- (
--     'purchase',
--     '4',
--     '{ "amount": 150 }',
--     '{ "name": "Firefox", "os": "Windows", "resolution": {"x": 1280, "y": 800} }'
-- ),
-- (
--     'purchase',
--     '4',
--     '{ "amount": 500 }',
--     '{ "name": "Chrome", "os": "Windows", "resolution": {"x": 1680, "y": 1050} }'
-- );


select browser ->> '$.name' as browser, count(browser)
from events
group by browser ->> '$.name' ;