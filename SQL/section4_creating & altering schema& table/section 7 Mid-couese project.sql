

use mavenmoviesmini;

-- 1: Take a look at the mavenmoviesmini schema. What do you notice about it? How many tables are there? (1)What does the data represent? What do you think the current schema?



-- 2: If you wanted to break out the data from the inventory_non_normalized table into multiple tables, how
-- many tables do you think would be ideal? What would you name those tables?




select *from inventory_non_normalized;









select distinct
	
    store_id,
    film_id
   
from inventory_non_normalized;





select
	inventory_id,
    film_id,
    store_id
from inventory_non_normalized;





select 
	film_id,
    title,
	description,
    release_year,
    rental_rate,
    rating
    
from inventory_non_normalized;






select 
store_id,
store_manager_first_name,
store_manager_last_name,
store_address,
store_city,
store_district
    
from inventory_non_normalized;





-- 3: Based on your answer from question #2, create a new schema with the tables you think will best serve this
-- data set. You can use SQL code or Workbench’s UI tools (whichever you feel more comfortable with).



create schema mavenmovie_normalized;

use mavenmovie_normalized;
 


-- 4: Next, use the data from the original schema to populate the tables in your newly optimized schema
-- (TIP: Revisit the video on database normalization again if you get stuck) ~ 17:45


insert into mavenmovie_normalized . inventory (inventory_id,film_id,story_id)
select distinct 
	inventory_id,
    film_id,
    store_id
from mavenmoviesmini . inventory_non_normalized;


select *from inventory;




insert into mavenmovie_normalized . film (film_id,title,description,release_year,rental_rate,rating)
select distinct 
	film_id,
    title,
	description,
    release_year,
    rental_rate,
    rating
from mavenmoviesmini . inventory_non_normalized;

select *from film;






insert into mavenmovie_normalized . store (store_id,store_manager_first_name,store_manager_last_name,store_address,store_city,store_district)
select distinct 
	store_id,
	store_manager_first_name,
	store_manager_last_name,
	store_address,
	store_city,
	store_district
from mavenmoviesmini . inventory_non_normalized;

select *from store;





-- 5: Make sure your new tables have the proper primary keys defined and that applicable foreign keys are added.
-- Add any constraints you think should apply to the data as well (unique, non-NULL, etc.) ~ 24:50








-- 6: Finally, after doing all of this technical work, write a brief summary of what you have done, in a way that your non-technical client can understand. Communicate what you did, and why your new schema design is better.
-- ~ 26:05







