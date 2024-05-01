select * from master.products;
alter table master.products ADD  quantity int not null;
alter table master.products ALTER COLUMN quantity VARCHAR(20) not null;

INSERT INTO master.products VALUES ('2','bag','2002','500','1');
alter table master.products ALTER COLUMN product_id smallint not null;

alter table master.products add  primary key(product_id);
alter table master.products alter column product_id int not  null;


--identity
create table employee(
p_id  int identity(10,1) primary key not null,
p_name varchar(255),
age int
);
drop table employee;
select * from employee
insert into employee values ('ankit','21')
select age from employee