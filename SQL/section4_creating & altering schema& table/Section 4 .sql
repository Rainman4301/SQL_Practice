


/*---------------------------------------------------------------------------------------------------------------------------*/
/* Section 4: CREATING & ALTERING (SCHEMA & TABLE)
/*---------------------------------------------------------------------------------------------------------------------------*/




/*用ＵＩ或ＳＱＬ ＣＯＤＥ 建立 schema & table*/

USE myfirstschema;

select *from myfirstschema. myfirsttable;  /* "*" 代表選擇全部column */

use myfirstcodeschema;

create table myfirstcodetable(
	myfirstcodetable_id BIGINT NOT null,
    my_character_field varchar(50),
    my_text_field text,
    my_created_at timestamp,
    primary key(myfirstcodetable_id)			/* 最後一個不需要 comma*/
);


select
my_text_field,
my_created_at 
from myfirstcodeschema.myfirstcodetable;

/*---------------------------------------------------------------------------------------------------------------------------*/


/* Section 4: (21) ASSIGNMENT */

create schema toms_marketing_stuff default character set utf8mb4 ;   -- 字體設定

use  toms_marketing_stuff;

create table  publishers(
	publisher_id int,
    publisher_name varchar(65),
    primary key(publisher_id)
);


/* table 用 ui tool 建立*/


CREATE TABLE `toms_marketing_stuff`.`publisher_spend` (
  `publisher_spend_id` VARCHAR(45) NOT NULL,
  `publisher_id` INT NOT NULL,
  `month` DATE NOT NULL,
  `spend` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`publisher_spend_id`));



select *from toms_marketing_stuff.publishers;
select *from toms_marketing_stuff.publisher_spend;




/*---------------------------------------------------------------------------------------------------------------------------*/

/* 用ＵＩ或ＳＱＬ ＣＯＤＥ 新增 ＆ 刪除 table 中之columns*/


use thriftshop;

select *from customer_purchases;

select *from customers;

select *from inventory;


alter table customer_purchases
drop column customer_id;



alter table customer_purchases
add column purchase_amount decimal(10,2) after customer_purchase_id;






/*---------------------------------------------------------------------------------------------------------------------------*/


/* Section 4: (25) ASSIGNMENT */

select *from candy_products; 
select *from customer_reviews;
select *from candystore.employees;


alter table employees
drop column hourly_wage;

alter table employees
add column avg_customer_rating decimal(10.1) first; 



/*---------------------------------------------------------------------------------------------------------------------------*/



/* DROP SCHEMA & TABLE*/


drop schema mysecondcodeschema;


drop table myfirstschema.myfirsttable;





/*---------------------------------------------------------------------------------------------------------------------------*/


/* Section 4: (28) ASSIGNMENT */

drop table candystore.candy_products;


drop schema candystore_old;



/*---------------------------------------------------------------------------------------------------------------------------*/










