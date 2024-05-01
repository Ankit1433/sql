create database assign
use  assign

--CREATE SCHEMA sales

--CREATE SCHEMA production
select * from sys.schemas

create table sales.customers
(
	customer_id int primary key not null identity(1,1),
	first_name varchar(255),
	last_name varchar(255),
	phone bigint,
	email varchar(255),
	street varchar(255),
	city varchar(255),
	state varchar(255),
	zip_code int

);
select * from sales.customers;




create table sales.orders
(
	order_id int primary key not null identity(1,1),
	order_status bit,
	customer_id int not null
	constraint fk_group foreign key (customer_id)
	references sales.customers (customer_id),
	order_date date,
	required_date date,
	shipped_date date,
	store_id int unique not null,
	staff_id int unique not null,

);
alter table Sales.orders add constraint fk_orders foreign key (staff_id) REFERENCES Sales.staffs(staff_id)
alter table Sales.orders add  foreign key (store_id) REFERENCES Sales.stores(store_id)

select * from sales.orders;




create table sales.staffs
(
	staff_id int primary key not null ,
	first_name varchar(255),
	last_name varchar(255),
	email varchar(255),
	phone bigint,
	active  varchar(255),
	store_id int not null unique,
	manager_id int not null unique,


);

alter table Sales.staffs add  foreign key (store_id) REFERENCES Sales.stores(store_id)





create table sales.stores
(
	store_id int primary key not null identity(1,1),
	store_name varchar(255),
	phone bigint,
	email varchar(255),
	street varchar(255),
	city varchar(255),
	state varchar(255),
	zip_code int

);



create table sales.order_items
(
	order_id int  not null ,
	item_id int not null,
	product_id int not null,
	constraint fk_order_items_1 foreign key (product_id)
	references production.products (product_id),
	constraint fk_order_items foreign key (order_id)
	references sales.orders (order_id),
	quantity int not null,
	list_price numeric not null,
	discount numeric not null,
	primary key (order_id,item_id)
);
drop table sales.order_items














create table Production.categories
(
category_id int primary key not null identity(1,1),
category_name varchar(255),
);

select * from production.categories;

create table production.products
(
product_id int primary key not null ,
product_name varchar(255),
brand_id int not null,
category_id int not null,
constraint fk_products foreign key (category_id)
	references production.categories (category_id),
model_year date,
list_price numeric 
);
select * from production.products;
drop table production.products;

alter table production.products add constraint fk_production_products foreign key (brand_id) REFERENCES production.brands(brand_id)



create table production.stocks
(
store_id int not null identity(1,1),
product_id int,
constraint fk_stocks foreign key (store_id)
	references sales.stores (store_id),
constraint fk_stock foreign key (product_id)
	references production.products (product_id),
quantity int
primary key(store_id,product_id)
);




create table production.brands
(
brand_id int primary key not null identity(1,1),
brand_name varchar(255)
);


















--insert value

insert into Sales.customers(first_name,last_name,phone,email,street,city,state,zip_code)

values ('ankit','patel',8976543210,'abc24@gmail.com','abc','surat','gujarat',234567);
select * from sales.customers;
 
insert into Sales.customers(first_name,last_name,phone,email,street,city,state,zip_code)

values ('anki','pat',7016391409,'prajapatiankit445@gmail.com','udhna','surat','gujarat',394210);
 
--create table

--insert value
select * from sales.staffs;
insert into Sales.orders(customer_id,order_status,order_date,required_date,store_id,staff_id)

values (1,'0','2023-12-11','2023-12-11','1','1');
 
select * from Sales.orders
 
--insert value

insert into Sales.staffs(staff_id,first_name,last_name,email,phone,active,store_id,manager_id)

values(1,'bhumika','patel','abc@gmail.com',1234567890,'yes',1,1)
 

--insert value

insert into Sales.stores(store_name,phone,email,street,city,state,zip_code)

values('abc',1245378965,'abc@gmail.com','xyz','surat','gujrat',245687)
 
--create table

--insert value

insert into sales.order_items(order_id,item_id,product_id,quantity,list_price,discount)

values (4,1,1,5,11,50)
 
--create table

--insert value

insert into Production_categories(category_id,category_name)

values(1,'abc')
 
--create table

select product_id,product_name,brand_id,category_id,model_year,list_price from Production_products

select * from Production_products
 
--insert value 

insert into  Production_products(product_id,product_name,brand_id,category_id,model_year,list_price )

values(1,'myproduct',1,1,2023,50)
 
 
select store_id,product_id,quantity from Production_stocks

select * from Production_stocks
 
--insert value

insert into Production_stocks(store_id,product_id,quantity)

values(1,1,23)
 

select * from Production_brands

select brand_id,brand_name from Production_brands
 
--insert value

insert into Production_brands(brand_id,brand_name)

values(1,'new')
