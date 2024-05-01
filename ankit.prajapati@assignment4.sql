








alter procedure [production].[order_slip]
@order_id int =0,
@customer_name varchar(255) =''
as
begin
select '==============','======================','======'
 union all
select 'Order Number :',(select convert(varchar,order_id) from sales.orders where order_id=@order_id), ''
 union all
select '=================','=======================','======'
 union all
select 'customer name:',(@customer_name),''
	union all
select '==================','======================','======'
	union all
select 'Product Name ',' Quantity  ','Amount'
	union all
select '===========   ','   ======     ','======'
	union all
select product_name,convert(varchar,quantity),convert(varchar,quantity*oi.list_price) amount from production.products p left join sales.order_items oi on p.product_id =oi.product_id where order_id=@order_id
	union all
select '===========   ','   ======     ','======'
	union all
select 'Total',convert(varchar,Sum(quantity)),convert(varchar,Sum(quantity*oi.list_price)) amount from production.products p left join sales.order_items oi on p.product_id =oi.product_id where order_id=@order_id
end
exec [production].[order_slip] 5,'ankit'
































select * from cusa

CREATE PROCEDURE ank.sp_insert_data

as

begin

	INSERT INTO ank.cusa

	SELECT 67,'HBJY'

end
 
 exec ank.sp_insert_data
select * from ank.cusa
--dbo.sp_insert_data
 
alter PROCEDURE ank.sp_update_data

as

begin

	UPDATE  ank.cusa SET name = 'ank' where id = 1

	SELECT * FROM ank.cusa

end
 
exec ank.sp_update_data
 
 
create PROCEDURE ank.sp_delete_data

as

begin

	delete from   ank.cusa where id = 3

	SELECT * FROM ank.cusa

end
 
exec ank.sp_delete_data
