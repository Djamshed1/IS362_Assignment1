
/* Show me the average departure delay of Delta Airline's accross the three New York airports in 2013 */

select year, carrier, origin, month, avg(dep_delay) as avg_delay
from flights
where origin in ('JFK', 'LGA', 'EWR')
and carrier='DL'
and year='2013'
and dep_delay>0
group by origin, month
order by origin, month;

/*Migrating the data from MYSQL to CSV file*/
select year, carrier, origin, month, avg(dep_delay) as avg_delay INTO OUTFILE '/Users/Public/AvgDelay.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
from flights
where origin in ('JFK', 'LGA', 'EWR')
and carrier='DL'
and year='2013'
and dep_delay>0
group by origin, month
order by origin, month;