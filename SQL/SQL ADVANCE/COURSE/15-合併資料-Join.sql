


/* inner join. /left join. /right join. /outer join. 資料合併 */
/***********************************************************************************************************************************************************************************************************************************************************************************/




/*inner join*/

create schema datajointrain;

use datajointrain;

create table product(
	id int auto_increment,
    name varchar(200) not null,
    
    primary key (id)
);

select *from product;


insert into product (name) value
('美式'),
('拿鐵'),
('奶茶');



create table variant(
	id int auto_increment,
    product_id int,
    size varchar(10) not null,
    price decimal(10,2) not null,
    
    primary key (id)
);

select *from variant;


insert into variant(product_id,size,price) value
(1,'中杯',40),
(1,'大杯',50),
(2,'中杯',50),
(2,'大杯',60),
(3,'中杯',45),
(3,'大杯',55);




select *from product inner join variant on product.id = variant.product_id;


select product.name,variant.size,variant.price 
from product inner join variant on product.id = variant.product_id;






/******************************************************************************************************************************************************************************/


/*   left join,  right join   */




select *from product inner join variant on product.id = variant.product_id;
select *from product left join variant on product.id = variant.product_id;
select *from product right join variant on product.id = variant.product_id;




insert into product(name) value
('青茶');

insert into variant(product_id,size,price) value
(5,'大杯',100);


select *from product;

select *from variant;



select *from product inner join variant on product.id = variant.product_id;
select *from product left join variant on product.id = variant.product_id;
select *from product right join variant on product.id = variant.product_id;



