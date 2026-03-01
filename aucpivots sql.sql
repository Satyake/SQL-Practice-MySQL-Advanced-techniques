DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
    txn_id INT PRIMARY KEY,
    score DECIMAL(5,4),
    fraud_flag INT,
    category VARCHAR(20)
);
INSERT INTO transactions (txn_id, score, fraud_flag, category) VALUES
(1, 0.97, 1, 'Online'),
(2, 0.95, 1, 'Online'),
(3, 0.93, 1, 'Mobile'),
(4, 0.91, 0, 'POS'),
(5, 0.89, 1, 'Online'),
(6, 0.87, 0, 'POS'),
(7, 0.85, 1, 'Mobile'),
(8, 0.82, 0, 'Online'),
(9, 0.80, 0, 'POS'),
(10, 0.78, 1, 'Online'),
(11, 0.75, 0, 'Mobile'),
(12, 0.73, 0, 'POS'),
(13, 0.70, 1, 'Online'),
(14, 0.68, 0, 'POS'),
(15, 0.65, 0, 'Mobile'),
(16, 0.62, 0, 'Online'),
(17, 0.60, 1, 'POS'),
(18, 0.55, 0, 'Online'),
(19, 0.50, 0, 'Mobile'),
(20, 0.45, 0, 'POS'),
(21, 0.40, 0, 'Online'),
(22, 0.35, 0, 'Mobile'),
(23, 0.30, 0, 'POS'),
(24, 0.25, 0, 'Online'),
(25, 0.20, 0, 'Mobile');

select * from transactions


select  binned.category,
binned.binned_scores, 
sum(case when fraud_flag=1 then 1 else 0 end)as frauds,
sum(case when fraud_flag=0 then 1 else 0 end) as no_frauds,
count(binned_scores) as scored_transactions
from 
(select *,
case when score>0.90 then '0.90 - 1.00'
when score >=0.80 then '0.90 - 0.89'
when score >=0.70 then '0.70 -0.79'
else 0.0 - 0.69
end as binned_scores
from transactions) binned
group by binned.binned_scores, binned.category

















