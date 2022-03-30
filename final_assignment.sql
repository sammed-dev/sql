1)

select name from employee as e1
JOIN (SELECT managerid from employee
group by managerid
having count(managerid)>=5) as e2
on e1.id = e2.managerid


2) Nth highest salary

SELECT salary FROM salary s1
WHERE N-1 = (
	SELECT COUNT(DISTINCT salary) FROM salary s2
	WHERE s2.salary > s1.salary
)

3)
 -- small doubt here : how will OR works in SQL
SELECT a.req_id as id,
(
	SELECT count(*) FROM requestaccept b
	WHERE
		a.req_id = b.req_id
		or
		b.acc_id = a.req_id
) as num
from requestaccept a
order by num desc
LIMIT 1

4)

SELECT 
case 
when s_id=(select max(s_id) from seat) and mod(s_id,2)=1 then s_id 
when s_id< (select max(s_id) from seat) and mod(s_id,2)=1 then s_id+1
when s_id< (select max(s_id) from seat) and mod(s_id,2)=0 then s_id-1
end as exchange,
student
FROM seat



5)

SELECT customer_id FROM customer
GROUP BY customer_id
having count(distinct product_key) = 
(select count(*) from product)   -- i,e total no of products in product = total no of distinct product_key in customer 

6)
SELECT user_id AS buyer_id, join_date, coalesce(a.orders_in_2019,0)
FROM users
LEFT JOIN
(
    -- coalesce if no entries found(i,e NULL) then takes 0
SELECT buyer_id, coalesce(count(*), 0) AS orders_in_2019
FROM orders o
JOIN users u
ON u.user_id = o.buyer_id
WHERE extract('year' FROM order_date) = 2019
GROUP BY buyer_id) a
ON users.user_id = a.buyer_id


7)

select login_date, count(*) as user_count
from (select user_id, min(activity_date) as login_date
    from Traffic
    where activity = 'login'
    group by user_id) as t
where login_date >= DATE_ADD('2019-06-30', INTERVAL - 90 DAY) and login_date <= '2019-06-30'
group by login_date


8)

SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN 
    (SELECT product_id, MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id)
									
UNION

SELECT DISTINCT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM Products WHERE change_date <= '2019-08-16')




9)

select  to_char(trans_date, 'MM-YYYY') as month, country, 
        sum(case when state = 'approved' then 1 else 0 end) as approved_count,
        sum(case when state = 'approved' then amount else 0 end) as approved_amount,
        sum(case when state = 'chargeback' then 1 else 0 end) as chargeback_count,
        sum(case when state = 'chargeback' then amount else 0 end) as chargeback_amount
from(select  c.trans_id, t.country, 'chargeback' as state, t.amount, c.trans_date
    from Chargebacks as c join Transactions t on c.trans_id = t.id
    union all
    select *
    from Transactions) as t1
group by country, month

10)

select t.team_id, t.team_name,
    coalesce(sum(
    case 
        when t.team_id = m.host_team and m.host_goals > m.guest_goals then 3
        when t.team_id = m.host_team and m.host_goals = m.guest_goals then 1
        when t.team_id = m.guest_team and m.host_goals < m.guest_goals then 3
        when t.team_id = m.guest_team and m.host_goals = m.guest_goals then 1
    else 0 
    end), 0) as num_points
from Matches m
right join Teams t
on m.host_team = t.team_id or m.guest_team = t.team_id
group by team_id, team_name
order by num_points desc, team_id