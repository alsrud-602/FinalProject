package com.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Users")
public class UsersController {
	
	
	@RequestMapping("/Main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}  
	
}
