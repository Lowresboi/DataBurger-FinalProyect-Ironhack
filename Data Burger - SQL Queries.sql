use data_burger;

-- Top 10 sellers stores worldwide?
select marketid, locationid, marketsize, sales
from data_burger_v2
order by sales desc
limit 10;

-- Top sellers stores for each market?
select marketid, locationid, sales
from data_burger_v2
where marketsize = 'Large'
order by sales desc
limit 10;

select marketid, locationid, sales
from data_burger_v2
where marketsize = 'Medium'
order by sales desc
limit 10;

select marketid, locationid, sales
from data_burger_v2
where marketsize = 'Small'
order by sales desc
limit 10;

-- Ammount of sales worldwide for each promotion
select promotion, SUM(sales) as total_sales
from data_burger_v2
where promotion in ('Query Blue Cheese', 'Tableau Pork BBQ', 'Python Angus')
group by promotion
order by promotion desc;

-- Total ammount of sales in this month
select count(locationid) as number_of_stores, sum(sales) as total_sales
from data_burger_v2;

-- Total ammount of sales for each market
select marketsize as market, count(distinct locationid) as number_of_stores, sum(sales) as total_sales_market
from data_burger_v2
where marketsize in ('Large', 'Medium', 'Small')
group by marketsize
order by total_sales_market desc;

-- Sales in each week in each market
select marketsize as market, week, sum(sales) as total_sales_week
from data_burger_v2
group by marketsize, week
order by marketsize, week;