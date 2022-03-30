1)

SELECT * FROM players
INNER JOIN ipl_players
ON players.joursey_no = ipl_players.joursey_no

-- Inner join with gives the intersection of data in both tables
-- if joursey_no is present on both tables then that itself is the output.


2)

SELECT * FROM players
FULL OUTER JOIN ipl_players
ON players.joursey_no = ipl_players.joursey_no

-- it is the union of both tables.
-- the values present in one table and not present in other is displayed as null

3)

SELECT * FROM players
LEFT JOIN ipl_players
ON players.joursey_no = ipl_players.joursey_no


-- it will display all the content from left table (ex: players here) and
-- that data which satisfy on condition( players.joursey_no = ipl_players.joursey_no) 
-- so the content that present in left table and absent in right table will be displayes as null.

4)

SELECT * FROM players
RIGHT JOIN ipl_players
ON players.joursey_no = ipl_players.joursey_no

-- exactly opposite to LEFT join, we can acheive right join by interchanging tables fom select clause and join clause.
-- so the content that present in right table and absent in left table will be displayes as null.




---- Now to get the intersection result from LEFT or RIGHT join use where clause to filter those NULL values that's it.
-- i,e output of this is same as output of inner join 

5)

SELECT * FROM players
LEFT JOIN ipl_players
ON players.joursey_no = ipl_players.joursey_no
WHERE ipl_players.joursey_no is not NULL
