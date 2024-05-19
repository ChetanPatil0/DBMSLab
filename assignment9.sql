//Assignment- 9


/*Assignment Title:- Write an explicit cursor to
i) display employee name, address ,salary
along with age category (young or old)
ii) display count of young and old employees*/

CREATE TABLE Employee9 (
 ID NUMBER PRIMARY KEY,
 Name VARCHAR2(100),
 Age NUMBER,
 Address VARCHAR2(255),
 Salary NUMBER
);

drop table employee;
insert into Employee9 values(1,'kajal',22,'Chalisgaon',50000);
insert into Employee9 values(2,'Athrav',40,'Nashik',55000);
insert into Employee9 values(3,'Chetan',33,'Mumbai',45000);
insert into Employee9 values(4,'Mohit',21,'Pune',60000);
insert into Employee9 values(5,'Harsh',45,'Dubai',35000);

DECLARE
 emp_name employee9.name%TYPE;
 emp_address employee9.address%TYPE;
 emp_salary employee9.salary%TYPE;
 emp_age employee9.age%TYPE;


 young_count NUMBER := 0;
 old_count NUMBER := 0;

 CURSOR emp_employee9 IS
 SELECT name, address, salary, age
 FROM employee9;
BEGIN

 OPEN emp_employee9;

 LOOP
 FETCH emp_employee9 INTO emp_name, emp_address, emp_salary, emp_age;


 IF emp_age < 30 THEN
 DBMS_OUTPUT.PUT_LINE(emp_name || ', ' || emp_address || ', ' || emp_salary || ',
Young');
 DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------');
 young_count := young_count + 1;
 ELSE
 DBMS_OUTPUT.PUT_LINE(emp_name || ', ' || emp_address || ', ' || emp_salary || ',
Old');
 DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------');
 old_count := old_count + 1;
 END IF;
 END LOOP;

 CLOSE emp_employee9;

 DBMS_OUTPUT.PUT_LINE('Young employees: ' || young_count);
 DBMS_OUTPUT.PUT_LINE('Old employees: ' || old_count);
END;
/