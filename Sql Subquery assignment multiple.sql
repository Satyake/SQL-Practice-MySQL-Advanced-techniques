-- Subquery multiple Assignment
-- Return the factories, product names from the factoru
-- and number of products produced by each factory 



select * from products

select p.factory, p.product_name , fact_prod_grp.num_products
 from products p
left join (
select count(distinct product_id) as num_products, factory from products
group by factory
) as fact_prod_grp  on
fact_prod_grp.factory=p.factory

select count(distinct product_id) as num_products, factory from products
group by factory

-- subqueries in the from clause
-- return the factories, product names from the factory

select factory, product_name from products
-- All factories and their total number of products
select factory, count(product_id) as num_products from products
group by factory

-- caping it all together

select fp.factory, fp.product_name , fnp.num_products from 
(select factory, product_name from products) fp
left join (
select factory, count(product_id) as num_products from products
group by factory ) as fnp

on fp.factory=fnp.factory 
order by fp.factory, fp.product_name








-- and number of products produced by each factory










