-- view all products from Wicked Choccy's

select * from products where factory="Wicked Choccy's";
-- return products where the unit price is less 
-- than the unit price of all products from wicked choccoys
select product_name from products where 
unit_price < ALL (select unit_price from products
where factory="Wicked Choccy's")
