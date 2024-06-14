-- Table:-

Admin
-Admin_Name
-Admin_ID(PK)
-Admin_Mobile
-Admin_Password

create table Admin(Admin_Name varchar(30),
		   Admin_ID int primary key,
                   Admin_Password varchar(20) check(length(Admin_Password)>7),
                   Admin_Mobile int check(length(Admin_Mobile)=10));

(Admin_Name, Admin_ID, Admin_Mobile, Admin_Password)

('Rushil','1','1894849649','abisdneq')
('Mohit','2','9876936589','vihifjif')
('Nihar','3','1398856421','aduhobji')



////////////////////////////////////////////
Company
-Company_Name(PK)
-Company_Address
-Company_Contact_Person
-Company_Mobile


create table Company(Company_Name varchar(50) primary key,
		     Company_Address varchar(50),
		     Company_ContactPerson varchar(30),
		     Company_Mobile int check(length(Company_Mobile)=10));

(Company_Name, Comapany_Address, Company_Contact_Parson, Company_Mobile)

('Company1','Spring street','4986153288','')
('Company2','Senator street','6238966499','')
('Company3','Sand Hill street','6132644829','')
('Company4','4','Walnut street','9366339890')
('Company5','5','Main street','3284995852')




\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Medicine
-Medicine_SlotID(PK)
-Medicine_Name
-Medicine_Detail
-Medicine_Price
-Company_Name(FK)
-Medicine_ExpiryDate


create table Medicine(Medicine_SlotID int primary key,
                      Medicine_Name varchar(30),
                      Medicine_Price float,
                      Company_Name varchar(50),
		      Foreign Key (Company_Name) references Company(Company_Name),
                      Medicine_ExpiryDate Date);

(Medicine_SlotID, Medicinie_Name_Medicine)


///////////////////////////////////////////////
Employee
-Emolyee_ID(PK)
-Employee_Name
-Employee_Mobile
-Employee_Salary

create table Employee(Emloyee_ID int primary key,
                      Employee_Name varchar(30),
                      Employee_Mobile int check(length(Employee_Mobile)=10),
                      Employee_Salary int);



\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Customer
-Customer_ID(PK)
-Customer_Name
-Customer_Mobile
-Bill_BillNo(FK)





('1','Joseph','4632984629','B-12')
('2','Penny','9761534978','B-13')
('3','Sheldon','6318496255','B-14')
('4','Lenord','9788881538','B-15')
('5','Yash','5297894548','B-16')
('6','Raj','7984635598','B-17')
('7','Rajesh','6446589213','B-18')
('8','Kiren','8879825415','B-19')
('9','Megan','3658945288','B-20')
('10','Diana','9649955589','B-21')




////////////////////////////////////////////////
Purchase(Bill)
-Bill_BillNo(PK)
-Medicine_Price(FK)
-Medicine_Quantity
-Medicine_Total(Medicine_Price*Medicine_Quantity)
-Bill_Total
-Medicine_Name
-Company_Name


create table Purchase(Bill_BillNo int primary key,
                      Medicine_Price float,
                      Medicine_Quantity int,
                      Medicine_Name varchar(30),
                      Company_Name varchar(50),
                      Foreign Key (Company_Name) references Company(Company_Name));



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

create table pharmacy
(
phid integer primary key,
name varchar2(20),
city varchar2(20),
fax varchar2(20),
phone number(10));

create table doctor
(
did number(2) primary key,
dname varchar2(20),
speciality varchar2(20),
age number(2) not null,
mobile integer,
gender varchar2(6));

create table customer
(
pid number(3) primary key,
name varchar2(20),
sex varchar2(6),
city varchar2(20),
phone integer,
age number(2),
did references doctor(did) on delete set null);

create table manufacturer
(
cid number(4) primary key,
name varchar2(20),
email varchar2(20),
mobile integer,
city varchar2(20),
pharid references pharmacy(phid) on delete set null);

create table mediquipment
(
code number(5) primary key,
Trade_name varchar2(20),
Product_Type varchar2(20),
Mfg_date date,
Exp_date date,
price number(10,2),
cid references manufacturer(cid) on delete set null);

create table supplier
(
name varchar2(20),
city varchar2(20),
mobile integer primary key,
email varchar2(20),
cid references manufacturer(cid) on delete set null,
pharid references pharmacy(phid) on delete set null);

create table employee
(
name varchar2(20),
city varchar2(20),
doj date,
mobile integer primary key,
salary number(10),
age number(2),
sex varchar2(1),
pharid references pharmacy(phid) on delete set null);

create table hospital
(
hid number(2) primary key,
name varchar2(20),
email varchar2(40),
phone integer,
city varchar2(20),
pharid references pharmacy(phid) on delete set null);

create table bill
(
bid number(3) primary key,
DOB date,
age number(3),
pname varchar2(20),
mobile integer,
city varchar2(20),
product varchar2(20),
amount number(10,2),
pharid references pharmacy(phid) on delete set null);

create table works
(
pharid references pharmacy(phid) on delete cascade,
start_date date,
end_date date,
primary key(pharid));

create table contract
(
pharid references pharmacy(phid) on delete cascade,
cid references manufacturer(cid) on delete cascade,
start_date date,
end_date date,
primary key(pharid,cid));

create table prescribe
(
DOP date,
medicine varchar2(20),
did references doctor(did) on delete cascade,
pid references customer(pid) on delete cascade,
primary key(pid,did));
