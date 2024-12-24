package com.board.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.users.dto.UsersDto;
import com.board.users.mapper.UsersMapper;

@Controller
@RequestMapping("/Users")
public class UsersController {
	
	@Autowired
	private UsersMapper usersMapper;
	
	// http://localhost:9090
	@RequestMapping("/Wallet")
	public  String  wallet() {
		return "users/usersWallet/wallet";
		//return "/WEB-INF/views/users/Wallet/wallet.jsp";
	}
	
	@RequestMapping("/RouteRecommend")
	public  String   routeRecommend() {
		return "users/usersWallet/routeRecommend";
		//return "/WEB-INF/views/home.jsp";
	}
	
	
	// 메인 화면
	// http://localhost:9090/Users/Main
	@RequestMapping("/Main")
	public ModelAndView main() {
		// 스토어 기본정보 불러오기
		List<UsersDto> popuplist = usersMapper.getPopuplist();
		System.out.println("popuplist"+popuplist);
		ModelAndView mv = new ModelAndView();
		mv.addObject("popuplist",popuplist);
		mv.setViewName("users/usersMain/main");
		return mv;
	}
	
	@RequestMapping("/Rankdetail")
	public ModelAndView rankdetail() {
	  ModelAndView mv = new ModelAndView();
	  mv.setViewName("users/usersMain/rankdetail");
	  return mv;
	}
	@RequestMapping("/Opendetail")
	public ModelAndView opendetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/usersMain/opendetail");
		return mv;
	}
	@RequestMapping("/Ongoingdetail")
	public ModelAndView ongoingdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/usersMain/ongoingdatail");
		return mv;
	}
	
	@RequestMapping("/Mainsearch")
	public ModelAndView mainsearch() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("users/usersMain/mainsearch");
		return mv;
	}
	
}