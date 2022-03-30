SELECT DISTINCT(TO_CHAR(payment_date, 'month')) FROM payment

--no of payments that are occured on monday :
SELECT COUNT(*) FROM payment
WHERE EXTRACT(DOW FROM payment_date)=1

--Note : 0 means sunday, 1 means monday and so on.