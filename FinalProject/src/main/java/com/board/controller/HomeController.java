package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {


	// http://localhost:9090
	@RequestMapping("/")
	public  String   home() {
		return "users/usersMain/main";

	}
	

	@RequestMapping("/Ho")
	public  String   test() {
		return "admin/user/user";
		

		//return "/WEB-INF/views/home.jsp";
	}

	
	

	
	@RequestMapping("/Business")
	public String businesshome() {
		return "business/operation/operation";

	}

	@RequestMapping("/Operation")
	public String operationform() {
		return "business/operation/operation";

	}


	
}