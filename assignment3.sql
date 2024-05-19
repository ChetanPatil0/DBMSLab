//Assignment No 3
CREATE TABLE Sailors(
sid INTEGER PRIMARY KEY,
sname VARCHAR2(100),
rating INTEGER,
age REAL
);

CREATE TABLE Boat (bid INTEGER PRIMARY KEY,bname VARCHAR2(100),color VARCHAR2(50));
CREATE TABLE Reserves(sid INTEGER,bid INTEGER,day DATE,PRIMARY KEY (sid, bid),FOREIGNKEY(sid) REFERENCES Sailors(sid),FOREIGN KEY (bid) REFERENCES Boat(bid));
INSERT INTO Sailors (sid, sname, rating, age)
VALUES(
(22, 'Dustin', 7, 45.0),
(29, 'Brutus', 1, 33.0),
(31, 'Lubber', 8, 55.5),
(32, 'Andy', 8, 25.5),
(58, 'Rusty', 10, 35.0),
(64, 'Horatio', 7, 35.0),
(71, 'Zorba', 10, 16.0),
(74, 'Horatio', 9, 35.0),
(85, 'Art', 3, 25.5),
(95, 'Bob', 3, 63.5));

INSERT INTO Boat (bid, bname, color)
VALUES(
(101, 'Interlake', 'blue'),
(102, 'Interlake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Marine', 'red'));

INSERT INTO Reserves (sid, bid, day)
VALUES(
(22, 101, '10/10/98'),
(22, 102, '10/10/98'),
(22, 103, '10/8/98'),
(22, 104, '10/7/98'),
(31, 102, '11/10/98'),
(31, 103, '11/6/98'),
(31, 104, '12/12/98'),
(64, 101, '9/5/98'),
(64, 102, '9/8/98'),
(74, 103, '9/8/98'));

SELECT sname, age FROM Sailors;

SELECT * FROM Sailors WHERE rating > 7;

UPDATE Sailors;SET rating = rating *+(rating *10/100) WHERE age < 40;

UPDATE SailorsSET rating = rating + 2WHERE sid IN ( SELECT sid FROM ReservesWHERE day =
TO_DATE('11/12/98', 'MM/DD/YY'));

DELETE FROM SailorsWHERE rating < 3 AND age > 60;

UPDATE SailorsSET sname = NULLWHERE sid IN (SELECT sid FROM Reserves WHERE bid = 102);

SELECT UPPER(s.sname)FROM Sailors JOIN Reserves r ON s.sid = r.sidJOIN Boat b ON r.bid = b.bidWHERE b.bname = 'Interlake';
SELECT ratingFROM Sailors WHERE sname LIKE '%us%';

SELECT AVG(age)FROM Sailors WHERE rating = 8;

SELECT COUNT(*)FROM Sailors WHERE rating > 5;

SELECT ADD_MONTHS(day, 2) AS new_reservation_date FROM Reserves WHERE bid = 101 ANDsid=64;
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('12/02/2021', 'MM/DD/YYYY')) AS months_diff
FROM dual;
SELECT b.bname, TO_CHAR(r.day, 'Month') AS reservation_monthFROM ReservesrJOINBoat bONr.bid = b.bid;

SELECT ABS(-10) AS absolute_value FROM dual;

SELECT SIGN(-15) AS sign_value FROM dual;

SELECT POWER(2, 3) AS power_result FROM dual;

SELECT ROUND(15.67, 1) AS rounded_value FROM dual;

SELECT MOD(15, 4) AS modulo_result FROM dual;

SELECT FLOOR(15.67) AS floor_value FROM dual;

SELECT CEIL(15.67) AS ceil_value FROM dual;

SELECT TRUNC(15.67) AS trunc_value FROM dual;

SELECT SQRT(age) AS square_root_age FROM Sailor;

SELECT TO_CHAR(day, 'DD-Mon-YYYY') AS reservation_date FROM Reserves;

SELECT MIN(rating) AS min_rating, MAX(rating) AS max_rating FROM Sailor;

SELECT sname, age FROM SailorWHERE LENGTH(sname) >= 3 AND sname LIKE 'B%b';

SELECT sname, age FROM SailorWHERE sname LIKE 'A%' OR sname LIKE 'L%';

SELECT sname FROM Sailor WHERE rating > 7 AND age BETWEEN 33 AND 45;

SELECT snameFROM Sailors WHERE sid NOT IN ( SELECT sid FROM Reserves WHERE day =
TO_DATE('10/10/98', 'MM/DD/YY'));

SELECT sname
FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 103);
SELECT sname FROM Sailors WHERE EXISTS (
SELECT 1
FROM Reserves r
WHERE r.bid = 103 AND r.sid = s.sid
);