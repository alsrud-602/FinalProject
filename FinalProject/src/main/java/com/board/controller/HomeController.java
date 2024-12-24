package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class HomeController {

	@Autowired
    private RedisTemplate<String, String> redisTemplate;
	// http://localhost:9090
	@RequestMapping("/")
	public  String   home(HttpServletRequest request, HttpServletResponse response) {
		
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if ("temp_token".equals(cookie.getName())) {
	                String tempToken = cookie.getValue();
	                String jwt = redisTemplate.opsForValue().get(tempToken);
	                if (jwt != null) {
	                    // JWT를 쿠키에 저장
	                    Cookie jwtCookie = new Cookie("token", jwt);
	                    jwtCookie.setHttpOnly(true);
	                    jwtCookie.setSecure(true);
	                    jwtCookie.setPath("/");
	                    jwtCookie.setMaxAge(7 * 24 * 60 * 60); // 7일
	                    response.addCookie(jwtCookie);

	                    // 임시 토큰 삭제
	                    redisTemplate.delete(tempToken);
	                    cookie.setMaxAge(0);
	                    response.addCookie(cookie);

	                    break;
	                }
	            }
	        }
	    }
		return "home";
		//return "/WEB-INF/views/home.jsp";
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
	
	


	
	
	@RequestMapping("/Business")
	public String businesshome() {
		return "business/operation/operation";

	}

	@RequestMapping("/Operation")
	public String operationform() {
		return "business/operation/operation";

	}


	
}