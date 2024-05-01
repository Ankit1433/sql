
select * from dbo.flightmast
select * from dbo.airportmast
select * from dbo.statemast
select * from dbo.citymast
select  flight_id, airport_id, airport_name, depart_time, arrival_time,origin,destination,city_name
from 
flightmast fm
left join
airportmast am
on fm.destination=am.city_id
left join
citymast cm
on am.city_id=cm.city_id


----5
SELECT * FROM flightmast WHERE (CHARINDEX('Wednesday', day_of_operation) > 0 and
CHARINDEX('Saturday', day_of_operation) > 0)  AND CHARINDEX('Monday', day_of_operation) = 0

---6
select  flight_id, airport_id, airport_name, depart_time, arrival_time,origin,destination,city_name
from 
flightmast fm
left join
airportmast am
on fm.destination=am.city_id
left join
citymast cm
on am.city_id=cm.city_id
where fm.origin = 'Abu Dhabi' and city_name='Ahmedabad' and fm.depart_time between '22:00:00'and '23:00:00'
--(select cm.city_id where cm.city_name = 'Ahemdabad')

---7

select  flight_id, airport_id, airport_name, depart_time, arrival_time,origin,destination,city_name,fm.Routing
from 
flightmast fm
left join
airportmast am
on fm.destination=am.city_id
left join
citymast cm
on am.city_id=cm.city_id
where fm.origin = 'Abu Dhabi' and city_name='srinagar' and Routing ='Via bom'

--8
create procedure 