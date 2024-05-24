

/*---------------------------------------------------------------------------------------------------------------------------*/
/* Section 5: INSERTING , UPDATING, DELETING RECORD
/*---------------------------------------------------------------------------------------------------------------------------*/


/* INSERTING DATA RECORDS */


use thriftshop;
select *from inventory;


insert into inventory (inventory_id, item_name, number_in_stock) value
(10,'wolf skin hat',1);

insert into inventory value
(11,'fur fox skin',1),
(12,'plaid button up shirt',8),
(13,'flannel zebra jammies',6);



insert into inventory (inventory_id, item_name) value
(14,'wolf skin sneakers');

insert into inventory value
(15,'if you only whant to insert two items , you need to specify ');		/*會出錯*/




/* UPDATING DATA RECORDS */


USE thriftshop;

select *from inventory;



update inventory
set number_in_stock = 0  -- we sold out
where inventory_id = 9 ;

update inventory
set number_in_stock = 0  -- we sold out
where inventory_id in (1,9) ;  -- 同時選擇第 1 & 9


update inventory
set number_in_stock = 0  -- we sold out
where item_name  = 'fur coat' ; 			-- 會出錯 因為 where 語法需搭配 primary key 




/*---------------------------------------------------------------------------------------------------------------------------*/

/* Section 5: (32) ASSIGNMENT */


use candystore;

select  *from employees;


insert into employees values
(7,'Charles','Munger','2020-03-15','Clerk',5.0),
(8,'William','Gates','2020-03-15','Clerk',5.0);

update employees
set avg_customer_rating = 4.8
where employee_id = 1;

update employees
set avg_customer_rating = 4.6
where employee_id = 2;

update employees
set avg_customer_rating = 4.75
where employee_id = 3;

update employees
set avg_customer_rating = 4.9
where employee_id = 4;

update employees
set avg_customer_rating = 4.75
where employee_id = 5;

update employees
set avg_customer_rating = 4.2
where employee_id = 6;


-- case
-- 	when employee_id = 1 then 4.8
--     when employee_id = 2 then 4.6
--     when employee_id = 3 then 4.75
--     when employee_id = 3 then 4.9
--     when employee_id = 4 then 4.75
--     when employee_id = 5 then 4.2
--     else 5.0
-- end case ;

/*---------------------------------------------------------------------------------------------------------------------------*/






/* DELETE DATA RECORDS */



use thriftshop;
select *from inventory;




select @@autocommit;			-- 當資料在做 新增,修改,刪除時 會搭配使用 配合ROLLBACK (返回的功用), 但只要COMMIT(就無法再返回了)
set autocommit = on;		
-- 1,0
-- ON , OFF	

delete from inventory
where inventory_id = 1;

rollback;
commit;





/* TRUNCATE TABLE */


use thriftshop;

select *from customers;
 

select @@autocommit;
set autocommit = off;


delete from customers
where customer_id between 1 and 6;


rollback;
commit;



TRUNCATE TABLE customers;			-- TRUNCATE TABLE 無法被ROLLBACK







/*---------------------------------------------------------------------------------------------------------------------------*/


/* Section 5: (37) ASSIGNMENT */


use candystore;

select *from employees;

select *from customer_reviews;


select @@autocommit;
set autocommit = off;



delete from employees
where employee_id = 4;


rollback;
commit;




delete from customer_reviews
where customer_review_id between 1 and 33;


TRUNCATE table customer_reviews;

--  
--  
 /*---------------------------------------------------------------------------------------------------------------------------*/
