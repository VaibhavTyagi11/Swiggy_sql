create schema swiggy;
use swiggy;
select* from swiggy;

#q1 HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
select count(distinct restaurant_name) as high_rated_testautanst from swiggy where rating>=4.5;

#q2 WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select city, count(distinct restaurant_name)
 as number_of_restaurant
 from swiggy
 group by city
 order by number_of_restaurant desc
 limit 1;
 
 #q3 HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
 select count(distinct restaurant_name) 
 as pizza_restaurant
 from swiggy 
 where restaurant_name like "%pizza%";
 
 #q4 WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
 select cuisine, count(*) as cuisine_count 
 from swiggy
 group by cuisine
 order by cuisine_count desc 
 limit 1;
 
 #q5 WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
 select city, avg(rating) as average_rating 
 from swiggy group by city;


#q6 find the top 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN indian cuisine
select distinct restaurant_name, cost_per_person 
from swiggy where cuisine <> "indian"
order by cost_per_person desc
limit 5;

#q7 WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE'
#CATEGORY?
select distinct restaurant_name,menu_category,count(item) 
as no_of_items from swiggy
where menu_category="Main_Course"
group by restaurant_name, menu_category
order by no_of_items desc
limit 1;

#q8 which is the restaurant providing the lowest avg. price for all items?
select distinct restaurant_name,avg(price) 
as average_price
from swiggy
group by restaurant_name
order by average_price
limit 1; 

#q9 WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
select distinct restaurant_name,count(distinct menu_category) 
as no_of_category
from swiggy
group by restaurant_name
order by no_of_category desc
limit 5;

