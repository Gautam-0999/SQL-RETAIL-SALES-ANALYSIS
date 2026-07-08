-- SQL RETAIL SALES ANALYSIS - P1
create database SQL_ANALYSIS_PROJECT;
USE SQL_ANALYSIS_PROJECT;
Create Table RETAIL_SALES(
transactions_id INT PRIMARY KEY ,
sale_date DATE ,
sale_time TIME ,	
customer_id	INT ,
gender VARCHAR(15),
age	INT ,
category VARCHAR(15),
quantiy	INT ,
price_per_unit FLOAT ,
cogs FLOAT,
total_sale INT
);
SELECT * FROM RETAIL_SALES ;
select count(*) from RETAIL_SALES ;

-- checking null values 

SELECT * FROM RETAIL_SALES 
where 
 transactions_id is null
 or 
 sale_date is null
 or 
 sale_time is null
 or
 customer_id is null
 or
 gender is null
 or
 age is null
 or
 category is null
 or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null
 ;
 
 -- DATA CLEANING 
 SET SQL_SAFE_UPDATES=0;
 
DELETE FROM RETAIL_SALES
where 
 transactions_id is null
 or 
 sale_date is null
 or 
 sale_time is null
 or
 customer_id is null
 or
 gender is null
 or
 age is null
 or
 category is null
 or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null
 ;

-- DATA EXPLORATION 
-- HOW MANY SALES WE HAVE ?
SELECT COUNT(total_sale) FROM RETAIL_SALES;

-- HOW MANY UNIQUE CUSTOMERS WE HAVE ?
SELECT COUNT(DISTINCT customer_id)
from RETAIL_SALES;

 -- HOW MANY CATEGORIES WE HAVE 
 SELECT DISTINCT category FROM RETAIL_SALES;

-- data analysis and business key problems 

-- Q1 SQL QUERY TO RETRIVE ALL THE SALE ON THIS PARTICULAR DAY 2022-11-05

SELECT * FROM RETAIL_SALES
where sale_date='2022-11-05';


-- Q.3 - Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, SUM(total_sale) from RETAIL_SALES
GROUP BY category;

-- Q.4 - Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT category, ROUND(avg(age), 2) from RETAIL_SALES -- ROUND THE AVERAGE TO 2 DIGITS
where category = 'Beauty'
Group by category ;

-- Q.5 - Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * from RETAIL_SALES
where total_sale > 1000;

-- Q.6 - Write a SQL query to find total number of transactions (transaction_id) made by each gender in each category.
SELECT category , gender , count(transactions_id) from RETAIL_SALES
GROUP BY category , gender; 

-- Q.7 - Write a SQL query to calculate the average sale for each month. 
SELECT 
 year(sale_date) as year ,
 month(sale_date) as month ,
 AVG(total_sale) as avg_sale
 FROM RETAIL_SALES
 group by year , month 
 order by year , month ASC ;

-- Q.8 - Write a SQL query to find the top 5 customers based on the highest total sales.
select customer_id , sum(total_sale) as ts  from RETAIL_SALES
group by customer_id
limit 5 ;

-- Q.9 - Write a SQL query to find the number of unique customers who purchased items from each category.
select DISTINCT category,
	COUNT(distinct customer_id)
    from RETAIL_SALES
    GROUP BY category;

-- Q.10 - Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17).
SELECT * ,
	case 
		when hour(sale_time) < 12 then "MORNING"
        when hour(sale_time) between 12 and 17 then "AFTERNOON" 
	else "EVENING"
    end as shift 
FROM RETAIL_SALES ;

-- END OF PROJECT



