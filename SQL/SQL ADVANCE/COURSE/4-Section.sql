set SQL_MODE="TRADITIONAL,ALLOW_INVALID_DATES,ONLY_FULL_GROUP_BY";


set global max_allowed_packet = 1073741824;


select @@max_allowed_packet;









/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/



/* Create & Insert & Delete*/


create schema myfirstschemagggggg default character set UTF8;

use myfirstschema; 

create table myfirstcodetable(
	myfirstcodetable_id bigint not null,
    my_character_field varchar(50),
    my_text_field text,
    my_created_at timestamp,
    
    primary key(myfirstcodetable_id)
);

select *from myfirstcodetable;


select 
	my_text_field,
    my_created_at

from myfirstcodetable;



/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* creat schema , table , insert values*/


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

CREATE SCHEMA thriftshop;
USE thriftshop;

CREATE TABLE inventory (
  inventory_id BIGINT UNSIGNED NOT NULL,
  item_name VARCHAR(50),
  number_in_stock BIGINT,
  PRIMARY KEY (inventory_id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO inventory VALUES
(1,'fur coat',1),
(2,'mocassins',4),
(3,'velour jumpsuit',12),
(4,'house slippers',6),
(5,'brown leather jacket',3),
(6,'broken keyboard',6),
(7,'ski blanket',1),
(8,'kneeboard',2),
(9,'pro wings sneakers',2)
;
COMMIT; 

CREATE TABLE customers (
  customer_id BIGINT UNSIGNED NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO customers VALUES
(1, 'Mack', 'Lewis'),
(2, 'Ryan', 'More'),
(3, 'Brooklyn', 'Haggerty'),
(4, 'Tim', 'Grinnell'),
(5, 'Ray', 'Bridwell'),
(6, 'Ben', 'Dalton')
;
COMMIT;

CREATE TABLE customer_purchases (
  customer_purchase_id BIGINT UNSIGNED NOT NULL,
  customer_id BIGINT UNSIGNED NOT NULL,
  inventory_id BIGINT UNSIGNED NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO customer_purchases VALUES
(1, 1, 3),
(2, 1, 2),
(3, 1, 4),
(4, 1, 7),
(5, 2, 5),
(6, 3, 1),
(7, 4, 6),
(8, 5, 8),
(9, 6, 9),
(10, 2, 3),
(11, 1, 2),
(12, 1, 6)
; 
COMMIT; 

CREATE TABLE purchase_summary (
  purchase_summary_id BIGINT UNSIGNED NOT NULL,
  customer_id BIGINT UNSIGNED NOT NULL,
  total_purchases BIGINT UNSIGNED NOT NULL,
  purchase_excluding_last BIGINT UNSIGNED NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO purchase_summary VALUES
(1, 1, 6, 5),
(2, 2, 2, 1),
(3, 3, 1, 0),
(4, 4, 1, 0),
(5, 5, 1, 0),
(6, 6, 1, 0)
; 
COMMIT; 








/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/



use thriftshop;

select *from inventory;



insert into inventory(inventory_id,item_name,number_in_stock)values
(10,'wolf skin hat',1);



insert into inventory(inventory_id,item_name)values
(15,'wolf skin sneaker');



insert into inventory values
(11,'fur fox skin',1),
(12,'plaid button up shirt',8),
(13,'flannel zebra jammies',6);

											   

insert into inventory values
(16,'item that will not exist');			/*  這樣是錯誤的 */





/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


/* DElETING */


use thriftshop;

select *from inventory;



select @@autocommit;
set autocommit = 1;  -- (1,0).  (on,off). 
rollback;
commit;


delete from inventory
where inventory_id = 7;




/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


/* DATA FROM A FILE */



create schema survey;

use survey;

create table salary_sruvey(
	country	varchar(100),
    years_experience bigint,
    emplyment_status varchar(100),
    job_title varchar(100),
    is_manager varchar(50),
    education_level varchar(100)
);


select *from salary_sruvey;




/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*ASSIGNMENT 20 import file from CSV*/


create schema mavenbearbuilders;

use mavenbearbuilders;


create table order_items(
	order_item_id bigint,
    created_at varchar(120),
    order_id bigint,
    price_usd decimal(6,2),
    cogs_usd decimal(6,2),
    website_session_id bigint,
    primary key(order_item_id)
);

select *from order_items;

select						/* 為了確定 不同資料 IMPORT 的時間不同確定資料有載入*/
	MIN(created_at),
    MAX(created_at)
FROM order_items;





/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


/* ASSIGNMENT 22 */


use mavenbearbuilders;

create table order_item_refunds(
	order_item_refund_id bigint,
    create_at datetime,
    order_item_id bigint,
    order_id bigint,
    refund_amount_usd decimal(10,2),
    primary key(order_item_refund_id),
    foreign key(order_item_id) references order_items(order_item_id)
);


select *from order_item_refunds;





/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


/* ASSIGNMENT 24  Deleting Records */

use mavenbearbuilders;

select @@autocommit;
set autocommit = 0;


rollback;
commit;



select *from order_item_refunds;


delete from order_item_refunds -- 一定要用 primary key 才安全 
where order_item_refund_id between 6 and 10 ;  -- or 可以寫成。between 6 and 10






/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/



/* ASSIGNMENT 26  import Remaining DATA */




use mavenbearbuilders;




select *from order_items;

select 
	MAX(created_at),
    -- min(created_at),
    count(*) as records

from order_items
-- 159
;





select *from order_item_refunds;

select 
	max(create_at),
    count(*) as records

from order_item_refunds
-- 5
;




/***** 很重要 在你要import兩筆資料到不同的table時 注意先import有primary key 再 import到有foreign key 的資料中 *****/




/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* LOAD DATA =>   use code to automate the import of those files on a recurring basis   */


LOAD DATA
    [LOW_PRIORITY | CONCURRENT] [LOCAL]
    INFILE 'file_name'
    [REPLACE | IGNORE]
    INTO TABLE tbl_name
    [PARTITION (partition_name [, partition_name] ...)]
    [CHARACTER SET charset_name]
    [{FIELDS | COLUMNS}
        [TERMINATED BY 'string']
        [[OPTIONALLY] ENCLOSED BY 'char']
        [ESCAPED BY 'char']
    ]
    [LINES
        [STARTING BY 'string']
        [TERMINATED BY 'string']
    ]
    [IGNORE number {LINES | ROWS}]
    [(col_name_or_user_var
        [, col_name_or_user_var] ...)]
    [SET col_name={expr | DEFAULT}
        [, col_name={expr | DEFAULT}] ...]










/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/



