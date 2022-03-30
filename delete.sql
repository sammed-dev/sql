-- delete using another table

DELETE FROM players
USING runs
WHERE players.joursey_no != runs.joursey_no	



-- here also we can add RETURNING
