select '==============','======================','======'
 union all

select 'Order Number :',(select convert(varchar,order_id) from sales.orders where order_id=1 ), ''
 
 union all

select '=================','=======================','======'
 
 union all

select 'Customer Name:' , convert(varchar,(select first_name from sales.orders o left join  sales.customers c on c.customer_id = o.order_id where order_id='1')),convert(varchar,(select last_name from sales.orders o left join  sales.customers c on c.customer_id = o.order_id where order_id='1'))

	union all
select '==================','======================','======'

	union all

select 'Product Name ',' Quantity  ','Amount'

	union all

select '===========   ','   ======     ','======'

	union all

select product_name,convert(varchar,quantity),convert(varchar,quantity*oi.list_price) amount from production.products p left join sales.order_items oi on p.product_id =oi.product_id where order_id='1'
	
	union all


select '===========   ','   ======     ','======'

	union all

select 'Total',convert(varchar,Sum(quantity)),convert(varchar,Sum(quantity*oi.list_price)) amount from production.products p left join sales.order_items oi on p.product_id =oi.product_id where order_id='1'
	


