1)  SELECT customer_id, COUNT(*) from payment
    GROUP BY customer_id
    HAVING COUNT(*)>=40

2)  SELECT customer_id, SUM(amount) from payment
    WHERE staff_id=2
    GROUP BY customer_id
    HAVING SUM(amount)>=100
