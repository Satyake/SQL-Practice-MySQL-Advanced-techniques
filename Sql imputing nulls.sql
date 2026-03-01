create table if not exists stock_prices(

date DATE PRIMARY KEY,
price DECIMAL (10,2)
);

insert into stock_prices(date, price)
values
('2024-11-01',678.27),
('2024-11-03',688.83),
('2024-11-04',688.83),
('2024-11-06', 591.01);

-- recursive CTE 
with recursive my_dates(dt) as (
select '2024-11-01'  union all
select dt+ INTERVAL 1 day from my_dates where dt<'2024-11-06')

select md.dt,sp.price 
from my_dates md
left join stock_prices sp
on md.dt=sp.date;

-- replace null 
-- replace as avg

with recursive my_dates(dt) as (
select '2024-11-01'  union all
select dt+ INTERVAL 1 day from my_dates where dt<'2024-11-06'), 
sp as (select md.dt,sp.price 
from my_dates md
left join stock_prices sp
on md.dt=sp.date)
select *, coalesce(price,600) as updated_price_600,
coalesce(price,(select avg(price) from sp)) as updated_price_avg,
coalesce(price, (lag(price,1) over(order by dt) ))  as lagged_price,
coalesce(price, (
(lag(price,1) over(order by dt) + lead(price,1) over(order by dt))/2 
))  as updated_price_smoothing

 from sp

select * from stock_prices

select *, coalesce(price, lag(price,1) over()) from stock_prices

-- hardcoded











