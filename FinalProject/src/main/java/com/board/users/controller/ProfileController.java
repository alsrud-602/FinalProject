package com.board.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Users")
public class ProfileController {
	
	// http://localhost:9090
	@RequestMapping("/Profile")
	public  String  Profile() {
		return "users/profile/main";
		//return "/WEB-INF/views/users/Wallet/wallet.jsp";
	}
	
	
}