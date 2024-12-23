package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	// http://localhost:9090
	@RequestMapping("/")
	public  String   home() {

		return "home";
		//return "/WEB-INF/views/home.jsp";
	}
	

	@RequestMapping("/Ho")
	public  String   test() {
		return "business/registration/write";

		//return "/WEB-INF/views/home.jsp";
	}

	
	@RequestMapping("/Ho2")
	public  String   test2() {
		return "business/management/update";

		//return "/WEB-INF/views/home.jsp";
	}
	
	


	
	
	@RequestMapping("/Business")
	public String businesshome() {
		return "business/operation/operation";

	}
	
	

	
}