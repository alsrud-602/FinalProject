package com.board.business.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.users.dto.User;
import com.board.users.jwt.JwtUtil;
import com.board.users.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/Companys")
public class CompanySignController {

    @Autowired
    private UserService userService;
    
    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    public CompanySignController(AuthenticationManager authenticationManager, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }
    
	/* 회원가입 */
    @GetMapping("/SignupForm")
    public String signupForm() {
        return "business/signup"; // 회원가입 폼 JSP 페이지로 이동
    }

    //날짜 변환
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, "birthdate", new CustomDateEditor(dateFormat, true));
    }
    @PostMapping("/Signup")
    public String registerUser(@ModelAttribute User user) {
        userService.registerUser(user);
        return "redirect:/Companys/LoginForm";
    }
    
    /* 로그인/로그아웃 */
	@RequestMapping("/LoginForm")
	public  String   loginform() {
		return "business/login";
	}
	/*
    @GetMapping("/Login/{id}")
    public User getUser(@PathVariable String id) {
        return userService.findByUserId(id)
                .orElseThrow(() -> new RuntimeException("사용자를 찾을 수 없습니다."));
    }
    */

	@PostMapping("/Logout")
	public ResponseEntity<String> logout() {
	    SecurityContextHolder.clearContext();
	    return ResponseEntity.ok("Logout successful");
	}
    
    

}
