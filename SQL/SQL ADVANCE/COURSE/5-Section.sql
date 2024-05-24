


/* Altering & Updating & Mapping Keys */



/*******************************************************************************************************************************************************************************************************************************************/


/* Alter Table */



use thriftshop;
select *from customer_purchases;



select @@autocommit;
set commit = 0;
commit;
rollback;



alter table customer_purchases
drop column customer_id;

alter table customer_purchases
add column purchase_amount decimal(10,2) after customer_purchase_id;






/*******************************************************************************************************************************************************************************************************************************************/



/* Updating Records */


use thriftshop;

select *from inventory;


update inventory
set number_in_stock = 0   -- we sold out
where inventory_id = 9;




update inventory
set number_in_stock = 0
where inventory_id in(1,9);




update inventory
set number_in_stock = 0
where item_name = "fur coat";   -- 一樣使用primary key 才正確

-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.




/*******************************************************************************************************************************************************************************************************************************************/



/* Table Relationship */



/*******************************************************************************************************************************************************************************************************************************************/



/* Assignment 33 Intoducing a New Product */



use mavenbearbuilders;

create table product(
	product_id bigint,
    created_at datetime,
    product_name varchar(50),
    primary key(product_id)
);



insert into product values
(1,'2012-03-19 09:00:00','The Original Mr. Fuzzy'),
(2,'2013-01-06 13:00:00','The Forever Love Bear ');


select *from product;



/*******************************************************************************************************************************************************************************************************************************************/



/* Assignment 35 Adding Product to Order Item */


use mavenbearbuilders;


select *from order_items;

alter table order_items
add column product_id bigint after website_session_id;



/*******************************************************************************************************************************************************************************************************************************************/


/* Assignment 37 Updating Product Data in Order Items */



use mavenbearbuilders;


select *from order_items;

update order_items
set product_id = 1
where order_item_id > 0;




/*******************************************************************************************************************************************************************************************************************************************/


/* Assignment 39 Pri Key to Fore Key Mapping */



/*******************************************************************************************************************************************************************************************************************************************/


/* Assignment 41 Importing 2013 Q1 Data */



use mavenbearbuilders;


select * from order_items; -- 先除理 Primary Key

select 
	max(created_at),
    count(*)as order_records
    
from order_items;
-- 2586 --> 3859




select * from order_item_refunds; -- 後處理 Foreigner Key

select 
	max(create_at),
    count(*)as item_records
    
from order_item_refunds;
-- 169 --> 234

/*******************************************************************************************************************************************************************************************************************************************/

/*******************************************************************************************************************************************************************************************************************************************/










