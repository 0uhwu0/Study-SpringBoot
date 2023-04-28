package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface Mapper07 {

	@Select("""
			<script>
			<bind name="pattern" value="'%' + keyword + '%'" />
			
			SELECT 
				CustomerId id,
				CustomerName name,
				contactName,
				address
			FROM 
				Customers
			WHERE
				CustomerName LIKE #{pattern}
			ORDER BY id DESC
			</script>
			""")
	List<Customer> sql1(String keyword);

	@Select("""
			<script>
			<bind name="p" value="'%' + search + '%'" />
			
			SELECT
				EmployeeId id,
				FirstName,
				lastName
			FROM
				Employees
			WHERE
				firstName LIKE #{p}
				OR lastName LIKE #{p}
			ORDER BY id DESC
			</script>
			""")
	List<Employee> sql2(String search);

	@Select("""
			<script>
			SELECT COUNT(*)
			FROM Customers
			
			<if test="false">
				WHERE CustomerID = 10
			</if>
			</script>
			""")
	Integer sql3();

	@Select("""
			<script>
			SELECT COUNT(*)
			FROM Customers
			
			<if test="keyword neq null">
				<bind name="pattern" value="'%' + keyword + '%'" />
				WHERE CustomerName LIKE #{pattern}
			</if>
			</script>
			""")
	Integer sql4(String keyword);
	
	@Select("""
			<script>
			SELECT AVG(Price)
			FROM Products
			
			<if test="id neq 0">
				WHERE CategoryID = #{id}
			</if>
			</script>
			""")
	Double sql5(Integer id);
}
