package com.example.demo.controller;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;

@Controller
@RequestMapping("sub10")
public class Controller10 {
	
	@RequestMapping("link1")
	public void method1(@RequestParam String name) {
//		String name = request.getParameter("name");
	}
	
	@RequestMapping("link2")
	public void method2(@ModelAttribute Dto04 dto) {
		/*
		  Dto04 dto = new Dto04(); 
		  dto.setName(request.getParameter("name"));
		  dto.setAge(Integer.parseInt((request.getParameter("age")));
		  
		  request.setAttibute("dto04", dto);
		 */
	}
	
	// /sub10/link3?model=ray&price=3.14&name=son&age=22
	@RequestMapping("link3")
	public void method3(
						@ModelAttribute("model") String model,
						@ModelAttribute("price") double price, 
						Dto04 obj) {
		
	}
	
	@RequestMapping("link4")
	public void method4() {
		// 1. request param 수집 / 가공
		
		// 2. business logic
		// data를 생성(create), 읽기(read), 수정(update), 삭제(delete)
		// crud
		
		// 3. add attribute
		
		// 4. forward
	}
}




