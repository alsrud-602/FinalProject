package com.board.controller;

import java.util.List;	
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.admin.dto.Banner;
import com.board.admin.mapper.BannerMapper;
import com.board.users.dto.User;
import com.board.users.dto.UsersDto;
import com.board.users.mapper.UsersMapper;
import com.board.users.service.UserService;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

   @Autowired
   private UsersMapper usersMapper;
   
   @Autowired
   private UserService userService;
   
   @Autowired
   private JwtUtil jwtUtil;
   
   @Autowired
   private BannerMapper bannerMapper;
   
   // http://localhost:9090
   @RequestMapping("/")
	public ModelAndView home(			
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "6") int size,
			Model model,HttpServletRequest request) {
		
		// 유저 번호 가지고 오기
		 Cookie[] cookies = request.getCookies();
	        String jwtToken = null;
	        boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

	        if (cookies != null) {
	            for (int i = cookies.length - 1; i >= 0; i--) {
	                Cookie cookie = cookies[i];
	                if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
	                    jwtToken = cookie.getValue();
	                    System.out.println("토큰1 : " +jwtToken );
	                    if ("kakaoAccessToken".equals(cookie.getName())) {
	                        isKakaoUser = true;  // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
	                    }
	                    System.out.println("토큰: " + jwtToken);
	                    break; 
	                }
	            }
	        }

	        if (jwtToken != null) {
	            String username = jwtUtil.extractUsername(jwtToken);
	            System.out.println("사용자 정보1: " + username);

	            if (isKakaoUser) {
	                Optional<User> kakaouser = userService.findBySocialId(username);  // 카카오 소셜 ID로 사용자 조회
	                System.out.println("카카오 사용자 정보: " + kakaouser);
	                model.addAttribute("user", kakaouser.orElse(null));  // 카카오 사용자가 없을 경우 null 반환
	            } else {
	                // 일반 사용자라면 기존 방식으로 사용자 조회
	                Optional<User> user = userService.getUserByUsername(username);  // DB에서 사용자 정보 조회
	                System.out.println("사용자 정보: " + user);
	                model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
	            }
	        } else {
	            model.addAttribute("error", "JWT 토큰이 없습니다.");
	        }

	        
		// 페이징용
		 int start = (page - 1) * size; 
		 int totalPosts = usersMapper.getOngoingcount();
		 int totalPages = (int) Math.ceil((double) totalPosts / size);
		 System.out.println("totalPosts : " + totalPosts);
		 System.out.println("totalPages : " + totalPages);

		//랭킹 팝업
		 List<UsersDto> ranklist = usersMapper.getRanklist();
		 System.out.println("ranklist : " + ranklist);

		 // 이미지 경로 수정
		 for (UsersDto dto : ranklist) {
		     String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
		     dto.setImage_path(imagePath); // 수정된 경로 다시 설정
		     System.out.println("수정된 이미지 패스 : " + imagePath);
		 }

		 System.out.println("최종 수정된 ranklist : " + ranklist);
		
		
		// 팝업 오픈예정
		List<UsersDto> opendpopuplist = usersMapper.getOpendpopuplist();
		// 이미지 경로 수정
		for (UsersDto dto : opendpopuplist) {
		     String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
			dto.setImage_path(imagePath); // 수정된 경로 다시 설정
		    System.out.println("수정된 이미지 패스 : " + imagePath);
		}
		
		// 팝업 진행중
		List<UsersDto> popuplist = usersMapper.getPopuppaginglist(start,size);
		// 이미지 경로 수정
		for (UsersDto dto : popuplist) {
		     String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
			dto.setImage_path(imagePath); // 수정된 경로 다시 설정
		    System.out.println("수정된 이미지 패스 : " + imagePath);
		}
		List<Banner> banners = bannerMapper.getAllBanners(); // BANNER 테이블에서 모든 배너 정보를 가져오는 메소드
        model.addAttribute("banners", banners);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("opendpopuplist",opendpopuplist);
		mv.addObject("totalPages", totalPages);
		mv.addObject("currentPage", page);
		mv.addObject("ranklist",ranklist);
		mv.addObject("ranklist",ranklist);
		mv.addObject("popuplist",popuplist);
		mv.setViewName("users/usersMain/main");
		return mv;
	}
   

   @RequestMapping("/Ho")
   public  String   test() {
      return "admin/user/user";
      

      //return "/WEB-INF/views/home.jsp";
   }

   

   
}