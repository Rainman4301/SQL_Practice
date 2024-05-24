


/* Section 8 Trigger Automation */

/*****************************************************************************************************************************************************************************************************************v*****************************************************************************************************************************/

use thriftshop;

select *from inventory;		-- 後發生


select *from customer_purchases;  -- 先發生


alter table customer_purchases
add column purchased_at datetime;






create trigger purchaseUpdateInventory
after insert on customer_purchases
for each row
	update inventory 
		set number_in_stock = number_in_stock - 1  -- subtracting an item for each purchase
    where inventory_id = new.inventory_id;  -- 這是inventory其中一 COLUMN
    
    
    
insert into customer_purchases values
(13,null,3,null),  -- inventory_id = 3, velour jumpsuit
(14,null,4,null)	-- inventory_id = 4,  house slippers
;






/*****************************************************************************************************************************************************************************************************************v*****************************************************************************************************************************/


/* Triggers Deep Dive */


/* 

CREATE TRIGGER trigger_name
{BEFORE|AFTER}{INSERT|UPDATE|DELETE} ON table_name

FOR EACH ROW
{{FOLLOWS|PRECEDES} existing_trigger_name}.    排 （trigger）順序用而已
[[some statement we want to execute by trigger]]
WHERE column_name = {OLD|NEW}.column_name


 */

use thriftshop;


select *from customer_purchases;

select *from purchase_summary;


-- update customer_purchases
-- set purchase_amount = 1  
-- where customer_purchase_id = 14;







select *from customer_purchases;

select *from purchase_summary;



CREATE TRIGGER PurchaseUpdatePurchaseSummary_before
BEFORE INSERT ON customer_purchases

FOR EACH ROW
update purchase_summary
	set purchase_excluding_last = (
    select count(customer_purchase_id)
    from customer_purchases where customer_purchases.customer_id = purchase_summary.customer_id
    )
    
WHERE customer_id = new.customer_id   -- WHERE purchase_summary.customer_id MATCHES the new record's customer_id IN customer_purchase table
and purchase_summary_id > 0;  -- this is just handle safe update mode



-- Error Code: 1363. There is no OLD row in on INSERT trigger







CREATE TRIGGER PurchaseUpdatePurchaseSummary_after
AFTER INSERT ON customer_purchases

FOR EACH ROW
update purchase_summary
	set total_purchases = (
    select count(customer_purchase_id)
    from customer_purchases where customer_purchases.customer_id = purchase_summary.customer_id
    )
    
WHERE customer_id = new.customer_id   -- WHERE purchase_summary.customer_id MATCHES the new record's customer_id IN customer_purchase table
and purchase_summary_id > 0;  -- this is just handle safe update mode





drop trigger PurchaseUpdatePurchaseSummary_before;
drop trigger PurchaseUpdatePurchaseSummary_after;



select *from customer_purchases;
select *from purchase_summary;

insert into customer_purchases values
(13,6,4);






/*****************************************************************************************************************************************************************************************************************v*****************************************************************************************************************************/


/*Assigment 51 Creating & Updating Orders*/



use mavenbearbuilders;

create table orders (
	order_id bigint,
    created_at datetime,
	website_session_id bigint,
	primary_product_id bigint,
    items_purchased bigint,
    price_usd decimal(6,2),
	cogs_usd decimal(6,2),

	primary key (order_id)
);



select *from orders;





-- insert into orders
insert into orders
select
	order_id,
    min(created_at) as created_at,
	min(website_session_id) as website_session_id, 
    sum(
		case
		when is_primary_item = 1 then product_id
        else null
        end) as primary_product_id,
	count(order_item_id) as iterms_purchased,
    sum(price_usd) as price_usd,
    sum(cogs_usd) as cogs_usd
from order_items
group by 1
order by 1;
    
        












/*****************************************************************************************************************************************************************************************************************v*****************************************************************************************************************************/


/*Assigment 53 Triggers*/




use mavenbearbuilders;



create trigger insert_mew_orders
after insert on order_items
for each row
-- replace into orders
replace into orders
select
	order_id,
    min(created_at) as created_at,
	min(website_session_id) as website_session_id, 
    sum(
		case
		when is_primary_item = 1 then product_id
        else null
        end) as primary_product_id,
	count(order_item_id) as iterms_purchased,
    sum(price_usd) as price_usd,
    sum(cogs_usd) as cogs_usd
from order_items
where order_id = new. order_id
group by 1
order by 1;










/*****************************************************************************************************************************************************************************************************************v*****************************************************************************************************************************/




/*Assigment 55 Test Triggers*/


-- you should see 10033 records before trigger fires
select
count(*) as total_records from orders;
-- now 12036


-- then, test the trigger by inserting into order_items(use data import wizard)






-- TKIP: after insert, find the max order_id
select max(order_id) as max_order_id
from order_items;

select max(created_at) as time_created
from order_items;


-- you should see a new row count that matches max_order_id
select count(*) as total_records from orders;






/*****************************************************************************************************************************************************************************************************************v*****************************************************************************************************************************/





