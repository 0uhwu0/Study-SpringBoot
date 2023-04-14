-- NOT 
SELECT * FROM Customers;
SELECT * FROM Customers WHERE Country = 'Germany'; -- 11
SELECT * FROM Customers WHERE NOT Country = 'Germany'; -- 80

-- london 에 있지 않는 고객들 조회
SELECT * FROM Customers WHERE NOT City = 'London';

SELECT * FROM Employees WHERE BirthDate >= '1950-01-01' AND BirthDate <= '1959-12-31';
SELECT * FROM Employees WHERE NOT(BirthDate >= '1950-01-01' AND BirthDate <= '1959-12-31');
SELECT * FROM Employees WHERE ! (BirthDate >= '1950-01-01' AND BirthDate <= '1959-12-31');

SELECT * FROM Products WHERE CategoryID = 1 OR CategoryID = 2;
SELECT * FROM Products WHERE NOT (CategoryID = 1 OR CategoryID = 2);
SELECT * FROM Products WHERE CategoryID <> 1 AND CategoryID <> 2;