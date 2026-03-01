CREATE TABLE baby_name (
    id INT PRIMARY KEY AUTO_INCREMENT,
    baby_name VARCHAR(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    babies INT NOT NULL,
    CHECK (gender IN ('M','F')),
    CHECK (babies >= 0),
    UNIQUE (baby_name, gender)
);


INSERT INTO baby_name (baby_name, gender, babies) VALUES
('Olivia', 'F', 15234),
('Emma', 'F', 14012),
('Liam', 'M', 16005),
('Noah', 'M', 15888);

select * from (
select gender, baby_name, babies ,
FIRST_VALUE(baby_name)
over(partition by gender order by babies desc) as top_name
from baby_name)  tn
where baby_name=top_name


select * from (
select gender, baby_name, babies ,
Nth_VALUE(baby_name,2)
over(partition by gender order by babies desc) as second_name
from baby_name)  tn
where baby_name=second_name


with popularity as (
select gender, baby_name, babies ,
ROW_NUMBER() 
over(partition by gender order by babies desc) as popularity
from baby_name  ) 
select * from popularity where popularity.popularity=2


