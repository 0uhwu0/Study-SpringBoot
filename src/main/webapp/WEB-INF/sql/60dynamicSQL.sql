USE w3schools;

SELECT * FROM Customers
WHERE CustomerName LIKE '%ell%';
SELECT * FROM Employees;
SELECT
				EmployeeId id,
				lastName,
				FirstName,
				birthDate,
				photo,
				notes
			FROM
				Employees
			WHERE
				firstName or lastName LIKE "%eve%";
			