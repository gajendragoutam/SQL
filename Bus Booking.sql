
CREATE DATABASE IF NOT EXISTS Bus_Booking;
USE Bus_Booking ;

CREATE TABLE user(
    userid VARCHAR(20) PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(30) not null,
    bookid VARCHAR(20) NOT NULL
);

create table bus(
	busid VARCHAR(20) PRIMARY KEY,
	from_ VARCHAR(20) not null,
	to_ VARCHAR(20) not null,
	cost INT not null,
	rating DECIMAL(13,2) not null,
	depature time not null,
	arrival time not null
);

create table booking(
	booking_id VARCHAR(20) primary key,
	userid VARCHAR(20) not null,
	busid VARCHAR(20) not null,
	passengers INT not null,
	date_ DATE
);



insert into bus values('12345', 'vizag', 'hyderabad',  1299, 4.3, '08:00:00', '12:00:00');
insert into bus values('12346', 'vizag', 'delhi',  1999, 3.3, '08:00:00', '16:00:00');
insert into bus values('12348', 'vizag', 'chennai',  1289, 4.8, '08:00:00', '12:00:00');
insert into bus values('22338', 'vizag', 'kolkata',  2100, 4.2, '22:00:00', '12:00:00');

insert into bus values('87734', 'vizag', 'chennai',  1800, 3.2, '13:00:00', '23:30:00');
insert into bus values('87634', 'vizag', 'delhi',  3800, 4.6, '02:00:00', '22:30:00');

insert into bus values('11756', 'vizag', 'chennai',  1500, 2.4, '07:00:00', '22:30:00');
insert into bus values('11754', 'vizag', 'chennai',  1800, 3.2, '08:00:00', '18:30:00');
insert into bus values('11632', 'vizag', 'chennai',  2500, 4.6, '10:00:00', '20:00:00');
insert into bus values('11098', 'vizag', 'chennai',  3200, 4.8, '05:00:00', '14:00:00');
insert into bus values('11704', 'vizag', 'chennai',  1500, 2.4, '07:00:00', '22:30:00');

insert into bus values('12056', 'vizag', 'hyderabad',  1500, 2.4, '07:00:00', '12:30:00');
insert into bus values('12300', 'vizag', 'hyderabad',  2500, 3.6, '09:00:00', '14:30:00');
insert into bus values('12302', 'vizag', 'hyderabad',  3500, 3.8, '10:00:00', '15:30:00');
insert into bus values('12307', 'vizag', 'hyderabad',  1800, 4.2, '12:00:00', '17:30:00');
insert into bus values('12321', 'vizag', 'hyderabad',  4000, 4.9, '13:00:00', '18:30:00');

insert into bus values('14654', 'vizag', 'delhi',  2000, 1.9, '02:00:00', '21:30:00');
insert into bus values('14371', 'vizag', 'delhi',  4000, 2.8, '04:00:00', '22:30:00');
insert into bus values('14306', 'vizag', 'delhi',  6000, 3.6, '07:00:00', '23:00:00');
insert into bus values('14455', 'vizag', 'delhi',  6500, 4.2, '11:00:00', '23:45:00');
insert into bus values('14309', 'vizag', 'delhi',  8000, 4.8, '12:00:00', '18:30:00');

insert into bus values('15609', 'vizag', 'kolkata',  2000, 3.8, '08:00:00', '18:30:00');
insert into bus values('15009', 'vizag', 'kolkata',  5000, 4.6, '12:00:00', '22:00:00');

insert into bus values('21399', 'hyderabad', 'vizag',  2500, 4.2, '09:00:00', '16:00:00');
insert into bus values('21209', 'hyderabad', 'vizag',  7200, 4.9, '13:00:00', '19:30:00');

insert into bus values('22679', 'hyderabad', 'kolkata',  4500, 2.8, '01:00:00', '18:30:00');
insert into bus values('22099', 'hyderabad', 'kolkata',  6700, 3.6, '12:00:00', '23:30:00');

insert into bus values('23309', 'hyderabad', 'delhi',  4600, 3.4, '08:00:00', '22:30:00');
insert into bus values('23409', 'hyderabad', 'delhi',  9000, 4.5, '13:00:00', '23:45:00');

insert into bus values('24309', 'hyderabad', 'chennai',  3000, 4.3, '06:00:00', '18:45:00');
insert into bus values('28809', 'hyderabad', 'chennai',  7000, 4.5, '13:00:00', '03:45:00');



SELECT * FROM bus where busid = '15009';
select * from user;
select * from booking;


ALTER TABLE bus
ADD capacity int NOT NULL DEFAULT(60);

ALTER TABLE bus
modify busid int ;

alter table booking
change userid user_id varchar (20) not null;

alter table user
rename to users;

alter table bus
drop column capacity;


SELECT cost , busid
FROM  bus
WHERE  cost >= 2000
GROUP BY  busid ;

SELECT busid, 
       COUNT(busid) AS total_buses, 
       MAX(rating) AS max_rating, 
       MIN(rating) AS min_rating
FROM bus 
WHERE cost >= 2000 
GROUP BY busid 
HAVING AVG(cost) >= 2500 
ORDER BY max_rating DESC, total_buses ASC;

