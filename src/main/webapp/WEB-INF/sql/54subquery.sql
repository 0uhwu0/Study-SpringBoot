SELECT Country FROM Suppliers;
SELECT DISTINCT Country FROM Suppliers; -- 여러 행
SELECT * FROM Customers
WHERE Country IN (SELECT DISTINCT Country FROM Suppliers);

-- '1996-07-04'에 주문한 상품명 조회
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Products;
SELECT OrderID FROM Orders
WHERE OrderDate = '1996-07-04';
SELECT ProductId FROM OrderDetails
WHERE OrderID IN (10248);
SELECT ProductName FROM Products
WHERE ProductID IN (11, 42, 72);
SELECT ProductName FROM Products
WHERE ProductID IN (SELECT ProductId FROM OrderDetails
					WHERE OrderID IN (SELECT OrderID FROM Orders
										WHERE OrderDate = '1996-07-04'));

