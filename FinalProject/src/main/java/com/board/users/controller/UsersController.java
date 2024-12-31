package com.board.users.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

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
	public ModelAndView main(			
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "2") int size) {
		
		 int start = (page - 1) * size; 
		 int totalPosts = usersMapper.getOngoingcount();
		 int totalPages = (int) Math.ceil((double) totalPosts / size);
		 System.out.println("totalPosts : " + totalPosts);
		 System.out.println("totalPages : " + totalPages);

		//랭킹 팝업
		List<UsersDto> ranklist = usersMapper.getRanklist();
		System.out.println("ranklist : "+ranklist);
		
		
		// 팝업 오픈예정
		List<UsersDto> opendpopuplist = usersMapper.getOpendpopuplist();
		System.out.println("opendpopuplist : "+opendpopuplist);
		
		// 팝업 진행중
		List<UsersDto> popuplist = usersMapper.getPopuppaginglist(start,size);
		System.out.println("popuplist"+popuplist);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("opendpopuplist",opendpopuplist);
		mv.addObject("totalPages", totalPages);
		mv.addObject("currentPage", page);
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
			@RequestParam(required = false, value="search") String search,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "2") int size) {
		
		 int start = (page - 1) * size; 
		 int totalPosts = usersMapper.getOngoingsearchcount(search);
		 int totalPages = (int) Math.ceil((double) totalPosts / size);
		 System.out.println("totalPosts search : " + totalPosts);
		 System.out.println("totalPages search : " + totalPages);
		 
		
		// 진행중 팝업
		List<UsersDto> ongoingsearchlist = usersMapper.getOngoingsearchlist(search);
		// 팝업 오픈예정
		List<UsersDto> opendsearchlist = usersMapper.getOpendsearchlist(search,start,size);	
		System.out.println("paging opendsearchlist : " + opendsearchlist);
		// 종료된 팝업
		List<UsersDto> closesearchlist = usersMapper.getClosesearchlist(search);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("ongoingsearchlist", ongoingsearchlist);
		mv.addObject("totalPages", totalPages);
		mv.addObject("currentPage", page);
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

		 // 유저 아이디당 한개씩 조회수 증가
		
        // store_idx 데이터 불러오기
		UsersDto storedetail = usersMapper.getStoredetail(usersdto);
		System.out.println("storedetail : " + storedetail);
		
		// 스토어 태그
		List<UsersDto> storetag = usersMapper.getStoretag(usersdto);
		System.out.println("storetag : " + storetag);
		
		//스토어 예약 구분
		UsersDto StoreReservation = usersMapper.getStoreReservation(usersdto);
		System.out.println("StoreReservation : " + StoreReservation);
		
		//운영시간 
		UsersDto StoreOperation = usersMapper.getStoreOperation(usersdto);
		System.out.println("StoreOperation : " + StoreOperation);
		
		// 카데고리
		List<UsersDto> StoreCategory = usersMapper.getStoreCategory(usersdto);
		System.out.println("StoreCategory : " + StoreCategory);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("storedetail", storedetail);
		mv.addObject("storetag", storetag);
		mv.addObject("StoreReservation", StoreReservation);
		mv.addObject("StoreOperation", StoreOperation);
		mv.addObject("StoreCategory", StoreCategory);
		mv.setViewName("users/popup/info");
		return mv;
	}
	
}