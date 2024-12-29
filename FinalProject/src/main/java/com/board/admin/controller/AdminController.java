package com.board.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/M1")
	public  ModelAndView  M1() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/manager/detail");
		return mv;
		//return "/WEB-INF/views/users/Wallet/wallet.jsp";
	}
	
	
	// 스토어관리 - 담당자관리
	@RequestMapping("/Managerlist")
	public  ModelAndView  managerlist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/manager/managerlist");
		return mv;
	}
	
	@RequestMapping("/Advertise")
	public ModelAndView advertise() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/manager/advertise");
		return mv;
	}
	
	@RequestMapping("/Home")
	public String adminhome() {
		return "admin/dashboard/dashboard";
		
	}
	
}