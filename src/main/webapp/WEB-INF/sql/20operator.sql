-- +, -, /, *, %
SELECT * FROM Products;
SELECT ProductName, Price * 1300  FROM Products;
SELECT ProductName, Price * 1300 wonPrice FROM Products;

SELECT ProductName, Price / 100 wonPrice FROM Products;
SELECT ProductName, Price + 100 wonPrice FROM Products;
SELECT ProductName, Price - 100 wonPrice FROM Products;

-- 문자열 연결
SELECT City + Country FROM Customers; -- x
SELECT CONCAT(City, Country) FROM Customers; -- ok
SELECT CONCAT(City, ",", Country) FROM Customers; -- ok
SELECT CONCAT(City, " ", Country) FROM Customers; -- ok
SELECT CONCAT(City, " ", Country) cityOfCountry FROM Customers; -- ok

-- 직원 이름 "firstName, LastName" 형식으로 조회
SELECT CONCAT(firstName, ", " , lastName) name FROM Employees;

-- 원화(* 1300)로 10만원 이상인 상품들 조회
SELECT ProductName, Price * 1300 wonPrice FROM Products HAVING wonPrice >= 100000;

-- 부분 문자열 : substring
-- 첫번째파라미터 : 원본 문자열
-- 두번째파라미터 : 시작인덱스
-- 세번째파라미터 : 길이
SELECT substring('hello world', 3, 3); -- 첫글자는 인덱스 1

SELECT CustomerName FROM Customers;
SELECT SUBSTRING(CustomerName, 1, 3) FROM Customers;

-- 고객테이블에서 고객명, 나라이름(앞3글자만) 조회
SELECT CustomerName, SUBSTRING(Country, 1, 3) FROM Customers;