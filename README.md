# Data Analysis


## Scenario

Cyclistic is a bike-share company based in Chicago with two types of customers. Customers who purchase single-ride or full-day passes are known as casual riders, 
while those who purchase annual memberships are known as members. The director of marketing believes the company’s future success depends on maximizing the number
of annual memberships, and has tasked us with discovering insights the differences of using bikes by Cyclistic members and casual riders. From these insights, your 
team will design a new marketing strategy to convert casual riders into annual members.

## Objective

Identify how do annual members and casual riders use Cyclistic bikes differently to maximize converting casual riders into manual members. 

## Preparing Data 
12 datasets from March 2022 to February 2023 were using from this [source](https://divvy-tripdata.s3.amazonaws.com/index.html).
Public data provided by Motivate International Inc.
License: [Data License Agreement | Divvy Bikes](https://ride.divvybikes.com/data-license-agreement).

SQLiteStudio was using for data merging, cleaning, and analyzing. 
SQL code can be found [here](https://github.com/LLBBAA/Data_Analysis/blob/main/SQL_Code.sql).

## Processing Data

Datasets of 12 months were mergered in one file. 
Cleaning data by checking and removing duplicates, Nulls and blanks.
New columns with calculated trip duration, extracted day and month were added.

## Analyzing Data
To define differences of using bikes by members and casual riders was analyzed average trip duration, bike usage during these 12 months, also checked biked usage from Monday to Sunday, checked starting hours for trips, and top start stations.
Trends and relationships are in [Google Slides presentation](https://docs.google.com/presentation/d/1sL4CvfZugpeS0J8cl1FtaNDjfC1KakbJV_MqCBYc2hc/edit#slide=id.g22a7550d4e7_0_980)

## Sharing Data
Average trip duration is longer for casual users who also prefer to use bike services during the weekends. 
Members start pick time is at 6-8am and at 4-7pm that could be commute hours bike using.
Top ranking start stations is looking different for members and casual riders.
Season using is the same for both types of riders

All visualizations were created in [Tableau](https://public.tableau.com/app/profile/liudmila3799).

## Acting
Adding more advertisement around top stations for casual riders, offer discounts at local stores close to this stations, offer membership options for longer trips.

Also, full analysis with conclusion and recommendations is shared in Google Slides [Google Slides presentation:](https://docs.google.com/presentation/d/1sL4CvfZugpeS0J8cl1FtaNDjfC1KakbJV_MqCBYc2hc/edit#slide=id.g22a7550d4e7_0_980)

