create database supplier;
show databases;
use supplier;

create table suppliers (sid int primary key, sname varchar(20), city varchar(20));
create table parts (pid int primary key, pname varchar(20), color varchar(10));
create table catalog (sid int, pid int, foreign key(sid) references suppliers(sid), foreign key(pid) references parts(pid), cost float(6), primary key(sid,pid));

insert into suppliers values (10001, 'Acme Widget', 'Bangalore'),
(10002, 'Johns', 'Kolkata'), (10003, 'Vimal', 'Mumbai'), (10004, 'Reliance', 'Delhi'), (10005, 'Mahindra', 'Mumbai');

insert into PARTS values(20001, 'Book', 'Red'),
(20002, 'Pen', 'Red'),
(20003, 'Pencil', 'Green'),
(20004, 'Mobile', 'Green'),
(20005, 'Charger', 'Black');

insert into CATALOG values(10001, 20001,10), (10001, 20002,10), (10001, 20003,30), (10001, 20004,10), (10001, 20005,10),
(10002, 20001,10), (10002, 20002,20), (10003, 20003,30), (10004, 20003,40);

select distinct p.pname
from parts p, catalog c
where p.pid = c.pid;

select s.sname
from suppliers s
where (select count(p.pid)
	   from parts p) = (select count(c.pid)
                        from catalog c
                        where c.sid = s.sid);
                        
select s.sname
from suppliers s 
where (select count(p.pid)
       from parts p 
       where color = 'Red') = (select count(c.pid)
                               from catalog c, parts p 
                               where c.sid = s.sid and
                                     c.pid = p.pid and
                                     p.color = 'Red');
                                     
select p.pname
from parts p, catalog c, suppliers s 
where p.pid = c.pid and
      c.sid = s.sid and
      s.sname = 'Acme Widget' and
      NOT EXISTS (select *
                  from catalog c1, suppliers s1
                  where p.pid = c1.pid and
                        c1.sid = s1.sid and
                        s1.sname <> 'Acme Widget');
                        
select distinct c.sid
from catalog c
where c.cost > (select avg(c1.cost)
                from catalog c1
                where c1.pid = c.pid);
                
select p.pid, s.sname
from parts p, suppliers s, catalog c 
where c.pid = p.pid and
      c.sid = s.sid and
      c.cost = (select max(c1.cost)
                from catalog c1
                where c1.pid = p.pid);