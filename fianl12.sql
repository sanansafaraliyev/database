select * from nobel where year = '1970';

select * from nobel where year = '1971' and subject = 'Literature';

select year,subject from nobel where winner = 'Dennis Gabor';

select winner from nobel where subject = 'Physics' and year >= 1950;

select * from nobel where subject = 'Chemistry' and year >= 1965 and year <= 1975;

select * from nobel where category = 'Prime Minister' and year >= 1972 and (winner = 'Menachem Begin' or winner = 'Yitzhak Rabin');

select * from nobel where winner LIKE 'Louis%';

select * from nobel where winner = 'Johannes Georg Bednorz';

select * from nobel where year = '1970' order by
case
    when subject in ("Economics","Chemistry") then 1 else 0
    end desc,
subject,winner;