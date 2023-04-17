SELECT * FROM Products ORDER BY 1 DESC;
-- IFNULL : null 이면 다른 값으로 변경
SELECT ifnull(0, 100); -- 0
SELECT ifnull('kim', 'lee'); -- kim
SELECT ifnull(NULL, 100); -- 100
SELECT ifnull(NULL, 'park'); -- park

SELECT ProductID, ProductName, SupplierID, CategoryID, Unit, Price FROM Products ORDER BY 1 DESC;
SELECT ProductID, ProductName, SupplierID, CategoryID, Unit, IFNULL(Price, 0) FROM Products ORDER BY 1 DESC;
SELECT ProductID, 
	   ProductName, 
       SupplierID, 
       CategoryID, 
       Unit, 
       IFNULL(Price, 0) Price 
FROM Products ORDER BY 1 DESC;

SELECT AVG(IFNULL(Price, 0)) Average FROM Products WHERE CategoryID = 2;

-- 문제1) 
-- 고객테이블에서 CustomerId, CustomerName, ContactName, Address 조회
-- ContactName이 NULL 이면 'Anonymous'로
-- Address 가 NULL 이면 'Homeless' 로 조회
SELECT * FROM Customers ORDER BY 1 DESC;
SELECT CustomerId, CustomerName, IFNULL(ContactName, 'Anonymous') ContactName, IFNULL(Address, 'Homeless') Address FROM Customers;
