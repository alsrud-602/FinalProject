package com.board.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Review")
public class ReviewController {
	
	// http://localhost:9090
	@RequestMapping("/WriteForm")
	public  String   write() {
		return "users/popup/writeform";
		//return "/WEB-INF/views/home.jsp";
	}
	// http://localhost:9090
	@RequestMapping("/Request")
	public  String   request() {
		return "business/management/request";
		//return "/WEB-INF/views/home.jsp";
	}

	@RequestMapping("/Update")
	public  String   update() {
		return "business/management/update";
		//return "/WEB-INF/views/home.jsp";
	}
	
	@RequestMapping("/Rlist")
	public  String   rlist() {
		return "business/management/requestlist";
		//return "/WEB-INF/views/home.jsp";
	}
	@RequestMapping("/Rview")
	public  String   rview() {
		return "business/management/info";
		//return "/WEB-INF/views/home.jsp";
	}
	@RequestMapping("/Storeuser")
	public  String   storeuser() {
		return "admin/user";
		//return "/WEB-INF/views/home.jsp";
	}
	
	@RequestMapping("/Storeview")
	public  String   Storeview() {
		return "admin/store/view";
		//return "/WEB-INF/views/home.jsp";
	}
	@RequestMapping("/Storeupdate")
	public  String   Storeupdate() {
		return "admin/store/update";
		//return "/WEB-INF/views/home.jsp";
	}	
	
}
