use etl;

SELECT*FROM 50_startups;
-- LIST ALL STARTUPS WITH A PROFIT HIGHER THAN THE AVERAGE PROFIT
select *from 50_startups where profit >(select avg(profit) from 50_startups);

-- LIST STARTUPS WITH A PROFIT ABOVE THE AVERAGE PROFIT OF STARTUPS LOCATED IN 'CALIFORNIA'
select *from 50_startups where state='california' and profit>(select avg(profit) from 50_startups);

-- FIND THE STARTUPS WITH THE LOWEST ADMINISTRATIVE COST
select *from 50_startups order by admin limit 1;

 -- COUNT THE NUMBER OF STARTUPS  LOCATED IN EACH STATE
 select state,count(*) from 50_startups group by state having count(state);
 
 -- LIST STARTUPS WITH A PROFIT HIGHER THAN THE AVERAGE PROFIT OF STARTUPS WITH 'CALIFORNIA' AS THE STATE
 select *from 50_startups where state='california' and profit >(select avg(profit)from 50_startups);
 
 -- LIST STARTUPS WITH A PROFIT HIGHER THAN THE PROFIT OF ANY STARTUPS LOCATED IN FLORIDA
SELECT state,rnd,admin, profit
FROM 50_startups
WHERE profit > (
  SELECT MAX(profit)
  FROM 50_startups
  WHERE state = 'Florida');

-- COUNT THE NUMBER OF STARTUPS WITH A PROFIT HIGHER THAN THE AVERAGE PROFIT OF STARTUPS LOCATED IN 'NEW YORK'
select count(*) from 50_startups where state='new york' and profit > 
(select avg(profit) from 50_startups);

-- LIST STARTUPS WITH A MARKETING SPEND HIGHER THAN THE MARKETING SPEND OF THE STARTUPS WITH THE SECOND HIGHEST RND SPEND
SELECT state,profit,admin,rnd,mkt
FROM 50_startups
WHERE mkt > (
  SELECT rnd
  FROM 50_startups
  ORDER BY rnd DESC
  LIMIT 1 offset 1);
