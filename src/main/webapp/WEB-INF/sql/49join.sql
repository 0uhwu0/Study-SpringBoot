SELECT COUNT(*) FROM Products; -- 77개 행
SELECT COUNT(*) FROM Categories; -- 8개 행
SELECT COUNT(*) FROM Suppliers; -- 29개 행
DESC Products; -- 6개 열
DESC Categories; -- 3개 열
DESC Suppliers; -- 8개 열

SELECT * FROM Products JOIN Categories JOIN Suppliers; -- 17개 열
SELECT COUNT(*) FROM Products JOIN Categories JOIN Suppliers; -- 17864개 행

SELECT *FROM
Products p JOIN Categories c ON p.CategoryID = c.CategoryID
		   JOIN Suppliers s ON p.SupplierID = s.SupplierID; -- 77개 행
           
-- 예) 1번 상품의 상품명, 카테고리명, 공급자명
SELECT p.ProductName, c.CategoryName, s.SupplierName
FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID
				JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.ProductID = 1;

-- 예제) 1996-07-04에 주문한 상품명
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Products;
SELECT p.ProductName 
FROM 
Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
		 JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate = '1996-07-04';

-- '1996-07-04'의 매출 조회
SELECT SUM(od.Quantity * p.Price) 매출
FROM
OrderDetails od JOIN Products p ON od.ProductID = p.ProductID
				JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate = '1996-07-04';

-- 일별 매출 조회 (날짜 순으로 결과 조회)
SELECT o.OrderDate, SUM(od.Quantity * p.Price) 일별매출
FROM
Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
		 JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.OrderDate
ORDER BY o.OrderDate ASC;

SELECT * FROM Employees;


-- 직원별 처리금액
SELECT e.EmployeeID, e.LastName, e.FirstName, SUM(p.Price * od.Quantity) 매출
FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
			  JOIN OrderDetails od ON o.OrderID = od.OrderID
              JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN '1997-01-01' AND '1997-01-31'
GROUP BY e.EmployeeID
ORDER BY 매출 DESC;

-- 상품별 판매금액
SELECT p.ProductID, p.ProductName, SUM(od.Quantity * p.Price) 판매금액
FROM
Products p JOIN OrderDetails od ON p.ProductID = od.ProductID
		   JOIN Orders o ON o.OrderID = od.OrderID
GROUP BY p.ProductID
ORDER BY 판매금액 DESC;

-- 고객별 소비금액
SELECT c.CustomerID ,c.CustomerName, SUM(od.Quantity * p.Price) 소비금액
FROM
Customers c JOIN Orders o  ON c.CustomerID = o.CustomerID
			JOIN OrderDetails od ON o.OrderID = od.OrderID
            JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID
ORDER BY 소비금액 DESC;