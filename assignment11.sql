//Assignment – 11

/*Assignment Title – Create a transparent audit system for a table Employeesusingtrigger. The system must keep track of the records that arebeing deletedor
updated. When a record is deleted or modified in a employee table, employeeidand and the date of operation are stored in the audit table, then the delete or update operation is allowed to go through*/

CREATE TABLE Employee10 (
 ID NUMBER PRIMARY KEY,
 Name VARCHAR2(100),
 Age NUMBER,
 Address VARCHAR2(255),
 Salary NUMBER
);
drop table employee;

insert into Employee10 values(1,'kajal',22,'Chalisgaon',50000);
insert into Employee10 values(2,'Athrav',40,'Nashik',55000);
insert into Employee10 values(3,'Chetan',33,'Mumbai',45000);
insert into Employee10 values(4,'Mohit',21,'Pune',60000);
insert into Employee10 values(5,'Harsh',45,'Dubai',35000);

CREATE TABLE Employee_Audit (
operation_type VARCHAR2(10),
employee_id NUMBER,
operation_date DATE
);

CREATE OR REPLACE TRIGGER Employee_Audit_Trigger1
BEFORE INSERT OR UPDATE OR DELETE ON Employee10
FOR EACH ROW
BEGIN
 IF INSERTING THEN
 INSERT INTO Employee_Audit (operation_type, employee_id, operation_date)
 VALUES ('INSERT', :NEW.ID, SYSDATE);

 ELSIF UPDATING THEN
 INSERT INTO Employee_Audit (operation_type, employee_id, operation_date)
 VALUES ('UPDATE', :OLD.ID, SYSDATE);
 ELSIF DELETING THEN
 INSERT INTO Employee_Audit (operation_type, employee_id, operation_date)
 VALUES ('DELETE', :OLD.ID, SYSDATE);

 END IF;
END;
/

SELECT * FROM Employee10;
INSERT INTO Employee10 VALUES (7, 'Sneha', 28, 'Mumbai', 48000);
UPDATE Employee10
SET salary = 71000
WHERE ID = 2;
DELETE FROM Employee10
WHERE age = 21;
SELECT * FROM Employee_Audit;
