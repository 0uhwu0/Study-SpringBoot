SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
SELECT * FROM Customers WHERE CustomerName LIKE '%a';
SELECT * FROM Customers WHERE CustomerName LIKE '%or%';
SELECT * FROM Customers WHERE CustomerName LIKE '_r%';
SELECT * FROM Customers WHERE CustomerName LIKE 'a_%_%';
SELECT * FROM Customers WHERE ContactName LIKE 'a%o';

-- 고객명(CustomerName), 계약명(ContactName) 에 'or'이 포함된 고객들 조회
SELECT * FROM Customers WHERE CustomerName LIKE '%or%' AND ContactName LIKE '%or%';