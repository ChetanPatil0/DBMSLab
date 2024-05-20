//Assignment – 10

/*Assignment Title – Write a Pl/SQL block to calculate gross salary on basis of basicsalary. If DA is 40% of basic ,HRA is 20% of basic andPF deduction is 12%of basicsalary.Grosssalary=Basic Salary+DA+HRA-PFAcceptbasic salary fromuser and passit
to function, function will return gross salary */

CREATE OR REPLACE FUNCTION calculate_gross_salary (
basic_salary IN NUMBER
) RETURN NUMBER
IS
da CONSTANT NUMBER := 0.4;
hra CONSTANT NUMBER := 0.2;
pf CONSTANT NUMBER := 0.12;
gross_salary NUMBER;
BEGIN
gross_salary := basic_salary + (basic_salary * da) + (basic_salary * hra) -(basic_salary*pf);
RETURN gross_salary;
END calculate_gross_salary;
/

DECLARE
basic_salary NUMBER;
gross_salary NUMBER;
BEGIN
basic_salary := :basic_salary;
gross_salary := calculate_gross_salary(basic_salary);
DBMS_OUTPUT.PUT_LINE('Gross Salary:'|| gross_salary);
END;
/
