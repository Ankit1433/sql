CREATE SCHEMA master 



select * from sys.schemas
create table master.products
(
product_id SMALLINT UNIQUE ,
product_name VARCHAR(256),
model_year SMALLINT,
list_price NUMERIC(10,2),

);
SELECT * from  master.products;
select * from sys.tables;


ALTER TABLE master.products ADD Brand_id SMALLINT;
ALTER TABLE master.products ALTER COLUMN Brand_id TINYINT;
SELECT * FROM sys.tables
select * from sys.columns where object_id='1093578934'
ALTER TABLE master.products drop column Brand_id 

drop table master.products
delete from mas