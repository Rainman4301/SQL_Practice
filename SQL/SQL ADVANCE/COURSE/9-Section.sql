






/* Section 9 creating Views */

/**************************************************************************************************************************************************************************************************************************************************************************/



use survey;

select *from salary_sruvey;





/*見一個VIEW 可以在使用權限時決定誰可以看這個資訊*/
-- create view country_average as 
/*這裡超重要 可以知道一間公司的數據 */
select
	country,
    count(*) as respondents,
    AVG(years_experience) as yrs_experience,
    AVG(case 
		when is_manager = "yes" then 1 
        else 0
        end
        ) as percent_manager,
        
	AVG(case 
		when education_level = "Masters" then 1 
        else 0
        end
        ) as percent_masters
        
	From salary_sruvey
    group by 1
    order by 2 desc;




select *from country_average;




/**************************************************************************************************************************************************************************************************************************************************************************/

/*Assigment 58 Creating Website Session*/



use mavenbearbuilders;




create table website_session(
website_session_id bigint,
created_at datetime,
user_id bigint,
is_repeat_session int,
utm_source varchar(50),
utm_campaign varchar(50),
utm_content varchar(50),
device_type varchar(50),
http_referer varchar(100),
primary key (website_session_id)
);



select 
	max(created_at) 
from website_session;





/**************************************************************************************************************************************************************************************************************************************************************************/

/* Assigment 60 Creating Views */



use mavenbearbuilders;

select *from website_session;





create view monthly_session as 
select
	year (created_at) as year,
    month (created_at) as month,
    utm_source,
    utm_campaign,
    count(website_session_id) as number_of_session
    from website_session
    group by 1,2,3,4;


select *from monthly_session;




/**************************************************************************************************************************************************************************************************************************************************************************/


