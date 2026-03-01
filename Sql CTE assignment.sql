-- return orders over 200$
select * from orders;
select * from products;


with df as(
select o.order_id, o.product_id, o.units ,
p.unit_price
from orders o
inner join products p 
on p.product_id=o.product_id),
df1 as (
select sum(df.units*df.unit_price)  as TotalPrice,
df.product_id, df.order_id
 from df group by df.product_id, df.order_id
  having sum(df.units*df.unit_price) >200
 order by  sum(df.units*df.unit_price) desc
 )
 
 select count(*) from df1


-- multiple CTEs
with hs23 as (
select * from happiness_scores where year=2023),
hs24 as (
select * from happiness_scores_current),
hs_join as (
select hs23.country,
hs23.happiness_score as hs_2023,
hs24.ladder_score as hs_2024
 from hs23 left join hs24 on
hs23.country=hs24.country)
select * from hs_join where hs_join.hs_2024>hs_join.hs_2023;
-- rewrite the one below using CTE
select fp.factory, fp.product_name , fnp.num_products from 
(select factory, product_name from products) fp
left join (
select factory, count(product_id) as num_products from products
group by factory ) as fnp

on fp.factory=fnp.factory 
order by fp.factory, fp.product_name

with counter_pr as (
select factory, count(product_id) as num_products from products
group by factory ),
fp as(
select factory, product_name from products)
select fp.factory, fp.product_name, counter_pr.num_products
from fp left join counter_pr on 
counter_pr.factory=fp.factory








