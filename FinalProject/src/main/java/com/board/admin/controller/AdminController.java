package com.board.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.admin.dto.AdminVo;
import com.board.admin.mapper.AdminMapper;
import com.board.admin.mapper.StoreMapper;
import com.board.users.dto.User;
import com.board.users.dto.UsersDto;
import com.board.users.mapper.UsersMapper;
import com.board.users.service.UserService;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	

	/*모든 메소드에 MFA인증확인 넣으신 분... 매우 센스 있으십니다!짱짱👍👍*/
	
	
	@Autowired
	private AdminMapper adminMapper;

	@Autowired
	private StoreMapper storeMapper;
	
    @Autowired
    private HttpServletRequest request;
	
    
    @Autowired
    private UserService userService;
    @Autowired
    private UsersMapper usersMapper;
    
    @Autowired
    private JwtUtil jwtUtil;
    
    private Optional<User> getJwtTokenFromCookies(HttpServletRequest request, Model model) {
    	// 유저 번호 가지고 오기
   	 Cookie[] cookies = request.getCookies();
          String jwtToken = null;

          if (cookies != null) {
              for (int i = cookies.length - 1; i >= 0; i--) {
                  Cookie cookie = cookies[i];
                  if ("adminjwt".equals(cookie.getName())) {
                      jwtToken = cookie.getValue();
                      System.out.println("토큰1 : " +jwtToken );
                      break; 
                  }
              }
          }
          
          Optional<User> user= null;

          if (jwtToken != null) {
              String username = jwtUtil.extractUsername(jwtToken);
              System.out.println("사용자 정보1: " + username);

                  // 일반 사용자라면 기존 방식으로 사용자 조회
                  user = userService.getUserByUsername(username);  // DB에서 사용자 정보 조회
                  System.out.println("사용자 정보: " + user);
                  model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
              } else {
              model.addAttribute("error", "JWT 토큰이 없습니다.");
          }
          return user;
    }
    
    
    // MFA 인증 확인
    private boolean isMfaAuthenticated(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Boolean mfaAuthenticated = (Boolean) session.getAttribute("mfaAuthenticated");
            //Model model = model.addAttribute(userService.get);
            return mfaAuthenticated != null && mfaAuthenticated;
        }
        return false;
    }

    
	// http://localhost:9090
	// 유저관리
	@RequestMapping("/User")
	public  ModelAndView  user(HttpServletResponse response, Model model) throws Exception {
		
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa"); 
            return null;
        }
		
		List<AdminVo> allusers = adminMapper.getalluserinfo();
		
		System.out.println(allusers);
        Optional<User> user=null;
        user = getJwtTokenFromCookies(request, model);
        model.addAttribute("user", user.orElse(null));
		ModelAndView mv = new ModelAndView();
		mv.addObject("allusers", allusers);
		mv.setViewName("/admin/user/user");
		return mv;
	}
	
	//유저관리 상세
    // 유저관리 상세
    @RequestMapping("/Userdetail")
    public String userdetail(HttpServletResponse response, Model model, @RequestParam("id") String userId) throws Exception {
    	// 에러 떠서 일단 mav -> String 으로 바꿔놓은 상태.
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa"); 
            return null; 
        }
        Optional<User> user=null;
        user = getJwtTokenFromCookies(request, model);
        model.addAttribute("user", user.orElse(null));
		//전체 좋아요 정보(REVUEW 테이블)
		List<AdminVo> allreview = adminMapper.getallReview();
		System.out.println("모든 리뷰:"+allreview);
		
		//유저IDX 추출
		String selUserId = adminMapper.getUserIdx(userId);
		System.out.println("idx:"+ selUserId);
		
		//유저 좋아요 정보(REVIEW 테이블)
		List<AdminVo> userreview = adminMapper.getUserReview(selUserId);
		System.out.println("userreview:"+ userreview);
		
		// 유저가 받은 좋아요 (그래프 에 사용) 
		int targetLikes = 0;
		for (AdminVo review : userreview) {
		    targetLikes += review.getLIKE();  // 유저가 받은 좋아요 수
		}

		int totalLikes = 0;
		for (AdminVo review : allreview) {
		    totalLikes += review.getLIKE();  // 전체 좋아요 수
		}
		
		float percentuser = (float) targetLikes / totalLikes * 100;  // 비율 계산
		

		//모든 리뷰 idx 랑 좋아요수 
		Map<Integer, Integer> userLikes = new HashMap<>();
		for (AdminVo review : allreview) {
		    int alluseridx = (int) review.getUser_idx();  // 유저 ID 추출
		    int likes = review.getLIKE();        // 해당 유저의 좋아요 수
		    userLikes.put(alluseridx, userLikes.getOrDefault(alluseridx, 0) + likes); // 좋아요 합산
		}
		System.out.println("1:"+userLikes);
		
		// 좋아요 내림차순 
		List<Map.Entry<Integer, Integer>> sortedUserLikes = new ArrayList<>(userLikes.entrySet());
		sortedUserLikes.sort((entry1, entry2) -> entry2.getValue().compareTo(entry1.getValue())); // 내림차순 정렬
		System.out.println("2: " + sortedUserLikes); 
		
		//  순위 매기기
		Map<Integer, Integer> userRanks = new HashMap<>();
		int rank = 1;
		for (Entry<Integer, Integer> entry : sortedUserLikes) {
		    userRanks.put(entry.getKey(), rank++);
		}
		System.out.println("3:"+userRanks);
		
		// 해당 유저 순위를 가져오기
		int userRank = userRanks.getOrDefault(Integer.parseInt(selUserId), 0);
		System.out.println("4:"+userRank);
		
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
		model.addAttribute("userRank", userRank);
		model.addAttribute("percentuser", percentuser);
		model.addAttribute("totalLikes", totalLikes);
		model.addAttribute("targetLikes", targetLikes);
		model.addAttribute("allreview", allreview);
		model.addAttribute("userreview", userreview);
		model.addAttribute("userinfo", userinfo);
		model.addAttribute("totPopCorn", totPopCorn);
		model.addAttribute("earn", earn);
		model.addAttribute("spented", spented);
        model.addAttribute("userId", userId);
        model.addAttribute("wallet", wallet);

        return "/admin/user/userdetail"; // 수정 가능한 폼으로 연결
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
	            RedirectAttributes redirectAttributes, Model model) {
	        
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
	            RedirectAttributes redirectAttributes, Model model) {

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

	    
    @RequestMapping("/M1")
    public ModelAndView M1(HttpServletResponse response, Model model) throws Exception {
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa"); 
            return null; 
        }
        Optional<User> user=null;
        user = getJwtTokenFromCookies(request, model);
        model.addAttribute("user", user.orElse(null));

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/manager/detail");
        return mv;
    }

    // 스토어관리 - 담당자관리
    @RequestMapping("/Managerlist")
    public ModelAndView managerlist(HttpServletResponse response, Model model) throws Exception {
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa"); 
            return null; 
        }
        Optional<User> user=null;
        user = getJwtTokenFromCookies(request, model);
        model.addAttribute("user", user.orElse(null));

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/manager/managerlist");
        return mv;
    }

    @RequestMapping("/Advertise")
    public ModelAndView advertise(HttpServletResponse response, Model model) throws Exception {
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa");
            return null; 
        }
        Optional<User> user=null;
        user = getJwtTokenFromCookies(request, model);
        model.addAttribute("user", user.orElse(null));

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/manager/advertise");
        return mv;
    }

    @RequestMapping("/Dashboard")
    public String adminhome(HttpServletResponse response, Model model) throws Exception {
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa"); 
            return null; 
        }
        
        Optional<User> user=null;
        user = getJwtTokenFromCookies(request, model);
        model.addAttribute("user", user.orElse(null));

        return "admin/dashboard/dashboard";
    
    }
    
    /* 스토어리스트 */
    @RequestMapping("/Store/List")
    public String storeList(HttpServletResponse response, Model model) throws Exception {
    	// MFA 인증 확인
    	if (!isMfaAuthenticated(request)) {
    		response.sendRedirect("/Users/2fa");
    		return null; 
    	}
    	
    	Optional<User> user=null;
    	user = getJwtTokenFromCookies(request, model);
    	model.addAttribute("user", user.orElse(null));
    	
        int totalUsers = adminMapper.getTotalUsers();
        Map<String, Integer> stats = adminMapper.getMonthlyStats();

        int currentMonth = stats.getOrDefault("current_month_count", 0);
        int previousMonth = stats.getOrDefault("previous_month_count", 0);
        double growthRate = previousMonth == 0 ? 0 : ((double) (currentMonth - previousMonth) / previousMonth) * 100;

        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("currentMonth", currentMonth);
        model.addAttribute("growthRate", growthRate);

        int totalStores = adminMapper.getTotalStores();
        Map<String, Integer> statsStores = adminMapper.getMonthlyStatsByStores();
        int currentStoreMonth = stats.getOrDefault("current_month_count", 0);
        int previousStoreMonth = stats.getOrDefault("previous_month_count", 0);
        double growthStoreRate = previousStoreMonth == 0 ? 0 : ((double) (currentStoreMonth - previousStoreMonth) / previousStoreMonth) * 100;
        model.addAttribute("totalStores", totalStores);
        model.addAttribute("growthStoreRate", growthStoreRate);
        
        int popupListCount = adminMapper.getPopuplistCount();
        
        model.addAttribute("popupListCount", popupListCount);
    	
    	return "admin/store/list";
    	
    }
    /*============================================================*/
    
    @RequestMapping("/Search")
    public ModelAndView searchFeatures(@RequestParam String query) {
        // 검색어에 따라 이동할 경로 결정
        String redirectUrl;
        ModelAndView mv = new ModelAndView();
        // 예시: 검색어에 따라 다른 경로로 이동
        switch (query.toLowerCase()) {
            case "기능1":
                redirectUrl = "/feature1";
                break;
            case "기능2":
                redirectUrl = "/feature2";
                break;
            case "기능3":
                redirectUrl = "/feature3";
                break;
            case "기능4":
                redirectUrl = "/feature4";
                break;
            default:
                redirectUrl = "/not-found"; // 기능이 없을 경우
                break;
        }
        mv.setViewName("redirect:"+redirectUrl);

        return mv;
    }
    

}
    

