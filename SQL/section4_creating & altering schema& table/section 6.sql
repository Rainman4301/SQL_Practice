
/*---------------------------------------------------------------------------------------------------------------------------*/
/* Section 6:  DATABASE DESIGN */
/*---------------------------------------------------------------------------------------------------------------------------*/






/*PRIMARY KEY & FOREIGN KEY */





use mavenfuzzyfactorymini;



select *from orders_mini
where order_id = 9994 ;

select *from order_items_mini
where order_id = 9994; -- this is the "foreign key", which links to the "primary key" in orders(order_id) --  


select *FROM order_item_refunds_mini;






/*---------------------------------------------------------------------------------------------------------------------------*/


/* Section 6: (40) ASSIGNMENT */



use onlinelearningschool;

select *from course_ratings;

select *from course_ratings_summaries;

select *from courses;


/* primary key => (course_id, rating_id) , (course_id ) 是 foreig_id 
   [course_id => one to many] */



 /*---------------------------------------------------------------------------------------------------------------------------*/


/* DATABASE NORMALIZATION */








use mavenfuzzyfactorymini;

select *from website_pageviews_non_normalized
where website_session_id = 20;





create table website_pageviews_normalized
select 
	website_pageview_id,
    created_at,
    website_session_id,
    pageview_url
from website_pageviews_non_normalized;



select *from website_pageviews_normalized;


create table website_session_normalized
select DISTINCT
	website_session_id,
    session_created_at,
    user_id,
    is_repeat_session,
    utm_source,
    utm_campaign,
    utm_content,
    device_type,
    http_referer
from website_pageviews_non_normalized
where website_session_id = 20;



select *from website_session_normalized;








/*---------------------------------------------------------------------------------------------------------------------------*/



/* Section 6: (44) ASSIGNMENT */





use onlinelearningschool;


select *from courses;

select  * from course_ratings;

select *from course_ratings_summaries;




alter table course_ratings
-- drop column course_name;
drop column instructor;




/*---------------------------------------------------------------------------------------------------------------------------*/




/* The EER Diagram Editor */



/*---------------------------------------------------------------------------------------------------------------------------*/







/*---------------------------------------------------------------------------------------------------------------------------*/



/* Section 6: (47) ASSIGNMENT */



use onlinelearningschool;

select *from course_ratings;

select *from course_ratings_summaries;

select *from courses;





/*---------------------------------------------------------------------------------------------------------------------------*/



