# Data Analysis


## Scenario

Cyclistic is a bike-share company based in Chicago with two types of customers. Customers who purchase single-ride or full-day passes are known as casual riders, 
while those who purchase annual memberships are known as members. The director of marketing believes the company’s future success depends on maximizing the number
of annual memberships, and has tasked us with discovering insights the differences of using bikes by Cyclistic members and casual riders. From these insights, your 
team will design a new marketing strategy to convert casual riders into annual members.

## Objective

Identify how do annual members and casual riders use Cyclistic bikes differently to maximize converting casual riders into manual members. 

## Preparing Data 
I was using 12 datasets from March 2022 to February 2023 from this [source](https://divvy-tripdata.s3.amazonaws.com/index.html).
Public data provided by Motivate International Inc.
License: [Data License Agreement | Divvy Bikes](https://ride.divvybikes.com/data-license-agreement).

SQLiteStudio was using for data merging, cleaning, and analyzing. 
All SQL code for data cleaning and VIEW creations can be found [here](...???)

## Processing Data

I mergered 12 datasets in one .cvs file:

```TSQL
-- Merging 12 datasets in one
INSERT INTO February
SELECT * FROM January;

INSERT INTO February
SELECT * FROM December;

INSERT INTO February
SELECT * FROM November;

INSERT INTO February
SELECT * FROM October;

INSERT INTO February
SELECT * FROM September;

INSERT INTO February
SELECT * FROM August;

INSERT INTO February
SELECT * FROM July;

INSERT INTO February
SELECT * FROM June;

INSERT INTO February
SELECT * FROM May;

INSERT INTO February
SELECT * FROM April;

INSERT INTO February
SELECT * FROM March

-- Rename final table with 12 months data
ALTER TABLE February
RENAME TO All_months 
```
**Adding new columns**:

```TSQL
-- Adding a new column to calculate the ride length
ALTER TABLE All_months
ADD trip_duration int;

UPDATE All_months
SET trip_duration = ROUND ((JULIANDAY(ended_at) - JULIANDAY(started_at))*3600)

-- Extracting day and month for new columns with approprate names.
ALTER TABLE All_months
Add weekday nvanchar(50);
UPDATE All_months
SET weekday = CASE CAST (strftime('%w', started_at) as integer)
WHEN 0 THEN 'Sunday'
WHEN 1 THEN 'Monday'
WHEN 2 THEN 'Tuesday'
WHEN 3 THEN 'Wednesday'
WHEN 4 THEN 'Thursday'
WHEN 5 THEN 'Friday'
ELSE 'Saturday' END;

ALTER TABLE All_months
ADD new_month nvanchar(50);
UPDATE All_months
SET new_month = CASE CAST (strftime('%m', started_at) as integer)
WHEN 01 THEN 'January'
WHEN 02 THEN 'February'
WHEN 03 THEN 'March'
WHEN 04 THEN 'April'
WHEN 05 THEN 'May'
WHEN 06 THEN 'June'
WHEN 07 THEN 'July'
WHEN 08 THEN 'August'
WHEN 09 THEN 'September'
WHEN 10 THEN 'October'
WHEN 11 THEN 'November'
ELSE 'December' END
```

**Cleaning data**:

- Checked duplicates
- Checked and removed Nulls and blanks
- Checked for and removed any rows that have an end time that is before the start time

```TSQL
-- Delete NULL and blanks
DELETE FROM All_months
WHERE ride_id IS NULL OR
start_station_name IS NULL OR
trip_duration IS NULL OR
new_month IS NULL OR
started_at IS NULL OR
start_station_name <> '' OR
trip_duration <=0 

-- Checking duplicates
SELECT COUNT (DISTINCT ride_id) AS id 
COUNT(ride_id) AS total
FROM All_months
```
## Analysing Data

```TSQL
-- Creating view vor viz with calculating number of users each weekday per user type 
CREATE VIEW weekdays AS
SELECT
COUNT(*) AS users,
COUNT (CASE WHEN member_casual = 'member' THEN 1 ELSE NULL END) AS members,
COUNT (CASE WHEN member_casual = 'casual' THEN 1 ELSE NULL END) AS casuals,
weekday
FROM All_months
GROUP BY weekday

-- Creating view for average trip Length for each user type
CREATE VIEW average_trip AS
SELECT
ROUND(AVG(trip_duration)) AS avg_trip,
member_casual
FROM All_months
GROUP BY member_casual;

-- Creating view for traffic each month
CREATE VIEW month_trip AS
SELECT
new_month,
COUNT (CASE WHEN member_casual = 'member' THEN 1 ELSE NULL END) AS members,
COUNT (CASE WHEN member_casual = 'casual' THEN 1 ELSE NULL END) AS casuals,
COUNT(*) AS all_users,
started_at
FROM All_months
GROUP BY new_month
ORDER BY started_at 

-- Creating view for calculating User Traffic Hour (not able to round to nearest hours, just extract hour number)
CREATE VIEW hour_trip AS
SELECT
strftime('%H', started_at) AS d_hour, 
COUNT (CASE WHEN member_casual = 'member' THEN 1 ELSE NULL END) AS members,
COUNT (CASE WHEN member_casual = 'casual' THEN 1 ELSE NULL END) AS casuals,
COUNT(*) AS all_users,
started_at
FROM All_months
GROUP BY d_hour

-- Creating view for calculationg most popular stations for member users
CREATE VIEW top_st_members AS
SELECT
start_station_name,
COUNT (CASE WHEN member_casual = 'member' THEN 1 ELSE NULL END) AS members,
start_lat,
start_lng
FROM All_months
WHERE start_station_name <> ''
GROUP BY start_station_name
ORDER BY members DESC
LIMIT 20

-- Creating view for calculationg most popular stations for casual users
CREATE VIEW top_st_casuals AS
SELECT
start_station_name,
COUNT (CASE WHEN member_casual = 'casual' THEN 1 ELSE NULL END) AS casuals,
start_lat,
start_lng
FROM All_months
WHERE start_station_name <> ''
GROUP BY start_station_name
ORDER BY casuals DESC
LIMIT 20
```
## Vizualising Data
All visualizations were created in [Tableau](https://public.tableau.com/app/profile/liudmila3799).


 




Conclusion

Recommendations
