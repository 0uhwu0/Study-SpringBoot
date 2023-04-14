package com.example.demo.controller;

import java.sql.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;

@Controller
@RequestMapping("sub13")
public class Controller13 {

	@Value("${spring.datasource.url}")
	private String url;
	@Value("${spring.datasource.username}")
	private String name;
	@Value("${spring.datasource.password}")
	private String password;
	
	@RequestMapping("link1")
	// 고객 주소 추가
	// jsp에서 테이블 형식으로 보여주기
	public void method1(Model model) throws Exception {
		String sql = "SELECT CustomerID, CustomerName, Address FROM Customers";
		List<Customer> obj = new ArrayList<>();
		
		// 1. 
		// 2. 
		Connection con = DriverManager.getConnection(url, name, password);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		try (con; stmt; rs) {
			while (rs.next()) {
				int id = rs.getInt("customerID");
				String name = rs.getString("customerName");
				String address = rs.getString("address");
				System.out.println(id + " : " + name);
				
				Customer customer = new Customer();
				customer.setId(id);
				customer.setName(name);
				customer.setAddress(address);
				obj.add(customer);
			}
		}
		// 3. add attribute
		model.addAttribute("customerList", obj);
		
		// 4.
	}
	
	@RequestMapping("link2")
	public void method2(Model model) throws Exception{
		String sql = "SELECT EmployeeId, LastName, FirstName FROM Employees";
		List<Employee> list = new ArrayList<>();
		// Employee 클래스 작성
		// 프로퍼티 (id, lastName, firstName)
		Connection con = DriverManager.getConnection(url, name, password);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		try (con; stmt; rs;) {
			while (rs.next()) {
				Employee ee = new Employee();
				ee.setId(rs.getInt("employeeId"));
				ee.setLastName(rs.getString("lastName"));
				ee.setFirstName(rs.getString("firstName"));
				list.add(ee);
			}
		}
		model.addAttribute("employeeList", list);
	}
	
	// 경로 : /sub13/link3?id=
	@RequestMapping("link3")
	public String method3(@RequestParam String id, Model model) throws Exception {
		List<Customer> list = new ArrayList<>();
		String sql = "SELECT CustomerId, CustomerName, Address FROM Customers WHERE CustomerId = ";
		sql += id;
		
		Connection con = DriverManager.getConnection(url, name, password);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		try (con; stmt; rs) {
			while (rs.next()) {
				Customer customer = new Customer();
				customer.setId(rs.getInt("customerid"));
				customer.setName(rs.getString("customerName"));
				customer.setAddress(rs.getString("address"));
				
				list.add(customer);
			}
		}
		
		model.addAttribute("customerList", list);
		
		return "/sub13/link1";
	}
	
	@RequestMapping("link4")
	public String method4(@RequestParam String id, Model model) throws Exception {
		List<Customer> list = new ArrayList<>();
		String sql = "SELECT CustomerId, CustomerName, Address FROM Customers WHERE CustomerId = ? ";
		
		Connection con = DriverManager.getConnection(url, name, password);
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, id);
		ResultSet rs = stmt.executeQuery();
		
		try (con; stmt; rs) {
			while (rs.next()) {
				Customer customer = new Customer();
				customer.setId(rs.getInt("customerid"));
				customer.setName(rs.getString("customerName"));
				customer.setAddress(rs.getString("address"));
				
				list.add(customer);
			}
		}
		
		model.addAttribute("customerList", list);
		
		return "/sub13/link1";
	}
	
	@RequestMapping("link5")
	public String method5(String id, Model model) throws Exception{
		String sql = "SELECT EmployeeId, lastName, firstName FROM Employees WHERE EmployeeId = ?";
		List<Employee> list = new ArrayList<>();
		
		Connection con = DriverManager.getConnection(url, name, password);
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		try (con; pstmt; rs) {
			while (rs.next()) {
				Employee ee = new Employee();
				ee.setId(rs.getInt("EmployeeId"));
				ee.setFirstName(rs.getString("firstName"));
				ee.setLastName(rs.getString("lastName"));
				list.add(ee);
			}
			model.addAttribute("employeeList", list);
		}
		
		return "/sub13/link2";
	}
}
