--pivot
select * from
(
select brand_name,sum(o.list_price*quantity) as sales_amount,category_name
from production.categories c
left join
production.products p
on c.category_id=p.category_id
left join
production.brands b
on p.brand_id=b.brand_id
left join
sales.order_items o
on p.product_id=o.product_id
group by brand_name,category_name
) t
pivot(
sum(sales_amount)
for brand_name in (
[Electra],
[Haro],
[Heller],
[Pure Cycles],
[Ritchey],
[Strider],
[Sun Bicycles],
[Surly],
[Trek]
))
as pivot_table;
/*
declare
@columns nvarchar(max)='';
select 
@columns+=QUOTENAME(brand_name)+','
from
production.brands
order by brand_name;
print @columns;
*/



go
CREATE OR ALTER FUNCTION func(
    @string VARCHAR(MAX), 
    @delimiter VARCHAR(50) = ' ')
RETURNS @parts TABLE
(    
val VARCHAR(MAX)   
)
AS
BEGIN

DECLARE @index INT = -1;

WHILE (LEN(@string) > 0) 
BEGIN 
    SET @index = CHARINDEX(@delimiter , @string)  ;
    
    IF (@index = 0) AND (LEN(@string) > 0)  
    BEGIN  
        INSERT INTO @parts 
        VALUES (@string);
        BREAK  
    END 

    IF (@index > 1)  
    BEGIN  
        INSERT INTO @parts 
        VALUES (LEFT(@string, @index - 1));
        
        SET @string = RIGHT(@string, (LEN(@string) - @index));  
    END 
    ELSE
    SET @string = RIGHT(@string, (LEN(@string) - @index)); 
    END
RETURN
END
GO

SELECT 
    * 
FROM 
    func('abc,bar,xyz,def',',');
