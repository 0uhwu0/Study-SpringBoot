USE w3schools;

SELECT lastName, firstName FROM Employees;

SELECT lastName, firstName
FROM (SELECT lastName, firstName FROM Employees) emp
WHERE lastName >= 'd' AND lastName < 'e';

-- 고객별 소비금액
SELECT AVG(구매금액) FROM 
(SELECT c.CustomerID, c.CustomerName, SUM(p.Price * od.Quantity) 구매금액 
FROM
	Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
		     JOIN Customers c ON o.CustomerID = c.CustomerID
             JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID
ORDER BY 구매금액 DESC) t1;

-- (직원별 매출액)의 평균
SELECT AVG(매출) average
FROM
(SELECT
 e.EmployeeID,
 SUM(p.Price * od.Quantity) 매출 
FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
              JOIN OrderDetails od ON o.OrderID = od.OrderID
              JOIN Products p ON od.ProductID = p.ProductID
GROUP BY e.EmployeeID) T1;

-- 카테고리별 평균상품가격 조회 (평균상품가격이 30.00 달러 이상인 것만)
SELECT CategoryID, AVG(Price)
FROM Products
GROUP BY CategoryID
HAVING AVG(Price) >= 30.00;

SELECT CategoryID, average
FROM
(SELECT CategoryID, AVG(Price) average
FROM Products
GROUP BY CategoryID) T1
WHERE average >= 30.00;

SELECT T1.CategoryID, c.CategoryName, T1.average
FROM
(SELECT CategoryID, AVG(Price) average
FROM Products
GROUP BY CategoryID) T1 JOIN Categories c ON T1.CategoryId = c.CategoryId
WHERE average >= 30.00;
