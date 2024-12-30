package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.users.dto.UsersDto;
import com.board.users.mapper.UsersMapper;

@Controller
public class HomeController {

	@Autowired
	private UsersMapper usersMapper;
	
	// http://localhost:9090
	@RequestMapping("/")
	public  ModelAndView   home() {
		//랭킹 팝업
		List<UsersDto> ranklist = usersMapper.getRanklist();
		System.out.println("ranklist : "+ranklist);
		
		
		// 팝업 오픈예정
		List<UsersDto> opendpopuplist = usersMapper.getOpendpopuplist();
		System.out.println("opendpopuplist : "+opendpopuplist);
		
		// 팝업 진행중
		List<UsersDto> popuplist = usersMapper.getPopuplist();
		System.out.println("popuplist"+popuplist);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("opendpopuplist",opendpopuplist);
		mv.addObject("ranklist",ranklist);
		mv.addObject("popuplist",popuplist);
		mv.setViewName("users/usersMain/main");
		return mv;
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
	


	
}