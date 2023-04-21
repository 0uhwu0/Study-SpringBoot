package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Controller
@RequestMapping("sub21")
public class Controller21 {
	
	@Autowired
	private Mapper02 mapper;
	
	@RequestMapping("link1")
	public void method1() {
		String sql = """
				SELECT CustomerName FROM Customers
				""";
		
		List<String> list = mapper.sql1();
//		System.out.println(list);
		list.forEach(System.out::println);
	}
	
	@RequestMapping("link2")
	public void method2() {
		// 직원의 lastName 출력
		List<String> list = mapper.sql2();
		list.forEach(System.out::println);
	}
	
	@RequestMapping("link3")
	public void method3() {
		List<Dto07> list = mapper.sql3();
		list.forEach(System.out::println);
	}
	
	// 모든 상품의 이름, 가격을 조회해서 콘솔에 출력
	@RequestMapping("link4")
	public void method4() {
		List<Dto08> list = mapper.sql4();
		list.forEach(System.out::println);
	}
	
	// /sub21/link5?cid=3
	@RequestMapping("link5")
	public void method5(@RequestParam("cid") Integer cid) {
		List<String> names = mapper.sql5(cid);
		names.forEach(System.out::println);
	}
	
	// /sub21/link6?country=uk
	// 각 국가에 있는 고객명이 콘솔에 출력
	@RequestMapping("link6")
	public void method6(@RequestParam("country") String country) {
		List<String> cn = mapper.sql6(country);
		cn.forEach(System.out::println);
	}
	
	@RequestMapping("link7")
	public void method7(@RequestParam("cid") Integer cid) {
		List<Dto08> list = mapper.sql7(cid);
		list.forEach(System.out::println);
	}
}




