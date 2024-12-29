package com.board.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.admin.mapper.AdminMapper;
import com.board.admin.vo.AdminVo;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	
	@Autowired
	private AdminMapper adminMapper;
	
	// http://localhost:9090
	// 유저관리
	@RequestMapping("/User")
	public  ModelAndView  user() {
		
		List<AdminVo> allusers = adminMapper.getalluserinfo();
		
		System.out.println(allusers);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("allusers", allusers);
		mv.setViewName("/admin/user/user");
		return mv;
	}
	
	//유저관리 상세
	@RequestMapping("/Userdetail")
	public String userDetail(Model model) {
		
		String userId = "TEST";
		
		int totPopCorn = adminMapper.getTotalPopcorn(userId);
		System.out.println("totPopCorn:"+ totPopCorn);
		
        // 팝콘 지급/사용 내역 조회 (전체)
		List<AdminVo> wallet = adminMapper.getPopcornLogByUserId(userId);
		System.out.println("팝콘 지급/사용 내역:"+wallet);
		
		// 팝콘 지급 량 
		int earn = adminMapper.getPopcornEarnLogByUserId(userId);
		System.out.println("팝콘 지급량:"+earn);
		
		// 팝콘 사용 량
		int spented = adminMapper.getPopcornSpentedLogByUserId(userId);
		System.out.println("팝콘 사용량:"+spented);
		
        // 모델에 데이터 추가
		model.addAttribute("totPopCorn", totPopCorn);
		model.addAttribute("earn", earn);
		model.addAttribute("spented", spented);
        model.addAttribute("userId", userId);
        model.addAttribute("wallet", wallet);

        return "admin/user/userdetail"; // 수정 가능한 폼으로 연결
    }
	
	  @PostMapping("/PlusPopcorn")
	    public String  givePopcorn(
	    		@RequestParam String userId,
	            @RequestParam String content,
	            @RequestParam int plusPopcorn
	            ) {
	        
		      adminMapper.PopcornPlusLogByUserId(userId,content,plusPopcorn);
		      System.out.println("로그추가");
		      adminMapper.PopcornPlusWalletByUserId(userId,plusPopcorn);
		      System.out.println("지갑에넣음");
	        
	        return "redirect:/Admin/Userdetail";
	    }
	    @PostMapping("/MinusPopcorn")
	    public String  deductPopcorn(
	    		@RequestParam String userId,
	            @RequestParam String content,
	            @RequestParam int minusPopcorn) {

	    	 adminMapper.PopcornMinusLogByUserId(userId,content,minusPopcorn);
	    	  System.out.println("로그추가");
	    	 adminMapper.PopcornMinusWalletByUserId(userId,minusPopcorn);
	    	 System.out.println("지갑에넣음");
	        
	    	 return "redirect:/Admin/Userdetail";
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
	
}