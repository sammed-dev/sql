1)

SELECT * FROM cd.facilities; 

2)

SELECT name, membercost FROM cd.facilities;

SELECT * FROM cd.facilities WHERE membercost > 0;



SELECT facid, name, membercost, monthlymaintenance
 FROM cd.facilities
 WHERE membercost > 0 AND
 (membercost < monthlymaintenance/50.0);


SELECT * FROM cd.facilities WHERE name LIKE '%Tennis%';

SELECT * FROM cd.facilities WHERE facid IN (1,5);


SELECT * FROM cd.members
WHERE joindate > '2012-09-01'


SELECT DISTINCT surname FROM cd.members
ORDER BY  surname LIMIT 10;


SELECT MAX(joindate) AS latest_signup FROM cd.members;


SELECT COUNT(*) FROM cd.facilities WHERE guestcost >= 10;


--  list of the total number of slots booked per facility means group by:
SELECT facid, sum(slots) AS "Total Slots" FROM cd.bookings 
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01' 
GROUP BY facid ORDER BY SUM(slots);

SELECT facid, sum(slots) AS total_slots 
FROM cd.bookings GROUP BY facid 
HAVING SUM(slots) > 1000 
ORDER BY facid;


  SELECT cd.bookings.starttime, cd.facilities.name from cd.bookings
  INNER JOIN cd.facilities
  ON cd.bookings.facid = cd.facilities.facid
  WHERE cd.bookings.starttime >= '2012-09-21' AND cd.bookings.starttime <= '2012-09-22'
  
   
SELECT cd.bookings.starttime, CONCAT(cd.members.firstname, CONCAT(' ', cd.members.surname)) AS full_name 
FROM cd.members
INNER JOIN cd.bookings
ON cd.bookings.memid = cd.members.memid
WHERE CONCAT(cd.members.firstname, CONCAT(' ', cd.members.surname)) = 'David Farrell'


or 

SELECT cd.bookings.starttime 
FROM cd.bookings 
INNER JOIN cd.members ON 
cd.members.memid = cd.bookings.memid 
WHERE cd.members.firstname='David' 
AND cd.members.surname='Farrell';
