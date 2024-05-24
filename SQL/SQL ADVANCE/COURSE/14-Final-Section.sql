




/* Section 14 Final Course Project */


/**************************************************************************************************************************************************************************************************************************************************************************/





--  1
-- ~ 0:37


-- Import the latest order_items and order_item_refunds data below into the database, 
-- and verify the order summary trigger you created previously still works (if not, recreate it)


-- 17.order_items_2014_Mar 18.order_items_2014_Apr 19.order_item_refunds_2014_Mar 20.order_item_refunds_2014_Apr




use mavenbearbuilders;


select 
	year(created_at) as yr,
    month(created_at) as mo,
	count(*) as total_records 
from order_items
group by 1,2
order by 1,2;



select 
	year(create_at) as yr,
    month(create_at) as mo,
	count(*) as total_records 
from order_item_refunds
group by 1,2
order by 1,2;






-- 2
-- ~ 5:30

--   Import the website_sessions and website_pageviews data for March and April, provided below:
-- 21.website_sessions_2014_Mar 22.website_sessions_2014_Apr 23.website_pageviews_2014_Mar 24.website_pageviews_2014_Apr


select 
	year(created_at) as yr,
    month(created_at) as mo,
	count(*) as total_records 
from website_session
group by 1,2
order by 1,2;


select 
	year(created_at) as yr,
    month(created_at) as mo,
	count(*) as total_records 
from website_pageviews
group by 1,2
order by 1,2;







-- 3
-- ~ 9:14


-- The company is adding chat support to the website. You’ll need to design a database plan to track which customers 
-- and sessions utilize chat, and which chat representatives serve each customer







-- user
	-- user_id
    -- created_at
    -- first_name
    -- last_name


-- support_members
	-- support_member_id
    -- created_at
    -- first_name
    -- last_name


-- chat_sessions
	-- chat_session_id
    -- created_at
    -- user_id
    -- support_member_id
    -- website_session_id
    
    

-- chat_messages
	-- chat_message_id
    -- created_at
    -- chat_session_id
    -- user_id (will be null for support members)
    -- support_member_id (null for users)
    -- message_text











-- 4
-- ~ 14:00



-- Based on your tracking plan for chat support, create an EER diagram that incorporates your
--   new tables into the existing database schema (including table relationships)














--  5
-- ~ 20:40


-- Create the tables from your chat support tracking plan in the database, 
-- and include relationships to existing tables where applicable


create table users(

	user_id bigint,
    created_at datetime,
    first_name varchar(50),
    last_name varchar(50),
    
    primary key (user_id)
    
);





create table support_members(
	support_member_id bigint,
    created_at datetime,
    first_name varchar(50),
    last_name varchar(50),
    
    primary key (support_member_id)
);
    
    
    
    
    


create table chat_sessions(
	chat_session_id bigint,
	created_at datetime,
    user_id bigint,
    support_member_id bigint,
    website_session_id bigint,
    
    primary key (chat_session_id)
);
    
    

create table chat_messages(
	chat_message_id bigint,
    created_at datetime,
    chat_session_id bigint,
	user_id bigint,
	support_member_id bigint,
	message_text varchar(200),
    
    primary key (chat_message_id)
);







-- 6
-- ~ 26:37


-- Using the new tables, create a stored procedure to allow the CEO to pull a count of 
-- hats handled by chat representative for a given time period, with a simple CALL statement which includes two dates



delimiter //

create procedure support_member_chat
( in supmemberid bigint , in startdate date , in enddate date)
begin
select 
	count(chat_session_id) as chats_handle
from chat_sessions
where date(created_at) between startdate and enddate
	and support_member_id = supmemberid;

end //


delimiter ;

call support_member_chat(1,'2014-01-01','2014-01-31');











-- 7
-- ~ 31:18

-- Create two Views for the potential acquiring company; one detailing monthly order volume and 
-- revenue, the other showing monthly website traffic. Then create a new User, with access restricted to these Views
--  



create view monthly_orders_revenue as

select
	year (created_at) as yr,
    month (created_at) as mo,
    count(order_id) as orders,
    sum(price_usd) as revenue
from orders
group by 1,2
order by 1,2
;

select *from monthly_orders_revenue;






create view monthly_website_session as

select 
	year(created_at) as yr,
    month(created_at) as mo,
    count(website_session_id) as sessions
    from website_session
    group by 1,2
	order by 1,2;	
    
    
    select *from monthly_website_session;
    
    
    





-- 8
-- ~ 37:00



-- The potential acquirer is commissioning a third-party security study, and your CEO wants to get in front of it.
--  Provide her with a list of your top data security threats and recommendations for mitigating risk

















/**************************************************************************************************************************************************************************************************************************************************************************/



