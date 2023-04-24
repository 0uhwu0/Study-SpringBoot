-- CATESIAN PRODUCT (곱집합) 카테시안 곱
SELECT COUNT(*) FROM Products; -- 77
SELECT COUNT(*) FROM Categories; -- 8

SELECT COUNT(*) FROM Products JOIN Categories; -- 616

SELECT * FROM Products JOIN Categories;

-- ON : 조인 조건
SELECT * FROM Products JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- 조인 후 컬럼 수 : 왼쪽 테이블 컬럼 수 + 오른쪽 테이블 컬럼 수
DESC Products; -- 6개 컬럼
DESC Categories; -- 3개 컬럼
SELECT * FROM Products JOIN Categories
ON Products.CategoryID = Categories.CategoryID;

SELECT ProductName, CategoryName
FROM Products JOIN Categories
ON Products.CategoryID = Categories.CategoryID;

-- 
SELECT * FROM Products;
SELECT * FROM Suppliers;
-- 상품명, 그 상품을 공급하는 공급자명
SELECT ProductName, SupplierName FROM Products JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

-- ALIAS 사용으로 코드 줄이기
SELECT CustomerName Name FROM Customers;

SELECT ProductName, SupplierName
FROM Products p JOIN Suppliers s
ON p.SupplierID = s.SupplierID;

SELECT p.SupplierID, s.SupplierID FROM Products p JOIN Suppliers s
ON p.SupplierID = s.SupplierID;