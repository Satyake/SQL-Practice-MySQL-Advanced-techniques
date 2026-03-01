select *,
DATE_ADD(order_date, interval 2 day) as ship_date
 from orders
where year(order_date)=2024 and month(order_date) between 4 and 6