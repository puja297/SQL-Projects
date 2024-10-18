create database rsqlproject2;
-- use database 
use rsqlproject2;

show tables;

-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.
select ar.full_name, wr.name as work_name, mu.name as museum_name
from artist as ar
join work as wr on ar.artist_id = wr.artist_id 
join museum as mu on wr.museum_id = mu.museum_id;


-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, 
-- ordered by the count in descending order.

select ar.full_name, count(wr.name) as work_count
from artist as ar
left join work as wr on ar.artist_id = wr.artist_id 
group by ar.full_name
order by work_count desc;

-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.

select mu.name as museum_name, count(wr.name) as work_count
from museum as mu
left join work as wr on mu.museum_id = wr.museum_id 
group by museum_name
order by work_count desc
limit 5;

-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. 
-- Limit the results to 10.

select mu.name as museum_name, wr.name as work_name, wr.style
from museum as mu
left join work as wr on mu.museum_id = wr.museum_id 
order by museum_name asc
limit 10;

-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, 
-- ordered by the total sale price in descending order.
select ar.full_name, wr.name as work_name,sum(ps.sale_price) as Total_Sale_Price
from artist as ar
join work as wr on ar.artist_id = wr.artist_id 
join product_size as ps on wr.work_id = ps.work_id
group by ar.full_name, work_name
order by Total_Sale_Price desc;

-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.
select ar.full_name, count(wr.name) as work_count
from artist as ar
left join work as wr on ar.artist_id = wr.artist_id 
group by ar.full_name
having work_count > 3
order by work_count desc;

-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 
select DISTINCT wr.name as work_name,ar.full_name
from work as wr
inner join artist as ar on wr.artist_id = ar.artist_id 
inner join product_size as ps on ps.work_id = wr.work_id
where ps.sale_price < ps.regular_price;

-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.
select avg(width) as avg_width, avg(height) as avg_height
from canvas_size;

-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.
select mu.name as museum_name, max(ps.sale_price) as max_price
from product_size as ps
join work as wr on wr.work_id = ps.work_id 
join museum as mu on mu.museum_id = wr.museum_id
group by museum_name
order by max_price desc;

-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. 
-- Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.

select ar.first_name, ar.last_name, ar.nationality,
concat(ar.first_name, ' ' ,ar.last_name, ',', "natinality is", ' - ', ar.nationality) as Artist_discription,
count(wr.name) as work_count
from artist as ar
left join work as wr on wr.artist_id = ar.artist_id
group by ar.first_name, ar.last_name, ar.nationality,Artist_discription
order by work_count desc;
 
