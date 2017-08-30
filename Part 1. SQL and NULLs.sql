/* Question 1. How many airplanes have listed speeds? What is the minimum 
listed speed and the maximum listed speed? */

/* There are 23 airplanes have listed speed. Minimum speed is 90. Maximum speed is 432*/ 
select count(*) as Speed_Listed, min(speed) as Minimum_Speed, 
max(speed) as Maximum_Speed
from planes 
where speed is not null;


/* Question 2. What is the total distance flown by all of the planes in January 2013? 
What is the total distance flown by all of the planes in January 2013 
where the tailnum is missing?

/* In January 2013, the total distance flown by all of the planes = 27188805 */
select sum(distance) as Total_Distance 
from flights
where year='2013' 
and month='1';

/* In January 2013, the total distance flown by all of the planes where tailnum is missing = 81763 */
select sum(distance) as Total_Distance 
from flights
where year='2013' 
and month='1'
and tailnum is null;


/* Question 3. What is the total distance flown for all planes on July 5, 
2013 grouped by aircraft manufacturer? Write this statement first using an 
INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare? */

/* INNER JOIN*/ 
select p.manufacturer, sum(f.distance) as total_distance
from flights as f
inner join planes as p
on f.tailnum=p.tailnum
where f.year='2013' 
and f.month='7'
and f.day='5'
group by p.manufacturer
order by p.manufacturer;

/* LEFT OUTER JOIN.*/
select p.manufacturer, sum(f.distance) as total_distance
from flights as f
left outer join planes as p 
on f.tailnum=p.tailnum
where f.year='2013' 
and f.month='7'
and f.day='5'
group by p.manufacturer
order by p.manufacturer;

/*Difference: With Left Outher Join, the first raw displayed as (NULL) for manufacturer.*/


/* Question 4. Display the list of airline's name departed from JFK International Airport for the month of January 2013 */ 
select airports.name as airport_name, airlines.name as airline_name
from airports 
join flights
on airports.faa=flights.origin
join airlines
on flights.carrier=airlines.carrier 
where airports.name='John F Kennedy Intl'
and flights.origin='JFK'
and flights.year='2013'
and flights.month='1'
group by airlines.name;