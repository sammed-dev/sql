1)

SELECT 
SUM(
	CASE rental_rate 
	WHEN 0.99 THEN 1
	ELSE 0
END
),
SUM(
	CASE rental_rate 
	WHEN 2.99 THEN 1
	ELSE 0
END)
FROM film


2)

SELECT 
SUM(CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END),
SUM(CASE rating
	WHEN 'PG' THEN 1
	ELSE 0
END),
SUM(CASE rating
	WHEN 'PG-13' THEN 1
	ELSE 0
END)

FROM film	


3) COALESCE

SELECT item, (price-COALESCE(discount,0))
AS effective_price FROM products