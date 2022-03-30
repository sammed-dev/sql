--  assigning one column values to anoter column inside same table
UPDATE runs
SET test_runs = t20_runs




-- assigning values of column from one table to another 
UPDATE players
SET odi_runs = runs.odi_runs
FROM runs
WHERE players.joursey_no = runs.joursey_no





-- since update clause will update the table to 
with output as
output of update : UPDATE 6 Query returned successfully in 59 msec.
but to actually get the columns (i mean data) as output specify the columns you want to get inside the RETURNING.

UPDATE players
SET odi_runs = runs.odi_runs
FROM runs
WHERE players.joursey_no = runs.joursey_no
RETURNING players.joursey_no, player_name