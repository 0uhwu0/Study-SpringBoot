CREATE DATABASE leetcode183;
USE leetcode183;
CREATE TABLE Customers (
	id INT PRIMARY KEY,
    name VARCHAR(100)
);
INSERT INTO Customers VALUES (1, 'Joe');
INSERT INTO Customers VALUES (2, 'Henry');
INSERT INTO Customers VALUES (3, 'Sam');
INSERT INTO Customers VALUES (4, 'Max');

CREATE TABLE Orders (
	id INT PRIMARY KEY,
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES Customers(id)
);
INSERT INTO Orders VALUES (1, 3);
INSERT INTO Orders VALUEs (2, 1);

-- 문제 ) 한번도 주문하지 않은 고객 조회
SELECT c.name Customers FROM 
Customers c LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;

-- 서브쿼리로 풀어보기
USE leetcode183;
SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT customerId FROM Orders;
SELECT * FROM Customers WHERE id NOT IN (1, 3);
SELECT name FROM Customers 
WHERE id NOT IN (SELECT customerId FROM Orders);

-- w3schools 데이터베이스에서
-- 서브쿼리 사용해서 주문한적 없는 고객들 조회
USE w3schools;
SELECT * FROM Orders;
SELECT CustomerName FROM Customers
WHERE CustomerID NOT IN (
                         SELECT CustomerID 
                         FROM Orders);