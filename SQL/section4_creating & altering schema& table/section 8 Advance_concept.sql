


/*---------------------------------------------------------------------------------------------------------------------------*/
/* Section 8:  CREAT AN INDEX*/
/*---------------------------------------------------------------------------------------------------------------------------*/





use candystore;



/*---------------------------------------------------------------------------------------------------------------------------*/


/* The Unique Constraint */



use thriftshop;

select *from inventory;


insert into inventory values
(15 , 'fur fox skin' , 1);


#Error Code: 1062. Duplicate entry '14' for key 'inventory.PRIMARY'	0.0012 sec



insert into inventory values
(15 , 'unique handsome Rain' , 1);


/*---------------------------------------------------------------------------------------------------------------------------*/


/* The None Null Constraint */



use thriftshop;

select *from inventory;


insert into inventory values
(14 , 'unique handsome Rain' );


#Error Code: 1136. Column count doesn't match value count at row 1	0.00028 sec






delete from inventory
where inventory_id = 14;




/*---------------------------------------------------------------------------------------------------------------------------*/

/* Section 8: (54) ASSIGNMENT */


use sloppyjoes;



select *from customer_orders;

select *from menu_items;

select *from staff;



update sloppyjoes.customer_orders
set order_total = 0
where order_id in (3,8,12,16,19);



/*---------------------------------------------------------------------------------------------------------------------------*/


/* Store Procedures */



use thriftshop;

select *from inventory;



-- Change the delimiter(分隔符號 原本是；)
DELIMITER //


-- Creating the procedure
CREATE PROCEDURE sp_selectAllinventory()
BEGIN
	SELECT *FROM inventory;
    
END //

/* 原本程式只會跑到符號 (;)  但經過 DELIMITER // 程式可以跑到 (\\) */


-- changing the delimiter back to the default
DELIMITER ;



-- calling the procedure that we have created
CALL sp_selectAllinventory();


-- if we later want to DROP the procedure, we can use this
DROP PROCEDURE IF EXISTS sp_selectAllinventory ;
-- or
DROP PROCEDURE sp_selectAllinventory ;





/*---------------------------------------------------------------------------------------------------------------------------*/




/*---------------------------------------------------------------------------------------------------------------------------*/

/* Section 8: (54) ASSIGNMENT */



use sloppyjoes;

select *from customer_orders;
select *from staff;


CALL sp_staffOrdersServed;


DELIMITER //

create procedure sp_staffOrdersServed()
BEGIN
SELECT
	staff_id,
	COUNT(order_id) AS order_served
FROM customer_orders
GROUP BY staff_id;
END //



DELIMITER ;


/*---------------------------------------------------------------------------------------------------------------------------*/


-- ***********

/* Triggers */




use thriftshop;


select *from inventory;

select *from customer_purchases;



create trigger purchaseupdateinventory
after insert on customer_purchases
for each row
	update inventory
		-- subtracting an item for each purchase
        set number_in_stock = number_in_stock - 1
	where inventory_id = new.inventory_id;
    
    
    
insert into customer_purchases values
(13,null,3,null),
(14,null,4,null);




/*---------------------------------------------------------------------------------------------------------------------------*/


/* Section 8: (60) ASSIGNMENT */





use sloppyjoes;


DROP TRIGGER IF EXISTS updateOrdersServed;

select *from staff;

select *from customer_orders;





create trigger updateOrdersServed
after insert on customer_orders
for each row
	update staff
        set orders_served = orders_served + 1
	where staff.staff_id = new.staff_id;




insert into customer_orders values
(21,1,10.98),
(22,2,5.99),
(23,2,7.99),
(24,2,12.97);



/*---------------------------------------------------------------------------------------------------------------------------*/






