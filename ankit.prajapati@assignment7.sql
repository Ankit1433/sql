---------------------------query1------------------------------------------------------------------------------------
alter procedure Sales.slips

  @orderid int =0
  
 as
 begin


select 'Order_NO:',convert(varchar,@orderid),'','','' from Sales.SalesOrderHeader where  SalesOrderID=@orderid
union all
select '========' ,'========','========','========','========' 
union all
select 'OrderDate:',convert(varchar,OrderDate),'','','' from Sales.SalesOrderHeader where SalesOrderID=@orderid
union all

select '========','========','========','========','========'  
union all
select 'ShipDate:',convert(varchar,ShipDate),'','','' from Sales.SalesOrderHeader where  SalesOrderID=@orderid
union all
select '========','========','========','========','========'  
union all
select '','Title','FirstName','Lastname','' 
union all
select  'Customer_name:',isnull(pp.Title,''),isnull(pp.FirstName,''),isnull(pp.LastName,''),'' from Person.Person pp 
inner join sales.PersonCreditCard pcc on pp.BusinessEntityID=pcc.BusinessEntityID 
inner join sales.CreditCard cc on pcc.CreditCardID=cc.CreditCardID
inner join sales.SalesOrderHeader soh on soh.CreditCardID=cc.CreditCardID 
where  soh.SalesOrderID=@orderid

/*
select P.Title,P.FirstName,P.MiddleName,P.LastName
from Person.Person p
left join
Sales.vIndividualCustomer v  on
v.BusinessEntityID=p.BusinessEntityID join 
Sales.Customer c on
P.BusinessEntityID=c.PersonID join sales.SalesOrderHeader s on
c.CustomerID=s.CustomerID
where s.SalesOrderID='43660'

*/



union all
select '========','========','========','========','========' 
union all
select '========','AddressLine1','AddressLine2','City','PostalCode' 
union all
select 'Shipping Address:',AddressLine1,isnull(AddressLine2,'-'),City,PostalCode
from Person.Address pa 
inner join Sales.SalesOrderHeader soh
on pa.AddressID=soh.BillToAddressID
where soh.SalesOrderID=@orderid
union all
select '========','========','========','========','========' 
union all
select 'Billing Address:',AddressLine1,isnull(AddressLine2,'-'),City,PostalCode
from Person.Address pa 
inner join Sales.SalesOrderHeader soh
on pa.AddressID=soh.ShipToAddressID
where soh.SalesOrderID=@orderid
union all
select '========','========','========','========','========' 
union all
select 'ProductName','Quantity','Unit Price','productAmount','========' 
union all
select name as ProductName ,
convert(varchar,OrderQty) as Quantity,
convert(varchar,UnitPrice) AS unitprice,
convert(varchar,ListPrice) AS productAmount,
''
from Production.Product p1 
join Sales.SalesOrderDetail sod 
on sod.ProductID=p1.ProductID 
join Sales.SalesOrderHeader soh
on sod.SalesOrderID=soh.SalesOrderID
where sod.SalesOrderID=@orderid
union all
select '========','========','========','========','========' 
union all
select 'Total Amount' ,convert(varchar,subtotal),'','','' from sales.SalesOrderHeader
where SalesOrderID=@orderid
end


exec Sales.slips @orderid= '43669'













---------------------------query2------------------------------------------------------------------------------------

select Name as productName,subtotal,sum(OrderQty) orderqty
from Production.Product p
inner join
sales.SalesOrderDetail sod
on p.ProductID=sod.ProductID
inner join
sales.SalesOrderHeader soh
on soh.SalesOrderID=sod.SalesOrderID
group by Name,subtotal,OrderQty,UnitPrice






---------------------------query3------------------------------------------------------------------------------------
select top 5 (Purchasing.Vendor.Name),
sum(StandardPrice) as SALE_AMOUNT
from Purchasing.ProductVendor 
join Purchasing.Vendor
on Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID
join Production.Product
on Purchasing.ProductVendor.ProductID =  Production.Product.ProductID
group by Purchasing.Vendor.Name
order by SALE_AMOUNT DESC

---------------------------query4------------------------------------------------------------------------------------
/*
select ve.Name as vendor,pr.Name as productname,
count(pr.ListPrice),pr.SafetyStockLevel,
(pr.ListPrice * pr.SafetyStockLevel) as productstockamount
from 
Purchasing.Vendor ve
inner join
Purchasing.ProductVendor pve
on ve.BusinessEntityID=pve.BusinessEntityID
inner join Production.Product pr
on pve.ProductID=pr.ProductID
inner join
sales.SalesOrderDetail sod
on pr.ProductID = sod.ProductID
where  sod.SalesOrderDetailID not in (sod.ProductID)
group by count(pr.ListPrice)
--second way

*/
--realsirway
select v.Name as vender_name,p.Name as product_name,p.ListPrice,p.SafetyStockLevel  as stock_level,
sum(p.SafetyStockLevel*p.StandardCost) productstockamount
from Purchasing.vVendorWithContacts v join Purchasing.ProductVendor d on v.BusinessEntityID=d.BusinessEntityID 
join Production.Product p on d.ProductID=p.ProductID 
join Sales.SalesOrderDetail sod on d.ProductID=sod.ProductID
group by v.Name, p.Name,p.ListPrice,p.SafetyStockLevel

--real way(jainam)
SELECT ve.Name 'Vendor Name',
po.Name 'Product Name',
po.ListPrice,
sum(pii.Quantity) 'Quantity',
po.ListPrice*sum(pii.Quantity) 'Product Stock Amount'
from Purchasing.Vendor ve
left JOIN Purchasing.ProductVendor pve
ON ve.BusinessEntityID=pve.BusinessEntityID
left JOIN Production.Product po
ON po.ProductID=pve.ProductID
left JOIN Sales.SpecialOfferProduct sop
ON sop.ProductID=po.ProductID
left JOIN Sales.SalesOrderDetail sod
ON sod.ProductID = sop.ProductID
left JOIN Production.ProductInventory pii
on pii.ProductID=po.ProductID
WHERE sod.ProductID is null or sod.ProductID=0
GROUP BY ve.name,po.name,po.ListPrice,sod.ProductID
ORDER BY po.ListPrice desc


----------query5----------------------------------------------------------------------------

select wor.WorkOrderID,wor.ProductID,lo.Name,wor.ActualCost as TotalActualCost,wor.ActualResourceHrs 
from
Production.Location lo

left join
Production.WorkOrderRouting wor
on lo.LocationID=wor.LocationID
where wor.ScheduledStartDate <> wor.ActualStartDate
group by wor.ActualCost,wor.WorkOrderID,wor.ProductID,lo.Name,wor.ActualResourceHrs

--secondway
/*

select wor.WorkOrderID,wor.ProductID,l.Name,wor.ActualResourceHrs,wor.ActualCost 'Total Actual Cost' from Production.WorkOrderRouting wor
join Production.Location l on wor.LocationID = l.LocationID
where wor.ScheduledStartDate != wor.ActualStartDate
group by wor.workOrderID,l.Name,wor.ProductID,wor.ActualResourceHrs,wor.ActualCost

*/


----------query6----------------------------------------------------------------------------



select plph.ProductID,p.Name,v.Name,count(plph.ModifiedDate) as modified from Production.Product p
left join
Production.ProductListPriceHistory plph
on p.ProductID=plph.ProductID
inner join
Purchasing.ProductVendor pv
on plph.ProductID=pv.ProductID
inner join
Purchasing.Vendor v
on pv.BusinessEntityID=v.BusinessEntityID
where ( v.Name not like 'Integrated Sport Products'  and p.Color ='red')
group by plph.ProductID,p.Name,v.name
having count(plph.ModifiedDate)>2







----------query7----------------------------------------------------------------------------
select *
from Production.ProductReview pr
right join
Production.Product p
on pr.ProductID= p.ProductID 
inner join 
Sales.SpecialOfferProduct sop 
on p.ProductID=sop.ProductID
inner join
Sales.SpecialOffer so
on sop.SpecialOfferID=so.SpecialOfferID
where Category='Customer' and ProductReviewID is not null