package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	// http://localhost:9090
	@RequestMapping("/")
	public  String   home() {
		return "popup/info";
		//return "/WEB-INF/views/home.jsp";
	}
	
	@RequestMapping("/Ho")
	public  String   test() {
		return "/home";
		//return "/WEB-INF/views/home.jsp";
	}
	
	
	@RequestMapping("/info2")
	public  String   info2() {
		return "popup/info2";
		//return "/WEB-INF/views/home.jsp";
	}
	

	
}