select * from user1
select username,password from user1 where username='MinalKhan' and password='stallyishere08'
drop table user1
create table user1(username varchar2(50),password varchar2(50),usertype varchar2(50))
insert into user1 values('biswaa001','biswaA001','Cashier','Biswa Aich','What is your birth place','durgapur','bisaw.aich@abcbank.com')
insert into user1 values('minalh001','iamcrazyF01','Executive')
alter table user1 add(name varchar2(50))
alter table user1 add(email varchar2(100))
alter table user1 add(securityquestion varchar2(200))
alter table user1 add(answer varchar2(50))
insert into user1 values('iamminalkhan','minalh001','Executive','Minal Khan','What is your birth place','durgapur','minal.khan@abcbank.com')
update  user1 set email='minal.khane@abcbank.com' where username='minalh001' and usertype='Executive'
update  user1 set email='minal.khanc@abcbank.com' where username='minalh001' and usertype='Cashier'
alter table user1 drop column email
select securityquestion from user1 where email='minal.khan@abcbank.com'
update Customer_TeamC set firstname='Biswa',lastname='Aich',age=23,addressline1='Rabindra Pally',addressline2='Shympur Road',city='Durgapur',state='WB',phonenumber='9732317235',gender='Male' where customerID='11300404'
update Customer_teamC set phonenumber='9614230432',gender='Male' where customerid='11280821'
update user1 set password ='iamcrazyF002' where username='minalh001' and usertype='Executive'
update user1 set email='minal.khan@abcbank.com' where username='minalh001'
update user1 set password='iamcrazyF02' where username='minalh001'
create table userstore_TeamC(username varchar2(50),password varchar2(50),usertype varchar2(50),login timestamp)
insert into userstore_Teamc values('chinku','roy','cashier',current_timestamp)
select * from userstore_TeamC
select username,password from user1 where username='minalh001' and password='iamcrazyF01'
create table demo1(str timestamp)
insert into demo1 values(current_timestamp)
select * from demo1
drop table demo1
create SEQUENCE seq_customer_1513329 start with 1000 increment by 2
select seq_customer_1513329.nextval from dual
create table Customer_TeamC(customerID varchar2(50),
customerSSn varchar2(50),
firstname varchar2(50) not null,
middlename varchar2(50) not null,
lastname varchar2(50) not null,
age number not null,
addressline1 varchar2(50) not null,
addressline2 varchar2(50) not null,
city varchar2(50) not null,
state varchar2(50) not null,
 primary key(customerID,customerSSn))
drop table Customer_TeamC
select * from Customer_TeamC
delete Customer_TeamC where city='Kolkata'
alter table customer_teamC drop column middlename
select * from Account_TeamC
insert into Customer_TeamC values('asd','asd1','asd','as','as',23,'asd','asd','ads','das')
select * from Customer_TeamC WHERE customerSSn='asd1'
delete from Customer_TeamC where customerID='asd'
create table Account_TeamC(accountno varchar2(9) primary key,
accounttype varchar2(10) not null,
balance number(10) not null,
customerID varchar2(50),
customerSSn varchar2(50),
foreign key (customerID,customerSSn) references Customer_TeamC(customerID,customerSSn))
<<<<<<< .mine
alter table Account_TeamC modify (accountno varchar2(12))
select * from Account_TeamC where accountno='100018_52' OR customerID='100018_52' and accounttype='savings'

select * from customer_teamC where customerid='12345678'

select A.*, C.firstname,C.middlename,C.lastname from Account_TeamC A,Customer_TeamC C where A.customerID = C.customerID and A.accountno='100018_52' OR A.customerID='100018_52' and A.accounttype='savings'

select * from Customer_TeamC where customerid='1088_412'
select * from transaction_TeamC where accountno='100084048' and rownum<11 order by transactionid asc
truncate table Customer_TeamC
delete from  Customer_teamC where age=-1

select A.*, C.firstname,C.middlename,C.lastname from Account_TeamC A,Customer_TeamC C where A.customerID = C.customerID and A.AccountNo='100022_47' and A.accounttype='Savings'

update user1 set password='iamcrazyF03' where email='minal.khan@abcbank.com'

select * from user1 where email='minal.khan@abcbank.com' and password='iamcrazyF01'
select * from AccountStatus_teamC where accountid='100082068'
create table transaction_TeamC(transactionid number(6) primary key, transactiontype varchar2(20) not null, amount number(10) not null, ledgerbalance number(10) not null);
create SEQUENCE seq_transaction start with 10000 increment by 3
select * from transaction_TeamC
select * from transaction_TeamC where accountno='100014_53' order by transactionid
>>>>>>> .r39038
alter transaction_TeamC modify(accountno varchar2(11))
select * from Customer_TeamC where  customerSSn='R5555'
select * from ACCOUNT_TEAMC where accountno='100014_53'
select * from transaction_TeamC

select sysdate from dual


select * from transaction_TeamC where date_timestamp between #2018-05-19# and #2018-05-20#  



SELECT * FROM transaction_TeamC WHERE DATE_TIMESTAMP ('2018-05-19','YYYY-MM-DD') 
select * from transaction_TeamC where accountno='100084048' and rownum<5 order by transactionid desc

select A.*, C.firstname,C.lastname from Account_TeamC A,Customer_TeamC C where A.customerID = C.customerID and A.AccountNo='100084048'
alter table Customer_TeamC add (phonenumber number,gender varchar2(10))
alter table Customer_TeamC modify(phonenumber varchar2(12))
select * from CustomerStatus_TeamC
select * from AccountStatus_TeamC 
select * from Customer_TeamC where  customerSSn='R11111'
select A.*, C.firstname,C.lastname from Account_TeamC A,Customer_TeamC C where A.customerID = C.customerID and A.AccountNo='100074085'
delete from accountStatus_teamC where customerid='1080_112' and status='active'
select status from AccountStatus_TeamC where customerid='1082_773'
select A.*, C.firstname,C.middlename,C.lastname from Account_TeamC A,Customer_TeamC C where A.customerID = C.customerID and A.AccountNo='100030_39'
update AccountStatus_TeamC set status='Inactive',message='Deleted' where accountid='100046_85'
delete from transaction_TeamC where accountno='100014_53'
select A.*, C.firstname,C.middlename,C.lastname from Account_TeamC A,Customer_TeamC C where A.customerID = C.customerID and A.customerID='1058_631' and A.accounttype='Savings'