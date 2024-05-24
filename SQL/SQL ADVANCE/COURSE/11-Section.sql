



/* Section 11 Store Procedures & Scheduled Events */

/**************************************************************************************************************************************************************************************************************************************************************************/

use thriftshop;


 --  delimiter == (;)   這裡為了要使用(;)這個符號但又不代表結束 所以把它改成（//）
DELIMITER //

create procedure sp_selectAllInventory()
 begin
  select *from inventory;
 end //

DELIMITER ;


call sp_selectAllInventory;









use mavenmovies;

select *from rental
where customer_id = 135;



DELIMITER //
create procedure customer_rentals
(IN custid BIGINT)					-- (為了可以自行選擇自己想用哪種資訊讓Query時更彈性)

begin
SELECT *from rental
where customer_id = custid;
end //

DELIMITER ;	


call customer_rentals(32);

-- Error Code: 1318. Incorrect number of arguments for PROCEDURE mavenmovies.customer_rentals; expected 1, got 0
















delimiter //

create procedure customer_rentals_w_total
(in custid bigint, out total_rentals bigint)
begin
	select count(rental_id) into total_rentals 
    from rental
    where customer_id = custid;
    
    select *from rental
    where customer_id = custid;

end//

delimiter ;



call customer_rentals_w_total(50 , @total_rentals);

select @total_rentals;


/**************************************************************************************************************************************************************************************************************************************************************************/

/*Scheduled Events*/


create schema schema_for_events;

use schema_for_events;


create table sillytable(
timestamps_via_event datetime
);



create event myfirstevent
	on schedule at current_timestamp + interval 5 second -- (1 minute) 可自選
    do
		insert into sillytable value (NOW());
	
select *from sillytable;




create event mysecondevent
	on schedule every 5 second 
    do
		insert into sillytable value (NOW());

drop event mysecondevent;









/**************************************************************************************************************************************************************************************************************************************************************************/


/*Assignment 68 Store Procedures*/








use mavenbearbuilders;



drop procedure order_performance;




delimiter //

create procedure order_performance()
begin
	select 
		count(order_id) as total_orders, 
		sum(price_usd) as total_revenue
	from orders
	where date(created_at) between'2013-11-01' and '2013-12-31';  --  這裡 between (A) and (B) 意思是只有Ａ,Ｂ兩選項而已


end//

delimiter ;


call order_performance;








select 
	count(order_id) as total_orders, 
	sum(price_usd) as total_revenue
from orders
where date(created_at) between'2013-11-01' and '2013-12-31'  --  這裡 between (A) and (B) 意思是只有Ａ,Ｂ兩選項而已









delimiter //

create procedure order_performance(in startdate date,in enddate date)
begin
	select 
		count(order_id) as total_orders, 
		sum(price_usd) as total_revenue
	from orders
	where date(created_at) between startdate and enddate; 

end//

delimiter ;




call order_performance;  -- Error Code: 1318. Incorrect number of arguments for PROCEDURE mavenbearbuilders.order_performance; expected 2, got 0

call order_performance('2013-12-01' , '2013-12-31' );





/**************************************************************************************************************************************************************************************************************************************************************************/

/**************************************************************************************************************************************************************************************************************************************************************************/

/**************************************************************************************************************************************************************************************************************************************************************************/


