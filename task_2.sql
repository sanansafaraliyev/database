create table nobel (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    year INT,
    subject VARCHAR(30),
    winner VARCHAR(50),
    country VARCHAR(50),
    category VARCHAR(30)
);

insert into nobel
VALUES
(NULL,1970,"Physics","Hannes Alfven","Sweden","Scientist"),
(NULL,1970,"Physics","Louis Neel","France","Scientist"),
(NULL,1970,"Chemistry","Luis Federico Leloir","France","Scientist"),
(NULL,1970,"Physiology","Ulf Von Euler","Sweden","Scientist"),
(NULL,1970,"Physiology","Bernard Katz","Germany","Scientist"),
(NULL,1970,"Literature","Aleksandr Solyzhenitsyn","Russia","Linguist"),
(NULL,1970,"Economics","Paul Samuelson","USA","Economist"),
(NULL,1970,"Physiology","Julius Axelrold","USA","Scientist"),
(NULL,1971,"Physics","Dennis Gabor","Hungary","Scientist"),
(NULL,1971,"Chemistry","Gerhard herzberg","Germany","Scientist"),
(NULL,1971,"Peace","Willy Brandth","Germany","Chancellor"),
(NULL,1971,"Literature","Pablo Neruda","Chile","Linguist"),
(NULL,1971,"Economics","Simon Kuznets","Russia","Economist"),
(NULL,1978,"Peace","Menachmen Begin","Israel","Prime Minister"),
(NULL,1978,"Peace","Anwar Al-Sadat","Egypt","President"),
(NULL,1987,"Chemistry","Jean-Marie Lehn","USA","Scientist"),
(NULL,1987,"Chemistry","Donald J. Cram","USA","Scientist"),
(NULL,1987,"Physiology","Susumu Tonegawa","Japan","Scientist"),
(NULL,1994,"Economics","Reinhard Selten","Germany","Economist"),
(NULL,1994,"Peace","Yithzak Rabin","Israel","Prime Minister"),
(NULL,1987,"Physics","Johannas Georg Bednorz","Germany","Scientist"),
(NULL,1987,"Economics","Robert Slow","USA","Economist"),
(NULL,1987,"Literature","Joseph Brodsky","Russia","Linguist"),
(NULL,1994,"Literature","Kenzaburo Oe","Japan","Linguist");


-- Task 1
-- select * from nobel where year = 1970;

-- Task 2
-- select winner from nobel where ( year = 1971 and subject = 'Literature');

-- Task 3
-- select year, subject from nobel where winner = 'Dennis Gabor';

-- Task 4
-- select winner from nobel where (subject = 'Physics' and year >= 1950);

-- Task 5
-- select * from nobel where (subject = 'Chemistry' and year >= 1965 and year <= 1975);

-- Task 6
-- select * from nobel where (category = 'Prime Minister' and (winner = 'Menachem Begin' or winner = 'Yithzak Rabin') and year >=1972);

-- Task 7
-- select * from nobel where winner like 'Louis%';

-- Task 8
-- select * from nobel where (winner = 'Johannas Georg Bednorz');

-- Task 9
select * from nobel where year = 1970
order by
    case
        when subject in ("Economics","Chemistry") then 1
        else 0
    end asc,
    subject,
    winner;
