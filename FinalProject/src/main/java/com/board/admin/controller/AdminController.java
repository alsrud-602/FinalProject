package com.board.admin.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.admin.mapper.AdminMapper;
import com.board.admin.vo.AdminVo;
import com.board.users.vo.PopcornVo;

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
	public String userDetail(@RequestParam("id") String userId , Model model) {
		
		
		
		
		//유저 정보 (USERS 테이블)
		List<AdminVo> userinfo = adminMapper.getUserinfo(userId);
		System.out.println("유저정보:"+ userinfo);
		
		//총 팝콘량 조회
		int totPopCorn = adminMapper.getTotalPopcorn(userId);
		System.out.println("총 팝콘량:"+ totPopCorn);
		
		// 팝콘 지급 량 
		int earn = adminMapper.getPopcornEarnLogByUserId(userId);
		System.out.println("팝콘 지급량:"+earn);
		
		// 팝콘 사용 량
		int spented = adminMapper.getPopcornSpentedLogByUserId(userId);
		System.out.println("팝콘 사용량:"+spented);
		
        // 팝콘 지급/사용 내역 조회 (전체)
		List<AdminVo> wallet = adminMapper.getPopcornLogByUserId(userId);
		System.out.println("팝콘 지급/사용 내역:"+wallet);
		
        // 모델에 데이터 추가
		model.addAttribute("userinfo", userinfo);
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
	            @RequestParam int plusPopcorn,
	            RedirectAttributes redirectAttributes) {
	        
		      adminMapper.PopcornPlusLogByUserId(userId,content,plusPopcorn);
		      System.out.println("로그추가");
		      adminMapper.PopcornPlusWalletByUserId(userId,plusPopcorn);
		      System.out.println("지갑에넣음");
		      
		      
		      redirectAttributes.addAttribute("id", userId);
		      
	        return "redirect:/Admin/Userdetail";
	    }
	
	  @PostMapping("/MinusPopcorn")
	  public String  deductPopcorn(
			  @RequestParam String userId,
			  @RequestParam String content,
			  @RequestParam int minusPopcorn,
			  RedirectAttributes redirectAttributes) {
		  
		  adminMapper.PopcornMinusLogByUserId(userId,content,minusPopcorn);
		  System.out.println("로그추가");
		  adminMapper.PopcornMinusWalletByUserId(userId,minusPopcorn);
		  System.out.println("지갑에넣음");
		  
		  redirectAttributes.addAttribute("id", userId);
		  
		  return "redirect:/Admin/Userdetail";
	  }
	
	    @PostMapping("/PlusPopcorns")
	    public String givePopcorn(
	            @RequestParam String content, 
	            @RequestParam int points, 
	            @RequestParam String userIds,
	            RedirectAttributes redirectAttributes) {
	        
	        // userIds는 콤마로 구분된 문자열이므로, 이를 배열로 변환
	        String[] userIdArray = userIds.split(",");

	        Map<String, Object> params = new HashMap<>();
	        params.put("content", content);
	        params.put("points", points);
	        params.put("users", userIdArray);
	        
	        String[] users = (String[]) params.get("users");
	        String content1 = (String) params.get("content");
	        int points1 = (int) params.get("points");

	      try {
	        for (String user : users) {
	            adminMapper.PopcornPlusLogs(content1, points1, user);
	        }
	        adminMapper.PlusPopcorns(params);
	        redirectAttributes.addFlashAttribute("message", "팝콘 지급이 완료되었습니다.");
	      } catch (Exception e) {
	          // 오류 메시지 추가
	          redirectAttributes.addFlashAttribute("message", "팝콘 지급이 실패했습니다.");
	      }
	        return "redirect:/Admin/User";
	    }
	    
	    @PostMapping("/MinusPopcorns")
	    public String subtractPopcorn(
	            @RequestParam String content2,
	            @RequestParam int points2,
	            @RequestParam String userIds2,
	            RedirectAttributes redirectAttributes) {

	        // userIds2는 콤마로 구분된 문자열이므로, 이를 배열로 변환
	        String[] userIdArray = userIds2.split(",");

	        Map<String, Object> params = new HashMap<>();
	        params.put("content", content2);
	        params.put("points", points2);
	        params.put("users", userIdArray);

	        String[] users = (String[]) params.get("users");
	        String content1 = (String) params.get("content");
	        int points1 = (int) params.get("points");

	      try {
	        for (String user : users) {
	            adminMapper.PopcornMinusLogs(content1, points1, user);   
	        }
	        adminMapper.MinusPopcorns(params); 
	        redirectAttributes.addFlashAttribute("message", "팝콘 차감이 완료되었습니다.");
	      } catch (Exception e) {
	          // 오류 메시지 추가
	          redirectAttributes.addFlashAttribute("message", "팝콘 차감이 실패했습니다.");
	      }
	        return "redirect:/Admin/User";  // 유저 관리 페이지로 리다이렉트
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