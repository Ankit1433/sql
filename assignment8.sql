CREATE TABLE hotel
( hotel_no CHAR(4) primary key,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL,

)

CREATE TABLE room
( room_no VARCHAR(4) primary key,
hotel_no CHAR(4) NOT NULL,
type CHAR(1) NOT NULL,
price DECIMAL(5,2) NOT NULL
foreign key (hotel_no)  references hotel(hotel_no) 
);

CREATE TABLE guesti
( guest_no varCHAR(4) primary key,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

CREATE TABLE booking
(hotel_no CHAR(4) not null,
guest_no varCHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no varCHAR(4) NOT NULL
foreign key (hotel_no)  references hotel(hotel_no),
foreign key (room_no)  references room(room_no) ,
foreign key (guest_no)  references guesti(guest_no) 
);







INSERT INTO hotel
VALUES ('H111', 'Grosvenor Hotel', 'London');
INSERT INTO room
VALUES ('1', 'H111', 'S', 72.00);
INSERT INTO guesti
VALUES ('G111', 'John Smith', 'London');
INSERT INTO booking
VALUES ('H111', 'G111', '1999-01-01', '1999-01-02', '1')



-- Additional data for hotel table
INSERT INTO hotel VALUES ('H112', 'Grand Plaza Hotel', 'New York');
INSERT INTO hotel VALUES ('H113', 'Seaside Resort', 'Miami');
INSERT INTO hotel VALUES ('H114', 'Mountain View Lodge', 'Denver');
INSERT INTO hotel VALUES ('H115', 'City Center Inn', 'Chicago');
 
-- Additional data for room table
INSERT INTO room VALUES ('2', 'H112', 'D', 120.00);
INSERT INTO room VALUES ('3', 'H113', 'S', 95.00);
INSERT INTO room VALUES ('4', 'H114', 'D', 110.00);
INSERT INTO room VALUES ('5', 'H115', 'S', 80.00);
 
-- Additional data for guest table
INSERT INTO guesti VALUES ('G112', 'Emily Johnson', 'Los Angeles');
INSERT INTO guesti VALUES ('G113', 'Michael Davis', 'San Francisco');
INSERT INTO guesti VALUES ('G114', 'Sophia Rodriguez', 'Miami');
INSERT INTO guesti VALUES ('G115', 'Daniel Brown', 'New York');
 
-- Additional data for booking table
INSERT INTO booking VALUES ('H112', 'G112', '2000-02-15', '2000-02-20', '2');
INSERT INTO booking VALUES ('H113', 'G113', '2001-05-10', '2001-05-15', '3');
INSERT INTO booking VALUES ('H114', 'G114', '2002-08-22', '2002-08-25', '4');
INSERT INTO booking VALUES ('H115', 'G115', '2003-11-01', '2003-11-05', '5');







-- Values for hotel table
INSERT INTO hotel VALUES ('H001', 'Luxury Suites', '123 Main Street');
INSERT INTO hotel VALUES ('H002', 'Seaview Resort', '456 Ocean Avenue');
INSERT INTO hotel VALUES ('H003', 'Mountain Retreat', '789 Pine Lane');
INSERT INTO hotel VALUES ('H004', 'City Center Hotel', '321 Downtown Plaza');
INSERT INTO hotel VALUES ('H005', 'Riverside Inn', '555 River Road');
INSERT INTO hotel VALUES ('H006', 'Skyline Tower', '777 High Street');
INSERT INTO hotel VALUES ('H007', 'Golden Sands Resort', '888 Beachfront Blvd');
INSERT INTO hotel VALUES ('H008', 'Cozy Cabin Inn', '999 Forest Trail');
INSERT INTO hotel VALUES ('H009', 'Urban Oasis Hotel', '111 Metropolitan Ave');
INSERT INTO hotel VALUES ('H010', 'Harbor View Lodge', '222 Harbor Drive');
 
-- Values for room table
INSERT INTO room VALUES ('R001', 'H001', 'S', 150.00);
INSERT INTO room VALUES ('R002', 'H002', 'D', 200.00);
INSERT INTO room VALUES ('R003', 'H003', 'S', 120.00);
INSERT INTO room VALUES ('R004', 'H004', 'D', 180.00);
INSERT INTO room VALUES ('R005', 'H005', 'S', 100.00);
INSERT INTO room VALUES ('R006', 'H006', 'D', 220.00);
INSERT INTO room VALUES ('R007', 'H007', 'S', 170.00);
INSERT INTO room VALUES ('R008', 'H008', 'D', 160.00);
INSERT INTO room VALUES ('R009', 'H009', 'S', 130.00);
INSERT INTO room VALUES ('R010', 'H010', 'D', 190.00);
 
-- Values for guest table
INSERT INTO guesti VALUES ('G001', 'Alice Johnson', '456 Oak Street');
INSERT INTO guesti VALUES ('G002', 'Bob Smith', '789 Maple Avenue');
INSERT INTO guesti VALUES ('G003', 'Catherine Davis', '123 Pine Lane');
INSERT INTO guesti VALUES ('G004', 'David Brown', '987 Elm Road');
INSERT INTO guesti VALUES ('G005', 'Emily White', '654 Birch Lane');
INSERT INTO guesti VALUES ('G006', 'Frank Miller', '321 Cedar Street');
INSERT INTO guesti VALUES ('G007', 'Grace Taylor', '555 Willow Avenue');
INSERT INTO guesti VALUES ('G008', 'Henry Harris', '888 Rose Street');
INSERT INTO guesti VALUES ('G009', 'Ivy Martin', '999 Laurel Lane');
INSERT INTO guesti VALUES ('G010', 'Jack Turner', '222 Spruce Avenue');
 
-- Values for booking table
INSERT INTO booking VALUES ('H001', 'G001', '2024-01-20', '2024-01-25', 'R001');
INSERT INTO booking VALUES ('H002', 'G002', '2024-02-10', '2024-02-15', 'R002');
INSERT INTO booking VALUES ('H003', 'G003', '2024-03-05', '2024-03-10', 'R003');
INSERT INTO booking VALUES ('H004', 'G004', '2024-04-15', '2024-04-20', 'R004');
INSERT INTO booking VALUES ('H005', 'G005', '2024-05-01', '2024-05-05', 'R005');
INSERT INTO booking VALUES ('H006', 'G006', '2024-06-20', '2024-06-25', 'R006');
INSERT INTO booking VALUES ('H007', 'G007', '2024-07-10', '2024-07-15', 'R007');
INSERT INTO booking VALUES ('H008', 'G008', '2024-08-05', '2024-08-10', 'R008');
INSERT INTO booking VALUES ('H009', 'G009', '2024-09-15', '2024-09-20', 'R009');
INSERT INTO booking VALUES ('H010', 'G010', '2024-10-01', '2024-10-05', 'R010');



--queries

UPDATE room SET price = price*1.05;

CREATE  TABLE booking_old
( hotel_no CHAR(4) NOT NULL,
guest_no varCHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no VARCHAR(4) NOT NULL
foreign key (hotel_no)  references hotel(hotel_no),
foreign key (room_no)  references room(room_no) ,
foreign key (guest_no)  references guesti(guest_no) 

);

select*from booking_old
INSERT INTO booking_old(hotel_no,guest_no,date_from,date_to,room_no)
select * FROM booking
WHERE date_to < '2000-01-01'
 
DELETE FROM booking
WHERE date_to < '2000-01-01';


--1
select * from hotel
--2
select * from hotel
where  address like 'london'
--3
select name,address from hotel
where address like 'london'
order by name
--4
select * from room
where price <150  and type <> 's'
order by price 
--5
select * from booking
where date_to !=0
--6
select count(hotel_no) hotel_count from hotel 
--7
select avg(price)  as avg_price from room 
--8
select sum(price) total from room
where type ='d'
--9
select * from booking 
where  month(date_from) = 08 
--10
select r.price,r.type from hotel h
inner join 
room r
on h.hotel_no=r.hotel_no
where name='Grosvenor Hotel'

--11
select g.[name],
b.[room_no],
[type],
[price]
from booking b
join hotel h
on h.hotel_no=b.hotel_no
join guesti g
on b.guest_no=g.guest_no
join room
on room.room_no=b.room_no
where h.name='Grand Plaza Hotel'

--12
select r.hotel_no,r.price,r.room_no,r.type from room r
left join 
booking b
on r.room_no=b.room_no
left join
hotel h
on r.hotel_no=h.hotel_no
where h.name='Grand Plaza Hotel'

--13
select r.hotel_no,sum(r.price) income,r.room_no,r.type from room r
left join 
booking b
on r.room_no=b.room_no
left join
hotel h
on b.hotel_no=h.hotel_no
where h.name='Grand Plaza Hotel' or date_to = GETDATE()
group by  r.hotel_no,r.price,r.room_no,r.type

/*
select sum(price) as TODAYS_BOOKING from room
join booking
on booking.room_no=room.room_no
where room.hotel_no = 
(select hotel.hotel_no from hotel where hotel.name = 'Grand plaza Hotel')
and booking.date_to= getdate()
*/
--14
select * from room r
left join 
booking b
on r.room_no=b.room_no
right join
hotel h
on b.hotel_no=h.hotel_no
where h.name='Grosvenor Hotel' and r.room_no <> b.room_no

--14chat

---15
select *
from hotel h left join room r
on r.hotel_no=h.hotel_no left join booking b
on r.room_no=b.room_no
--16
select count(r.room_no) totalrooms from
room r
left join
hotel
on r.hotel_no=hotel.hotel_no
group by  r.room_no
--17

select count(r.room_no) totalrooms from
room r
left join
hotel
on r.hotel_no=hotel.hotel_no
where address ='London'
group by  r.room_no

--18

--1way
    SELECT COUNT(r.room_no) AS total_rooms,hotel.name
    FROM room r
    LEFT JOIN booking ON r.hotel_no = booking.hotel_no
	left join hotel on booking.hotel_no=hotel.hotel_no
	where  month(date_to) =8
    GROUP BY hotel.name,r.room_no

	--chat
SELECT hotel_no, AVG(bookings_per_hotel) AS avg_bookings
FROM (
    SELECT h.hotel_no, COUNT(b.room_no) AS bookings_per_hotel
    FROM hotel h
    LEFT JOIN booking b ON h.hotel_no = b.hotel_no AND MONTH(b.date_from) = 8
    GROUP BY h.hotel_no
) AS subquery
GROUP BY hotel_no;



--second way
select hotel.name,count(room.room_no) as TOTAL_ROOM
from hotel 
join room 
on room.hotel_no=hotel.hotel_no
join booking
on booking.hotel_no=hotel.hotel_no
where month(date_to) =8
group by hotel.name 

--19
select r.type,count(r.type),r.room_no,h.name,h.address
from 
booking b
left join
room r 
on r.room_no=b.room_no
right join
hotel h
on r.hotel_no=h.hotel_no
where h.address='New York'
group by r.type,r.room_no,h.name,h.address

SELECT type, COUNT(*) AS TypeCount
FROM Room
WHERE hotel_no IN (SELECT hotel_no FROM Hotel WHERE address = 'New York')
GROUP BY type
ORDER BY TypeCount 





































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



--20
SELECT h.hotel_no, SUM(r.price) AS lost_income
FROM hotel h
JOIN room r ON h.hotel_no = r.hotel_no
LEFT JOIN booking b ON r.room_no = b.room_no AND b.hotel_no = h.hotel_no
WHERE b.room_no IS NULL
GROUP BY h.hotel_no;



select sum(r.price) 'Total Lost Income' from room r
where r.hotel_no = (select hotel_no from hotel where hotel_no='H111') 
and  r.room_no not in(select room_no from booking)