package com.board.users.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.jwt.JwtUtil;
import com.board.users.dto.User;
import com.board.users.service.UserService;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.security.SignatureException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users")
public class UserSignController {

    @Autowired
    private UserService userService;
    
    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    public UserSignController(AuthenticationManager authenticationManager, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }
    
	/* 회원가입 */
    @GetMapping("/SignupForm")
    public String signupForm(@RequestParam(required = false) String email, Model model) {
        model.addAttribute("email", email);
        return "signup";
    }
    @GetMapping( "/CheckDuplication" )
    @ResponseBody
    public String checkDuplication(@RequestParam(value="id") String id ) {
      
       Optional<User> user = userService.findByUserId(id);
        if (user.isEmpty()) {
            return "가능";  // 아이디가 존재하지 않으면 가능
        }
        return "불가능";  // 아이디가 존재하면 불가능
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
        return "redirect:/Users/LoginForm";
    }
    /*========================================================*/
    
    /* 로그인/로그아웃 */
	@RequestMapping("/LoginForm")
	public  String   loginform() {
		return "login";
	}
	@GetMapping("/KakaoCallBack")
	public String kakaoCallBack(HttpSession session, HttpServletResponse response, Model model) {
	    String jwt = (String) session.getAttribute("jwt");
	    String accessToken = (String) session.getAttribute("accessToken");

	    session.removeAttribute("jwt");
	    session.removeAttribute("accessToken");

	    // JWT를 응답 헤더에 추가
	    response.setHeader("Authorization", "Bearer " + jwt);

	    // 필요한 작업 수행
	    model.addAttribute("jwt", jwt);
	    model.addAttribute("accessToken", accessToken);

	    return "callback"; // 반환할 뷰 이름
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
	
	@GetMapping("/user-info")
	public String getUserInfo(
	        @RequestHeader("Authorization") String authorization,
	        @RequestHeader("Token-Type") String tokenType,
	        Model model) {

	    System.out.println("Authorization 헤더: " + authorization);
	    System.out.println("Token-Type 헤더: " + tokenType);

	    if (authorization == null || authorization.isEmpty()) {
	        model.addAttribute("error", "토큰이 제공되지 않았습니다.");
	        return "error"; // 에러 페이지로 이동
	    }

	    try {
	        // "Bearer {jwt}" 형태에서 JWT 추출
	        String jwt = authorization.startsWith("Bearer ") ? authorization.substring(7) : authorization;

	        if ("UserToken".equals(tokenType)) {
	            // 일반 사용자 토큰 처리
	            return processUserToken(jwt, model);
	        } else if ("KakaoToken".equals(tokenType)) {
	            // 카카오 사용자 토큰 처리
	            return processKakaoToken(jwt, model);
	        } else {
	            model.addAttribute("error", "알 수 없는 토큰 타입입니다.");
	            return "error";
	        }
	    } catch (Exception e) {
	        model.addAttribute("error", "인증 실패: " + e.getMessage());
	        return "error"; // 인증 실패 시 에러 페이지
	    }
	}

	private String processUserToken(String jwt, Model model) throws Exception {
	    System.out.println("일반 사용자 토큰 처리: " + jwt);

	    // JWT에서 사용자 ID 추출
	    String id = jwtUtil.extractUsername(jwt);

	    // 사용자 정보 가져오기
	    Optional<User> userOptional = userService.findByUserId(id);
	    if (userOptional.isEmpty()) {
	        model.addAttribute("error", "사용자 정보를 찾을 수 없습니다.");
	        return "error";
	    }

	    // 사용자 정보를 모델에 추가
	    model.addAttribute("user", userOptional.get()); //user테이블 전체 가져오는 거

	    return "users/usersMain/main"; //정보를 보여줄 페이지
	}

	private String processKakaoToken(String jwt, Model model) {
	    try {
	        System.out.println("카카오 사용자 토큰 처리: " + jwt);

	        // 카카오 JWT에서 사용자 ID 추출
	        String id = jwtUtil.extractUsername(jwt);

	        // 사용자 정보 가져오기
	        Optional<User> userOptional = userService.findBySocialId(id);
	        System.out.println("카카오 정보: " + userOptional);

	        if (userOptional.isEmpty()) {
	            model.addAttribute("error", "사용자 정보를 찾을 수 없습니다.");
	            return "error";
	        }

	        // 사용자 정보를 모델에 추가
		    model.addAttribute("user", userOptional.get()); //user테이블 전체 가져오는 거

	        return "users/usersMain/main";//정보를 보여줄 페이지

	    } catch (ExpiredJwtException e) {
	        System.err.println("토큰 만료: " + e.getMessage());
	        model.addAttribute("error", "토큰이 만료되었습니다.");
	    } catch (MalformedJwtException e) {
	        System.err.println("잘못된 토큰: " + e.getMessage());
	        model.addAttribute("error", "잘못된 토큰 형식입니다.");
	    } catch (SignatureException e) {
	        System.err.println("서명 불일치: " + e.getMessage());
	        model.addAttribute("error", "토큰 서명이 일치하지 않습니다.");
	    } catch (Exception e) {
	        System.err.println("예상치 못한 오류: " + e.getMessage());
	        e.printStackTrace(); // 예외의 스택 트레이스를 출력하여 어떤 오류가 발생했는지 확인
	        model.addAttribute("error", "알 수 없는 오류가 발생했습니다.");
	    }

	    // 에러 페이지 반환
	    return "error";
	}


}
