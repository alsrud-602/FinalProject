package com.board.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	
	// http://localhost:9090
	@RequestMapping("/User")
	public  ModelAndView  user() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/user/user");
		return mv;
	}
	
	@RequestMapping("/Userdetail")
	public  ModelAndView  userdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/user/userdetail");
		return mv;
		
	}
	
	// 테스트용 페이지
	@RequestMapping("/Test")
	public  ModelAndView  test() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/user/test");
		return mv;
		
	}
	
}