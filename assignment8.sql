//Assignment- 8
/*Assignment Title:- a PL/SQL block to increase salary of those employeeshaving minimum salary by 5000.Display count of employees who got hike insalary. (use implicit cursor)
Commands*/

 CREATE TABLE Employee8 (
 ID NUMBER PRIMARY KEY,
 Name VARCHAR2(100),
 Age NUMBER,
 Address VARCHAR2(255),
 Salary NUMBER
);

insert into Employee8 values(1,'kajal',22,'Chalisgaon',50000);
insert into Employee8 values(2,'Athrav',40,'Nashik',55000);
insert into Employee8 values(3,'Chetan',33,'Mumbai',45000);
insert into Employee8 values(4,'Mohit',21,'Pune',40000);
insert into Employee8 values(5,'Harsh',45,'Dubai',35000);

DECLARE
 total_employees NUMBER := 0;
BEGIN

 UPDATE Employee8
 SET Salary = Salary + 5000
 WHERE Salary = (SELECT MIN(Salary) FROM Employee8);


 IF SQL%NOTFOUND THEN
 DBMS_OUTPUT.PUT_LINE('No employees selected');
 ELSIF SQL%FOUND THEN
 total_employees := SQL%ROWCOUNT;
 DBMS_OUTPUT.PUT_LINE(total_employees || ' employees selected');
 END IF;
END;
/
select *from Employee8;