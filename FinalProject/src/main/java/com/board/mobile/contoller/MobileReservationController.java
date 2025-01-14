package com.board.mobile.contoller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.business.dto.BookMarkListDto;
import com.board.business.dto.ReservationTimeSlotDto;
import com.board.business.dto.ReservationUserDto;
import com.board.business.dto.StoreAddNoteDto;
import com.board.business.dto.StoreListDto;
import com.board.business.dto.WaitingDto;
import com.board.business.mapper.WatingMapper;
import com.board.business.service.WaitingService;
import com.board.users.dto.User;
import com.board.users.mapper.UsersMapper;
import com.board.users.service.UserService;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Mobile/Reservation")
public class MobileReservationController {
   
   @Autowired
   private UsersMapper usersMapper;
   
	@Autowired
	private WaitingService waitingService;
   @Autowired
   private UserService userService;
   @Autowired
   private WatingMapper watingMapper;
   
   @Autowired
      private JwtUtil jwtUtil;
  
   // 현장대기 예약 화면
   @RequestMapping("/OnSite")
   public ModelAndView OnSite(         
         Model model,HttpServletRequest request , @RequestParam("store_idx") int store_idx, @RequestParam("store_idx") int user_idx) {
      
       Cookie[] cookies = request.getCookies();
       String jwtToken = null;
       boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

       if (cookies != null) {
           for (int i = cookies.length - 1; i >= 0; i--) {
               Cookie cookie = cookies[i];
               if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
                   jwtToken = cookie.getValue();
                   if ("kakaoAccessToken".equals(cookie.getName())) {
                       isKakaoUser = true;  // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
                   }
                   System.out.println("토큰: " + jwtToken);
                   break; 
               }
           }
       }
       Long useruseridx = null;
       if (jwtToken != null) {
           String username = jwtUtil.extractUsername(jwtToken);
           System.out.println("사용자 정보1: " + username);

           if (isKakaoUser) {
               // 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
               Optional<User> kakaouser = userService.findBySocialId(username);  // 카카오 소셜 ID로 사용자 조회
               System.out.println("카카오 사용자 정보: " + kakaouser);
               model.addAttribute("user", kakaouser.orElse(null));  // 카카오 사용자가 없을 경우 null 반환
               useruseridx = kakaouser.get().getUserIdx();
           } else {
               // 일반 사용자라면 기존 방식으로 사용자 조회
               Optional<User> user = userService.getUserByUsername(username);  // DB에서 사용자 정보 조회
               System.out.println("사용자 정보: " + user);
               model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
               useruseridx = user.get().getUserIdx();
           }
       } else {
           model.addAttribute("error", "JWT 토큰이 없습니다.");
       }
       
       //int user_idx = useruseridx.intValue();
        
    	ModelAndView mv = new ModelAndView();
    	StoreAddNoteDto anDTO = waitingService.getStoreAddressNote(store_idx);
    	System.out.println("!!!!!!!값 anDto"+ anDTO);
    	mv.addObject("anDTO",anDTO);
    	mv.addObject("user_idx",user_idx);
	   	mv.setViewName("mobile/onsite");
        return mv;
   }
   
	@RequestMapping("/User/List")
	public ModelAndView UserList(Model model,HttpServletRequest request) {		
      
	       Cookie[] cookies = request.getCookies();
	       String jwtToken = null;
	       boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

	       if (cookies != null) {
	           for (int i = cookies.length - 1; i >= 0; i--) {
	               Cookie cookie = cookies[i];
	               if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
	                   jwtToken = cookie.getValue();
	                   if ("kakaoAccessToken".equals(cookie.getName())) {
	                       isKakaoUser = true;  // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
	                   }
	                   System.out.println("토큰: " + jwtToken);
	                   break; 
	               }
	           }
	       }
	       Long useruseridx = null;
	       if (jwtToken != null) {
	           String username = jwtUtil.extractUsername(jwtToken);
	           System.out.println("사용자 정보1: " + username);

	           if (isKakaoUser) {
	               // 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
	               Optional<User> kakaouser = userService.findBySocialId(username);  // 카카오 소셜 ID로 사용자 조회
	               System.out.println("카카오 사용자 정보: " + kakaouser);
	               model.addAttribute("user", kakaouser.orElse(null));  // 카카오 사용자가 없을 경우 null 반환
	               useruseridx = kakaouser.get().getUserIdx();
	           } else {
	               // 일반 사용자라면 기존 방식으로 사용자 조회
	               Optional<User> user = userService.getUserByUsername(username);  // DB에서 사용자 정보 조회
	               System.out.println("사용자 정보: " + user);
	               model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
	               useruseridx = user.get().getUserIdx();
	           }
	       } else {
	           model.addAttribute("error", "JWT 토큰이 없습니다.");
	       }
	       
	    //int user_idx = useruseridx.intValue();				
		int user_idx = 100;
        
	   	WaitingDto wDTO =waitingService.getUserWaiting(user_idx);
	   	List<WaitingDto> wList = waitingService.getUserWaitingList(user_idx);
	   	
	   	
	   	ModelAndView mv = new ModelAndView();
	   	mv.addObject("wList",wList);
	   	mv.addObject("wDTO",wDTO);
	   	mv.addObject("user_idx",user_idx);
	mv.setViewName("mobile/reservation/list");
	return mv;	
		
	}
   
	@RequestMapping("/Advance")
	public ModelAndView Advance(@RequestParam("store_idx") int store_idx, @RequestParam("store_idx") int user_idx) {
	ModelAndView mv = new ModelAndView();	
	List<ReservationTimeSlotDto> rDateList = waitingService.getadvanceDateList(store_idx);
	StoreListDto sDTO =  waitingService.getStoreShort(store_idx);
	List<StoreListDto> scDTOList =  waitingService.getStoreCategory(store_idx);

	mv.addObject("rDateList",rDateList);
	mv.addObject("store_idx",store_idx);
	mv.addObject("user_idx",user_idx);
	mv.addObject("store",sDTO);
	mv.addObject("categoryList",scDTOList);
	mv.setViewName("mobile/advance");	
	return mv;
	}
	
	@RequestMapping("/User/View")
	public ModelAndView UserView(int user_idx, int store_idx, int reservation_idx) {
	ModelAndView mv = new ModelAndView();	
	
	
	StoreAddNoteDto anDTO = waitingService.getStoreAddressNote(store_idx);
	ReservationUserDto ruDto =  waitingService.getadvanceUser(reservation_idx);
	System.out.println("!!!!!!!값 anDTO"+ anDTO);
	System.out.println("!!!!!!!값 reservation_idx"+ reservation_idx);
	System.out.println("!!!!!!!값 ruDto"+ ruDto);
	mv.addObject("anDTO",anDTO);
	mv.addObject("store",ruDto);
	mv.addObject("user_idx",user_idx);
	mv.setViewName("mobile/reservation/view");
	return mv;
	}
	
	@RequestMapping("/Profile/BookMark")
	public ModelAndView UserView(int user_idx) {
		ModelAndView mv = new ModelAndView();	
		List<BookMarkListDto> bmList = watingMapper.getBookMarkList(user_idx);
		
		System.out.println("!!!!!!!값 BookMarkList1"+ bmList);
		for (BookMarkListDto bookMarkListDto : bmList) {
			String imagePath =	bookMarkListDto.getImage_path().replace("\\", "/");
			bookMarkListDto.setImage_path(imagePath);			
		}
		
		System.out.println("!!!!!!!값 BookMarkList2"+ bmList);
		System.out.println("!!!!!!!값 user_idx"+ user_idx);
		mv.addObject("user_idx",user_idx);
		mv.addObject("BookMarkList",bmList);
		mv.setViewName("mobile/profile/bookmark");
		return mv;
	}
   
}