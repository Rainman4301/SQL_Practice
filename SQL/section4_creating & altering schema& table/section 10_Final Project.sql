 /* 
 (1)
 ~ 0:37
Bubs wants you to track information on his customers (first name, last name, email),
 his employees (first name, last name, start date, position held), his products, and the purchases 
 customers make (which customer, when it was purchased, for how much money). Think about how many 
tables you should create. Which data goes in which tables? How should the tables relate to one another?
*/

-- TABLE: 		CUSTOMER
-- CUSTOMER_ID. primaryKEY
-- FIRST. 		Chart(20)
-- LAST. 		Chart(20)
-- EMAIL. 		Bigint(50)



-- TABLE: 		EMPLOYEE
-- EMPLOYEE_ID. primaryKEY
-- FIRST. 		Chart(20)
-- LAST. 		Chart(20)
-- START_DATE. 	Date
-- POSITION. 	Chart(20)



-- TABLE:  			PRODUCTS
-- PRODUCT_ID		primaryKEY
-- PRODUCT_NAME		Char(20)
-- LAUNCHED_DATE	Date



-- TABLE: 					CONSUMPTION_RECORD 
-- CUSTOMER_PURCHASE_ID. 	primaryKEY
-- PRODUCT_ID				foreignKEY
-- CUSTOMER_ID. 			foreignKEY
-- EMPLOYEE_ID.				foreignKEY
-- TIME. 					Date










/*
(2)
~ 4:50
Given the database design you came up with, use Workbench to create an EER diagram of the database. 
Include things like primary keys and foreign keys, and anything else you think you should have in the
 tables. Make sure to use reasonable data types for each column.
 */
 
 
 
 
 
 
/*
(3)
~ 15:50
 Create a schema called bubsbooties. Within that schema, create the tables that you have diagramed out. Make
sure they relate to each other, and that they have the same reasonable data types you selected previously.
*/




create schema Bubs_Booths ;

use Bubs_Booths;

/* 
CREATE TABLE `bubs_booths`.`CUSTOMER` (
  `CUSTOMER_ID` BIGINT NOT NULL,
  `FIRST` VARCHAR(50) NOT NULL,
  `LAST` VARCHAR(45) NOT NULL,
  ` EMAIL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`));
*/








/*
(4)
~ 24:05
Add any constraints you think your tables’ columns should have.
Think through which columns need to be unique, which ones are allowed to have NULL values, etc.
*/








/*
(5)
~ 28:40
Insert at least 3 records of data into each table. The exact values do not matter, so feel free to make them
up. Just make sure that the data you insert makes sense, and that the tables tie together.
*/


select *from customer;


insert into CUSTOMER value
(1,'AASDS','dfff','gde@jjh3.45'),
(2,'GHJFFE','dfbbd','by@ce.6ff'),
(3,'JMDFVDRF','srvvkkv','kuf@32.d2')
;





select *from EMPLOYEE;


insert into EMPLOYEE value
(1,'ffff','yyyy','2011-06-30','manager'),
(2,'gggggg','kkkkk','2019-08-05','cashier'),
(3,'jjjjjj','llllll','2016-09-16','salesman')
;



select *from PRODUCTS;


insert into PRODUCTS value
(1,'big booties','2018-08-05'),
(2,'medium booties','2018-08-05'),
(3,'many booties','2018-08-05')
;





select *from CONSUMPTION_RECORD;


insert into CONSUMPTION_RECORD value
(1,'2','2','3','2019-01-22'),
(2,'1','1','2','2019-02-21'),
(3,'3','3','1','2019-03-01')
;



/*
(6)
~ 40:10
Create two users and give them access to the database. The first user, TuckerReilly, will be the DBA, and should
get full database administrator privileges. The second user, EllaBrody, is an Analyst, and only needs read access.
*/






