select top 10 * from application_train
select top 10 * from credit_card_balance

select AVG(
convert(decimal(9,2),AMT_BALANCE)/convert(decimal(9,2),AMT_CREDIT_LIMIT_ACTUAL) ) as AVG_CREDIT_USAGE, SK_ID_CURR
from credit_card_balance where convert(decimal(9,2),AMT_CREDIT_LIMIT_ACTUAL) > 0.0
group by SK_ID_CURR

select AVG(convert(decimal(9,2),ISNULL(AMT_PAYMENT_CURRENT,0.00))/convert(decimal(9,2),ISNULL(AMT_INST_MIN_REGULARITY,0.00))) as AVG_PAYMENT_COMPARED_TO_MINIMUM, SK_ID_CURR from credit_card_balance
where convert(decimal(9,2),ISNULL(AMT_INST_MIN_REGULARITY,0.00)) > 0
group by SK_ID_CURR

select count(*) as TOTAL_UNDERPAYMENTS, SK_ID_CURR FROM credit_card_balance 
where convert(decimal(9,2),ISNULL(AMT_PAYMENT_CURRENT,0.00)) < convert(decimal(9,2),ISNULL(AMT_INST_MIN_REGULARITY,0.00))
group by SK_ID_CURR

select count(*) as TOTAL_PAYMENTS, SK_ID_CURR FROM credit_card_balance 
group by SK_ID_CURR

select min(convert(decimal(9,2),Months_balance)), sk_id_curr from credit_card_balance group by SK_ID_CURR