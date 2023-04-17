-- HAVING : 집계함수의 조건 설정
SELECT Country, COUNT(CustomerID) FROM Customers GROUP BY Country;

-- 5명 이상의 고객이 있는 나라 조회
SELECT Country, COUNT(CustomerID) numOfCustomer FROM Customers WHERE CustomerID >= 5 GROUP BY Country; -- WHERE 절에선 별칭 사용 불가능

SELECT Country, COUNT(CustomerID) numOfCustomer FROM Customers GROUP BY Country HAVING numOfCustomer >= 5;

-- 상품의 평균 가격이 30 달러 이상인 카테고리 조회
SELECT CategoryID, AVG(Price) ap FROM Products GROUP BY CategoryID HAVING ap >= 30;

-- 카테고리별 상품의 최고 가격이 100달러 이상인 카테고리
SELECT CategoryID, MAX(Price) mp FROM Products GROUP BY CategoryID HAVING mp >= 100;