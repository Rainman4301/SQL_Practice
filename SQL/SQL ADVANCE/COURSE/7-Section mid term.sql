




/* Section 7 Mid course Project */



/*****************************************************************************************************************************************************************************************************************v*****************************************************************************************************************************/



--  1
-- ~ 0:38

-- Import Q2 orders and refunds into the database using the files below: 
-- 08.order_items_2013_Apr-June
--  09.order_item_refunds_2013_Apr-Jun


use mavenbearbuilders;

select *from order_items;

select 
	max(created_at),
    count(*) as records,
    count(*) as  count_rows
from order_items;





select *from order_item_refunds;

select 
	max(create_at),
    count(*) as records 
from order_item_refunds;






-- 2
-- ~ 4:20

--  Next, help update the structure of the order_items table:
-- • The company is going to start cross-selling products and will 
-- want to track whether each item sold is the
-- primary item (the first one put into the user’s shopping cart) or a cross-sold item 
-- • Add a binary column to the order_items table called is_primary_item  


use mavenbearbuilders;

alter table order_items
add is_primary_item int;

select *from order_items;



--  3
-- ~ 6:15
-- Update all previous records in the order_items table, setting is_primary_item = 1 for all records
-- • Up until now, all items sold were the primary item (since cross-selling is new)
-- • Confirm this change has executed successfully


use mavenbearbuilders;

update order_items 
set is_primary_item = 1
where order_item_id > 0;

select *from order_items;




--  4
-- ~ 9:00
-- Add two new products to the products table, then import the remainder of 2013 orders and
--  refunds, using the product details and files shown below:
--   10.order_items_2013_Jul-Dec 
--   11.order_item_refunds_2013_Jul-Dec

use mavenbearbuilders;
select *from product;


insert  into product(product_id,created_at,product_name) values
(3,'2013-12-12 09:00:00','The Birthday Sugar Panda'),
(4,'2014-02-05 10:00:00','The Handson River Mini Bear');

select
	count(*) as records,
    MAX(created_at) as most_recent_created_at
from order_items;


select
	count(*) as records,
	MAX(create_at) as most_recent_created_at
from order_item_refunds;



-- 5
-- ~ 13:38
--  Your CEO would like to make sure the database has a high degree of data integrity and avoid 
--  potential issues as more people start using the database. If you see any opportunities to 
--  ensure data integrity by using constrains like NON-NULL, add them to the relevant columns 
--  in the tables you have created.








-- 6
-- ~ 17:30
--   One of the company’s board advisors is pressuring your CEO on data risks and making sure she 
-- has a great backup and recovery plan. Prepare a report on possible risks for data loss and steps
--  the company can take to mitigate these concerns.
 










