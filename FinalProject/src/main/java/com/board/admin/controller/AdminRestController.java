package com.board.admin.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.admin.mapper.AdminMapper;
import com.board.admin.mapper.StoreMapper;
import com.board.users.dto.User;
import com.board.users.dto.UsersDto;
import com.board.users.service.UserService;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/Admin")
public class AdminRestController {
	
	
	@Autowired
	private AdminMapper adminMapper;

	@Autowired
	private StoreMapper storeMapper;
	
    @Autowired
    private HttpServletRequest request;
	
    
    @Autowired
    private UserService userService;
    
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
    
    
    @GetMapping("/getPopupList")
    public List<Map<String, UsersDto>> getPopuplist(Model model) {
        //List<Map<String, Object>> popuplist = new ArrayList<>();

        // 예시 데이터
        
        List<Map<String,UsersDto>> popuplist = storeMapper.getStoreListByCity();
        model.addAttribute("popuplist",popuplist);

        return popuplist;
    }
    

}
    

