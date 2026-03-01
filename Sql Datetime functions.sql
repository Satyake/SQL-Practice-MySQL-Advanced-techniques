select current_date, current_timestamp

select * from my_events;

-- extract info about datetime values
with DOW as (
select event_name,event_date,event_datetime,
year(event_date) as event_year,
month(event_date) as event_month,
DAYOFWEEK(event_date) event_week
from my_events)
select *,
CASE  when event_week=1 then "Sunday"
when event_week=2 then "Monday"
when event_week=3 then "Tuesday"
when event_week=4 then "Wednesday"
when event_week=5 then "Thursday"
when event_week=6 then "Friday"
when event_week=7 then "Saturday"
else "Unknown" end as event_dow_name
from DOW
-- calculate an interval between datetime values
select event_name,event_date,event_datetime,
DATEDIFF(event_date, CURRENT_DATE) as dated_diff
from my_events
-- adding or subtracing interval

select event_name,event_date,event_datetime,
DATE_ADD(event_datetime, INTERVAL 1 DAY) as  plus_one_hour
from my_events







create table my_events(

event_name varchar(50),
event_date DATE,
event_datetime DATETIME,
event_type varchar(20),
event_desc VARCHAR(100)
)

INSERT INTO my_events (event_name, event_date, event_datetime, event_type, event_desc)
VALUES
('Annual Marathon', '2025-01-15', '2025-01-15 07:30:00', 'Sports', 'City-wide 10km and 21km marathon'),
('Tech Conference', '2025-02-10', '2025-02-10 09:00:00', 'Business', 'AI and Data Science conference'),
('Music Fest', '2025-03-05', '2025-03-05 18:00:00', 'Entertainment', 'Live performances by top artists'),
('Board Meeting', '2025-01-20', '2025-01-20 10:30:00', 'Corporate', 'Quarterly financial review meeting'),
('School Science Fair', '2025-04-12', '2025-04-12 11:00:00', 'Education', 'Student innovation showcase'),
('Product Launch', '2025-02-25', '2025-02-25 14:00:00', 'Business', 'Launch of new health product line');