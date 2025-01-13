package com.board.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Review")
public class ReviewController {
	
	// http://localhost:9090
	@RequestMapping("/WriteForm")
	public  String   write() {
		return "popup/writeform";
		//return "/WEB-INF/views/home.jsp";
	}
	// http://localhost:9090
	@RequestMapping("/Update")
	public  String   update() {
		return "management/request";
		//return "/WEB-INF/views/home.jsp";
	}

	
}
