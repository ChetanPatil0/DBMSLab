//Assignment- 7
/*Assignment Title-Write a PL/SQL block for following
requirement and handle the exceptions. Roll no. of student will be entered by user. Attendance of roll no. entered by user will be checked in
Student table. If attendance is less than 75%then display the message “Termnot
granted” and set the status in Student table as “D”. Otherwise display message“Term granted” and set the status in Student table as “ND” Commands*/

CREATE TABLE BSTUDENT (
 ROLLNO INT PRIMARY KEY,
 NAME VARCHAR(20),
 ATTENDANCE INT,
 STATUS VARCHAR(10)
);

INSERT INTO BSTUDENT VALUES (1,'KAJAL', 98,'');
INSERT INTO BSTUDENT VALUES (2,'AISH', 85,'');
INSERT INTO BSTUDENT VALUES (3,'RAGINI', 75,'');
INSERT INTO BSTUDENT VALUES (4,'SHUBHAM', 65,'');
INSERT INTO BSTUDENT VALUES (5, 'MAI',45,'');

DECLARE
 v_ROLLNO INT;
 v_ATTENDANCE INT;
 v_STATUS VARCHAR(10);
BEGIN
 v_ROLLNO := :ROLLNO ;
 SELECT ATTENDANCE,STATUS INTO v_ATTENDANCE,v_STATUS
 FROM BSTUDENT
 WHERE ROLLNO = v_ROLLNO ;
 IF v_ATTENDANCE< 75 THEN
 UPDATE BSTUDENT
 SET STATUS = 'D'
 WHERE ROLLNO = v_ROLLNO ;
 DBMS_OUTPUT.PUT_LINE('TERM NOT GRANTED');
 ELSE
 UPDATE BSTUDENT
 SET STATUS = 'ND'
 WHERE ROLLNO = v_ROLLNO ;
 DBMS_OUTPUT.PUT_LINE('TERM GRANTED');
 END IF;
 EXCEPTION
 WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('ROLL NO NOT FOUND');
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('AN ERROR OCCURED');
 END;


SELECT *FROM BSTUDENT;

