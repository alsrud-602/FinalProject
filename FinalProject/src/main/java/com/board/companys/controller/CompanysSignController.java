package com.board.companys.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.companys.dto.Company;
import com.board.companys.service.CompanyService;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/CompanyAuth")
public class CompanysSignController {

    @Autowired
    private CompanyService companyService;
    
    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    public CompanysSignController(AuthenticationManager authenticationManager, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }
    
	/* 회원가입 */
    @GetMapping("/SignupForm")
    public String signupForm(@RequestParam(required = false) String email, Model model) {
        model.addAttribute("email", email);
        return "business/signup";
    }
    @GetMapping( "/CheckDuplication" )
    @ResponseBody
    public String checkDuplication(@RequestParam(value="id") String id ) {
      
       Optional<Company> company = companyService.findByUserId(id);
        if (company.isEmpty()) {
            return "가능";  // 아이디가 존재하지 않으면 가능
        }
        return "불가능";  // 아이디가 존재하면 불가능
    }
    
    @PostMapping("/Signup")
    public String registerUser(@ModelAttribute Company company) {
    	companyService.registerUser(company);
        return "redirect:/CompanyAuth/LoginForm";
    }
    /*========================================================*/
    
    /* 로그인/로그아웃 */
	@RequestMapping("/LoginForm")
	public  String   loginform() {
		return "business/login";
	}
	

	@PostMapping("/Logout")
	public ResponseEntity<String> logout(HttpServletResponse response) {
	    Cookie jwtCookie = new Cookie("token", null);
	    jwtCookie.setHttpOnly(true);
	    jwtCookie.setSecure(true);
	    jwtCookie.setPath("/");
	    jwtCookie.setMaxAge(0); // 쿠키 만료
	    response.addCookie(jwtCookie);
	    SecurityContextHolder.clearContext();
	    return ResponseEntity.ok().build();
	}
	
	
	
	
    
    

}
