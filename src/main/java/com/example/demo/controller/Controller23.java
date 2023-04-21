package com.example.demo.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.mapper.*;

@Controller
@RequestMapping("sub23")
public class Controller23 {
	
	@Autowired
	private Mapper04 mapper;
	
	@RequestMapping("link1")
	public void method1() {
		int cnt = mapper.sql1();
		System.out.println(cnt + "개 행 삭제됨");
	}
	
	@RequestMapping("link2")
	public void method2(@RequestParam("id") Integer id) {
		int cnt = mapper.sql2(id);
		System.out.println(cnt + "개 행 삭제됨");
	}
	
	// /sub23/link3?key=7
	// 7번 고객 삭제하기
	@RequestMapping("link3")
	public void method3(@RequestParam("key") Integer key) {
		int cnt = mapper.sql3(key);
		System.out.println(key + "번 고객 정보 삭제됨");
	}
}
