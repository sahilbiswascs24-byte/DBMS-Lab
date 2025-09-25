show databases;
create database IF NOT exists Insurance;
show databases;
use insurance;

create table persons (driver_id varchar(10),
name varchar(20),
address varchar(30),
primary key(driver_id));
desc persons;

create table car(reg_num varchar(10),model varchar(10),year int, primary key(reg_num));
desc car;

create table accident(report_num int, accident_date date, location varchar(20), primary key(report_num));
desc accident;

create table owns(driver_id varchar(10),reg_num varchar(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references persons(driver_id),
foreign key(reg_num) references car(reg_num));
desc owns;

create table participated(driver_id varchar(10),reg_num varchar(10),
report_num int, damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references persons(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));
desc participated;

insert into persons(driver_id,name,address)
values("A01","Richard","Srinivas nagar");
insert into persons(driver_id,name,address)
values("A02","Pradeep","Rajajinagar");
insert into persons(driver_id,name,address)
values("A03","Smith","Ashoknagar");
insert into persons(driver_id,name,address)
values("A04","Venu","N.R.Colony");
insert into persons(driver_id,name,address)
values("A05","John","Hanumanth Nagar");
commit;
select*from persons;

insert into car(reg_num,model,year)
values("KA052250","Indica","1990");
insert into car(reg_num,model,year)
values("KA031181","Lancer","1957");
insert into car(reg_num,model,year)
values("KA095477","Toyota","1998");
insert into car(reg_num,model,year)
values("KA053408","Honda","2008");
insert into car(reg_num,model,year)
values("KA041702","Audi","2005");
commit;
select*from car;

insert into accident(report_num,accident_date,location)
values(11,"01-01-03","Mysore Road");
insert into accident(report_num,accident_date,location)
values(12,"02-02-04","Southend Circle");
insert into accident(report_num,accident_date,location)
values(13,"21-01-03","Bulltemple Road");
insert into accident(report_num,accident_date,location)
values(14,"17-02-08","Mysore Road");
insert into accident(report_num,accident_date,location)
values(15,"04-03-05","Kanakpura Road");
commit;
select*from accident;

insert into owns(driver_id,reg_num)
values("A01","KA052250");
insert into owns(driver_id,reg_num)
values("A02","KA053408");
insert into owns(driver_id,reg_num)
values("A03","KA031181");
insert into owns(driver_id,reg_num)
values("A04","KA095477");
insert into owns(driver_id,reg_num)
values("A05","KA041702");
commit;
select*from owns;

insert into participated(driver_id,red_num,report_num,damage_amount)
values("A01","KA052250",11,10000);
insert into participated(driver_id,red_num,report_num,damage_amount)
values("A02","KA053408",12,50000);
insert into participated(driver_id,red_num,report_num,damage_amount)
values("A03","KA095477",13,25000);
insert into participated(driver_id,red_num,report_num,damage_amount)
values("A04","KA031181",14,3000);
insert into participated(driver_id,red_num,report_num,damage_amount)
values("A05","KA041702",15,5000);
commit;
select*from participated;