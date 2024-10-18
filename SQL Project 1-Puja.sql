create database project1;
use project1;
show variables like "secure_file_priv";

create table olympics1
(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(500),
NOC varchar(500),
Games varchar (500),
Year int,
Season varchar(500),
City varchar(200),
Sport varchar(300),
Event varchar(800),
Medal varchar(200)
);


load data infile 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/Athletes_Transformed.csv' 
into table olympics1
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympics1
limit 5;


-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
select medal,count(medal) as Medal_count
from olympics1
group by medal;

-- 2. Show count of unique sports present in Olympics
select distinct sport,count(sport) as Sport_count
from olympics1
group by sport;

select count(distinct (sport)) as Sport_count
from olympics1;

-- 3. Show how many different medals won by team India
select medal,count(medal) as India_Medal
from olympics1
where team='India'
group by medal;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order

select Event,count(medal) as India_Medal
from olympics1
where team='India'
group by event
order by India_Medal desc;


-- 5. Show event wise medals won by India in order of year

select Event,Medal,year, count(medal) as India_Medal
from olympics1
where team='India'
group by event,year,medal 
order by year ;

-- 6. show country who won maximum medals.

select team,count(medal) as count_Medal
from olympics1
where medal<>'nomedal'
group by team
order by count_Medal desc
limit 5;


-- 7.show top 10 countries whowon gold

select team,count(medal) as Gold_Medal
from olympics1
where medal='gold'
group by team
order by Gold_Medal desc
limit 10;


--  8. show in which year did United states won most gold medal
select year ,count(medal) as US_medal
from olympics1
where team="united states" and medal='gold'
group by year
order by US_medal desc
limit 1;  

-- 9. In which sports United States has most medals.
select sport,count(medal) as US_medals
from olympics1
where team ='united states'
group by sport
order by US_medals desc
limit 5;


-- 10. Find top three players who won most medals along with their sports and country

select name,sport,team, count(medal) as Top_Players
from olympics1
group by name,sport,team
order by Top_Players desc
limit 3;


-- 11. Find player with most gold medals in cycling along with his country.

select name,team, count(medal) as Gold_Player
from olympics1
where medal='gold' and sport='cycling'
group by name,team
order by Gold_Player desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.

select name,team, count(medal) as Higest_Medals
from olympics1
where sport='basketball' and medal<>"Nomedal"
group by name,team
order by Higest_Medals desc
limit 10;


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards

select medal,count(medal) 
from olympics1
where name='Teresa Edwards'
group by medal;


-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select sex,year, count(medal) as total_medals
from olympics1
group by sex,year; 


