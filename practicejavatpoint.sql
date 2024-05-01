----select * from rank_demo

--select city,
--dense_rank() over(
--order by city
--) as rankpivo from rank_demo
--select city,
--rank() over(
--order by city
--) as rankpivo from rank_demo
--SELECT first_name, last_name, city,   
--RANK () OVER (PARTITION BY city ORDER BY first_name) AS Rank_No   
--FROM rank_demo;  








go
select * from  TargetProducts
select * from  Products

merge TargetProducts target using Products source
on target.ID=source.ID
when  matched then
 update 
set target.Price=source.Price
when not matched by target then
 insert (ID,Product_Name,Price) values (source.ID,source.Product_Name,source.Price)
when not matched by source
then delete;

