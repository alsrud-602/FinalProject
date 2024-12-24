package com.board.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	
	// http://localhost:9090
	// 유저관리
	@RequestMapping("/User")
	public  ModelAndView  user() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/user/user");
		return mv;
	}
	
	//유저관리 상세
	@RequestMapping("/Userdetail")
	public  ModelAndView  userdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/user/userdetail");
		return mv;
		
	}
	
	
	// 스토어관리 - 담당자관리
	@RequestMapping("/Managerlist")
	public  ModelAndView  managerlist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/manager/managerlist");
		return mv;
	}
	
}