CREATE TABLE pizza_table (
    category VARCHAR(50),
    crust_type VARCHAR(50),
    pizza_name VARCHAR(100),
    price DECIMAL(5, 2)
);

INSERT INTO pizza_table (category, crust_type, pizza_name, price) VALUES
('Chicken', 'Gluten-Free Crust', 'California Chicken', 21.75),
('Chicken', 'Thin Crust', 'Chicken Pesto', 20.75),
('Classic', 'Standard Crust', 'Greek', 21.50),
('Classic', 'Standard Crust', 'Hawaiian', 19.50),
('Classic', 'Standard Crust', 'Pepperoni', 18.75),
('Supreme', 'Standard Crust', 'Spicy Italian', 22.75),
('Veggie', 'Thin Crust', 'Five Cheese', 18.50),
('Veggie', 'Thin Crust', 'Margherita', 19.50),
('Veggie', 'Gluten-Free Crust', 'Garden Delight', 21.50
);

select * ,
case when crust_type='Standard Crust' then 1 else 0  end as standard_crust,
case when crust_type='Thin Crust' then 1 else 0  end as thin_crust,
case when crust_type='Gluten-Free Crust' then 1 else 0  end as thin_crust

 from pizza_table
 
 
 
 
select category ,
sum(case when crust_type='Standard Crust' then 1 else 0  end) as standard_crust,
sum(case when crust_type='Thin Crust' then 1 else 0  end) as thin_crust,
sum(case when crust_type='Gluten-Free Crust' then 1  else 0  end) as thin_crust
 from pizza_table
 group by category