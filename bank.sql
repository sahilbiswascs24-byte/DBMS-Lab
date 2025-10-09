show databases;
create database IF NOT
exists bank_database;
use bank_database;

create table Branch (branchname varchar(30), 
branchcity varchar(30), assests real, primary key(branchname));
desc Branch;

create table BankAccount(accno integer, branchname varchar(30), balance real,
primary key(accno), foreign key(branchname) references Branch(branchname));
desc BankAccount;

create table BankCustomer(customername varchar(30), customerstreet varchar(30),
customercity varchar(30), primary key(customername));
desc BankCustomer;

create table Depositer(customername varchar(30), accno integer,
primary key(customername, accno), foreign key(customername) references 
BankCustomer(customername), foreign key(accno) references BankAccount(accno));
desc Depositer;

create table Loan(loannumber int, branchname varchar(30), amount real,
primary key (loannumber), foreign key(branchname) references Branch(branchname));
desc Loan;

insert into Branch values('SBI_Chamrajpet', 'Bangalore', 50000),
('SBI_ResidencyRoad', 'Bangalore', 10000),('SBI_ShivajiRoad', 'Bombay', 20000),
('SBI_ParliamentRoad', 'Delhi', 10000),('SBI_Jantarmantar', 'Delhi', 20000);
select * from Branch;

insert into Loan values (2, 'SBI_ResidencyRoad', 2000),
(1, 'SBI_Chamrajpet', 1000), (3,'SBI_ShivajiRoad', 3000),
(4, 'SBI_ParliamentRoad', 4000), (5, 'SBI_Jantarmantar', 5000);
select * from Loan;

insert into BankAccount values
(1, 'SBI_Chamrajpet', 2000), (2, 'SBI_ResidencyRoad', 5000),
(3, 'SBI_ShivajiRoad', 6000), (4, 'SBI_ParliamentRoad', 9000),
(5, 'SBI_Jantarmantar', 8000), (6, 'SBI_ShivajiRoad', 4000),
(8, 'SBI_ResidencyRoad', 4000), (9, 'SBI_ParliamentRoad', 3000),
(10, 'SBI_ResidencyRoad', 5000), (11, 'SBI_Jantarmantar', 2000);
commit;
select * from BankAccount;