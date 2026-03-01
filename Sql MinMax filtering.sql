-- return the most recent sales amount for each sales rep
CREATE TABLE sales (
    id INT PRIMARY KEY,
    sales_rep VARCHAR(50),
    date DATE,
    sales INT
);

INSERT INTO sales (id, sales_rep, date, sales) VALUES
(1, 'Emma', '2024-08-01', 6),
(2, 'Emma', '2024-08-02', 17),
(3, 'Jack', '2024-08-02', 14),
(4, 'Emma', '2024-08-04', 20),
(5, 'Jack', '2024-08-05', 5),
(6, 'Emma', '2024-08-07', 1);


select *  from sales;
-- return most recent sales amount for each sales
-- rep
select sales_rep, max(date) as most_recent_date
 from sales
group by sales_rep

-- group by approach
with grouped_date as (
select sales_rep, max(date) as most_recent_date
 from sales
group by sales_rep)
select * from grouped_date g left join
sales s on s.sales_rep=g.sales_rep
and g.most_recent_date=s.date;