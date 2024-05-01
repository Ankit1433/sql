--functions
--select CHARINDEX('@',email) ,*

--from sales.customers



--select *
--from sales.order_items
--where ROUND(discount,2) between 0.2 and 0.4


---select GETDATE()

--select DATEADD(MINUTE,30, DATEADD( HOUR,5,GETUTCDATE()));

--select DATEDIFF(HOUR,'2023-12-30 11:30','2023-12-31 00:00'), 'hour',

-- DATEDIFF(MINUTE,'2023-12-30 11:30','2023-12-31 00:00'), 'minute',

--DATEDIFF(SECOND,'2023-12-30 11:30','2023-12-31 00:00'), 'second'
 




 /*select case


 when (list_price >0and list_price < 1000) then 'low' 
 when (list_price >2000 and list_price <3000) then 'mid'
 when (list_price >3000 and list_price <5000) then 'high'
end ,*  from production.products



declare @product_id int;
set @product_id=1;
declare @total int = (select max(product_id)from production.products)
while(@product_id<=@total)
begin
select * from production.products where product_id=@product_id
set @product_id=@product_id+1;
end; */

--SELECT 
  --  GETDATE() current_date_time;

--select CONVERT(date, GETDATE())




declare @start_date datetime2 = '2023-12-30 12:38:50';
declare @end_date datetime2   = '2023-12-31 23:59:59';

select datediff(hour,@start_date,@end_date) day,

datediff(SECOND,@start_date,@end_date)%24 hour,

datediff(SECOND,@start_date,@end_date)%60 min,


datediff(SECOND,@start_date,@end_date) second

Declare @totalsecond bigint = Datediff(SECOND,'05-19-02 00:00:00',getdate())
select 
Convert(varchar,@totalsecond/60/60/24/30/12) + ' years ' +

Convert(varchar,@totalsecond/60/60/24/12) + ' months ' +
Convert(varchar,@totalsecond/60/60/24) + ' Days ' +
Convert(varchar,@totalsecond/60/60%24) + ' Hours ' +
Convert(varchar,@totalsecond/60%60) + ' Minutes ' +  
Convert(varchar,@totalsecond%60) + ' Seconds '