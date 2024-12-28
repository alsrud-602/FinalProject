package com.board.users.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.board.jwt.JwtUtil;
import com.board.users.dto.User;
import com.board.users.dto.UsersDto;
import com.board.users.mapper.UsersMapper;
import com.board.users.service.UserService;

@Controller
@RequestMapping("/Users")
public class UsersController {
	
	@Autowired
	private UsersMapper usersMapper;
	
    @Autowired
    private UserService userService;
    
    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    public UsersController(AuthenticationManager authenticationManager, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }
	
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
	
	// 랭킹 팝업
	@RequestMapping("/Rankdetail")
	public ModelAndView rankdetail() {
	 
		// 랭킹 팝업 리스트
		List<UsersDto> ranklist = usersMapper.getRanklist();
  
		
	  ModelAndView mv = new ModelAndView();
	  mv.addObject("ranklist",ranklist);
	  mv.setViewName("users/usersMain/rankdetail");
	  return mv;
	}
	
    // 오픈예정 팝업	
	@RequestMapping("/Opendetail")
	public ModelAndView opendetail() {
		
		// 팝업 오픈예정
		List<UsersDto> opendpopuplist = usersMapper.getOpendpopuplist();
		System.out.println("opendpopuplist : "+opendpopuplist);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("opendpopuplist",opendpopuplist);
		mv.setViewName("users/usersMain/opendetail");
		return mv;
	}
	
	// 진행중 팝업
	@RequestMapping("/Ongoingdetail")
	public ModelAndView ongoingdetail() {
		
		// 진행중 팝업
		List<UsersDto> popuplist = usersMapper.getPopuplist();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("popuplist",popuplist);
		mv.setViewName("users/usersMain/ongoingdetail");
		return mv;
	}
	
	// 메인화면-검색창이동
	@RequestMapping("/Mainsearch")
	@ResponseBody
	public ModelAndView mainsearch(
			@RequestParam(required = false, value="search") String search) {
		System.out.println("search : " + search);
		
		// 진행중 팝업
		List<UsersDto> ongoingsearchlist = usersMapper.getOngoingsearchlist(search);
		System.out.println("ongoingsearchlist : " + ongoingsearchlist);
		// 팝업 오픈예정
		List<UsersDto> opendsearchlist = usersMapper.getOpendsearchlist(search);
		System.out.println("opendsearchlist : " + opendsearchlist);
		
		// 종료된 팝업
		List<UsersDto> closesearchlist = usersMapper.getClosesearchlist(search);
		System.out.println("closesearchlist : " + closesearchlist);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("ongoingsearchlist", ongoingsearchlist);
		mv.addObject("opendsearchlist", opendsearchlist);
		mv.addObject("closesearchlist", closesearchlist);
		mv.setViewName("users/usersMain/mainsearch");
		return mv;
	}
	
	
	
	//지역,연령대 필터링
	@RequestMapping("Regionfilter")
	@ResponseBody
	public Map<String,Object> regionfilter(
			@RequestParam(required = false,value="region") String region,
			@RequestParam(required = false,value="age") String age,
			@RequestParam(required = false, value="date") String date) {
		System.out.println("region : " + region);
		System.out.println("date : " + date);
		System.out.println("age : " + age);
		
		Map<String,Object> response = new HashMap<>();
		
		List<UsersDto> filterlist = usersMapper.getFilterlist(region,age,date);
		System.out.println("filterlist : "+filterlist);
		response.put("filterlist", filterlist);
		System.out.println("response" + response);
	
		return response;
	}
	
	// 상세정보 페이지 
	@RequestMapping("Info")
	public ModelAndView info(UsersDto usersdto){
		
		System.out.println("usersdto : "+ usersdto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/popup/info");
		return mv;
	}
	
}