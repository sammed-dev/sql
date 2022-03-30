-- List of sql queries :



-- #49 TIME based 
-- EXTRACT() function :
-- options : YEAR, MONTH, DAY, WEEK, QUARTER

SELECT EXTRACT(MONTH FROM payment_date) FROM payment;
SELECT EXTRACT(YEAR FROM payment_date) FROM payment;
SELECT EXTRACT(WEEK FROM payment_date) FROM payment;
SELECT EXTRACT(QUARTER FROM payment_date) FROM payment;

-- AGE() function
SELECT AGE(payment_date) FROM payment;
-- o/p : 15 years 27 days 01:34:13.003423

-- TO_CHAR function for formatting
-- documentation : https://www.postgresql.org/docs/12/functions-formatting.html
SELECT TO_CHAR(payment_date, 'YYYY-MONTH-DD') FROM payment;
SELECT TO_CHAR(payment_date, 'YYYY-MM-DD') FROM payment;
SELECT TO_CHAR(payment_date, 'YYYY-mon-DD') FROM payment; --mon will give first 3 letters of the month
-- o/p : 7EAR-FEBRUARY -15
-- notice here, if you use MONTH it gives FEBRUARY(that too if you use capital MONTH it gives FEBRUARY in capital)
-- if you use MM it gives 02. same goes to DD and DAY

SELECT TO_CHAR(payment_date, 'DD-MM-YYYY') FROM payment;
-- you can write in any order that is what the use of TO_CHAR
SELECT TO_CHAR(payment_date, 'DD/MM/YYYY') FROM payment;
-- you can seperate them however you want



--Mathematical functions :
SELECT ROUND(5/2,2) from film

--string functions :
1) SELECT LENGTH(first_name) FROM customer
2) SELECT first_name || '--' || last_name FROM customer
3) SELECT UPPER(first_name) || '--' || last_name FROM customer
4) SELECT LEFT(first_name,1) || last_name || '@datagrokr.com' as custommail FROM customer
5) SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@datagrokr.com' as custommail FROM customer

