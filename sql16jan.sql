alter procedure Sales.slips

  @orderid int =0
  
 as
 begin

select '========','========','========','========'  as order_Slip
union all
select 'Order_NO:',convert(varchar,@orderid),'','' from Sales.SalesOrderHeader where  SalesOrderID=@orderid
union all
select '========','========','========','========' 
union all
select 'OrderDate:',convert(varchar,OrderDate),'','' from Sales.SalesOrderHeader where SalesOrderID=@orderid
union all

select '========','========','========','========' 
union all
select 'ShipDate:',convert(varchar,ShipDate),'','' from Sales.SalesOrderHeader where  SalesOrderID=@orderid;
select '========','========','========','========' 

end


exec Sales.slips @orderid= '43659'
