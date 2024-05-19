//Assignment No-5
/*Assignment Title- Design at least 10 SQL queries for suitable database
application using SQL DML statements: all types of Join, Sub-Query and View.*/

CREATE TABLE SALESMAN(SALESMAN_ID NUMBER(5) PRIMARY
KEY,NAME VARCHAR(30), CITY VARCHAR(15),
COMMISION DECIMAL(5,2));

DROP TABLE SALESMAN;

CREATE TABLE CUSTOMER(CUSTOMER_ID NUMBER(5) PRIMARY
KEY,CUST_NAME VARCHAR(30),
CITY VARCHAR(15),GRADE NUMBER(3),SALESMAN_ID NUMBER(5),
FOREIGN KEY(SALESMAN_ID) REFERENCES SALESMAN(SALESMAN_ID) on
delete cascade);

DROP TABLE CUSTOMER;
CREATE TABLE ORDERS (
 ORDER_NO NUMBER(5,0) ,
 PURCH_AMT DECIMAL(8,2),
 ORD_DATE DATE,
 CUSTOMER_ID NUMBER(5),
 SALESMAN_ID NUMBER(5),
 PRIMARY KEY (ORDER_NO, CUSTOMER_ID, SALESMAN_ID),
 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID) on
delete cascade,
 FOREIGN KEY (SALESMAN_ID) REFERENCES SALESMAN(SALESMAN_ID)
);

DROP TABLE ORDERS;

INSERT INTO SALESMAN VALUES(5001,'James Hoog','New York',0.15);
INSERT INTO SALESMAN VALUES(5002,'Nail Knite','Paris',0.13);
INSERT INTO SALESMAN VALUES(5005,'Pit Alex','London',0.11);
INSERT INTO SALESMAN VALUES(5006,'Mc Lyon','Paris',0.14);
INSERT INTO SALESMAN VALUES(5007,'Paul Adam','Rome',0.13);
INSERT INTO SALESMAN VALUES(5003,'Lauson Hen','San Jose',0.12);
select *from salesman;

INSERT INTO CUSTOMER VALUES(3002,'Nick Rimando','New York',100,5001);
INSERT INTO CUSTOMER VALUES(3007,' Brad Davis' ,'New York ',200 ,5001);
INSERT INTO CUSTOMER VALUES(3005, 'Graham Zusi ',' California ',200 ,5002);
INSERT INTO CUSTOMER VALUES(3008, 'Julian Green', 'London ',300 , 5002);
INSERT INTO CUSTOMER VALUES(3004,'Fabian Johnson ',' Paris' , 300 , 5006);
INSERT INTO CUSTOMER VALUES(3009,'Geoff Cameron' , 'Berlin' , 100 ,5003);
INSERT INTO CUSTOMER VALUES(3003,'Jozy Altidor','Moscow',200,5007);
INSERT INTO CUSTOMER VALUES(3001,'Brad Guzan', 'London','' ,5003);
select *from customer;

INSERT INTO ORDERS VALUES (70001, 150.5, Date'2012-10-05', 3005, 5002);
INSERT INTO ORDERS VALUES (70009, 270.65, Date'2012-09-10', 3001, 5003);
INSERT INTO ORDERS VALUES (70002, 65.26, Date'2012-10-05', 3002, 5001);
INSERT INTO ORDERS VALUES (70004, 110.5, Date'2012-08-17', 3009, 5003);
INSERT INTO ORDERS VALUES (70007, 948.5, Date'2012-09-10', 3005, 5002);
INSERT INTO ORDERS VALUES (70005, 2400.6, Date'2012-07-27', 3007, 5001);
INSERT INTO ORDERS VALUES (70008, 5760, Date'2012-09-10', 3002, 5001);
INSERT INTO ORDERS VALUES (70010, 1983.43, Date'2012-10-10', 3004,5006);
INSERT INTO ORDERS VALUES (70003, 2480.4, Date'2012-10-10', 3009, 5003);
INSERT INTO ORDERS VALUES (70012, 250.45, Date'2012-06-27', 3008, 5002);
INSERT INTO ORDERS VALUES (70011, 75.29, Date'2012-08-17', 3003, 5007);
INSERT INTO ORDERS VALUES (70013, 3045.6, DATE'2012-04-25', 3002, 5001);
select *from ORDERS;

SELECT S.NAME AS salesman_name, s.city AS salesman_city, c.cust_name AS
customer_name, c.city AS customer_city
FROM salesman s
JOIN customer c ON s.city = c.city;

SELECT s.salesman_name AS salesman_name, c.customer_name AS
customer_name, c.city AS customer_city, o.commision AS
salesman_commission
FROM salesman s
JOIN orders o ON s.salesman_id = o.salesman_id
JOIN customer c ON o.customer_id = c.customer_id;

SELECT *
FROM salesman
NATURAL JOIN orders;
SELECT s.salesman_id, s.name
FROM salesman s
LEFT JOIN orders o ON s.salesman_id = o.salesman_id
WHERE o.salesman_id IS NULL;

//-----------------------------Other Table ---------------

create table employee(employee_name varchar(50) primary key,
 street varchar(50), city varchar(20));

create table company(company_name varchar(50) primary key,city
varchar(20));

create table works(employee_name varchar(50),
company_name varchar(50),
salary integer,
primary key(employee_name, company_name),
foreign key(employee_name) references employee(employee_name),
foreign key(company_name) references company(company_name)
);

create table manages(employee_name varchar(50), manager_name
varchar(50),
primary key(employee_name),
foreign key(employee_name) references employee(employee_name));

insert into employee values('kajal patil','bhagvati nagar','chalisgaon');
insert into employee values('aishwarya','ozar','chalisgaon');
insert into employee values('damini jadhav','pawarwadi','mumbai');
insert into employee values('aastha sali','jalgoan road','erandol');
insert into company values('Tata','mumbai');
insert into company values('Reliances','mumbai');
insert into company values('first bank corporation','pune');
insert into works values('kajal patil','Tata',12000);
insert into works values('aishwarya','Reliances',15000);
insert into works values('damini jadhav','first bank corporation',13000);
insert into works values('aastha sali','Tata',11000);
insert into manages values('kajal patil','aditya patil');
insert into manages values('aishwarya','mohit patil');
insert into manages values('damini jadhav','varun bhadane');

SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Tata' AND w.salary > 10000;
SELECT employee_name
FROM employee
WHERE employee_name NOT IN (SELECT employee_name FROM works
WHERE company_name = 'Tata');

SELECT employee_name
FROM works
WHERE salary > ALL (SELECT salary FROM works WHERE company_name =
'Reliance');

SELECT company_name
FROM works
GROUP BY company_name
HAVING SUM(salary) = (SELECT MIN(total_salary) FROM (SELECT SUM(salary)
AS total_salary
FROM works GROUP BY company_name) AS min_payroll);
CREATE VIEW First_Bank_Employees AS
SELECT e.employee_name, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_nameWHERE w.company_name =
'First Bank Corporation';
