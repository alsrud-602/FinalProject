package com.board.companys.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.companys.dto.LoginRequest;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping
@RequiredArgsConstructor
public class RestCompanySignController {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;
    private final Logger logger = LoggerFactory.getLogger(RestCompanySignController.class);
    

    
    @PostMapping("/CompanyAuth/Login")
    public ResponseEntity<Map<String, String>> login(@RequestBody LoginRequest loginRequest, HttpServletResponse response) {
        try {
            Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getId(), loginRequest.getPassword())
            );
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();

            // 역할(Role) 확인
            boolean isCompanyRole = userDetails.getAuthorities().stream()
                .anyMatch(authority -> "ROLE_COMPANY".equals(authority.getAuthority()));
            
            if (!isCompanyRole) {
                logger.info("로그인 실패: company 역할이 아님");
                return ResponseEntity.status(HttpStatus.FORBIDDEN)
                                     .body(Map.of("error", "Not authorized for company role"));
            }
            logger.info("인증 성공: {}", authentication);

            SecurityContextHolder.getContext().setAuthentication(authentication);

            String jwt = jwtUtil.generateToken(authentication.getName(),"company", false);
            logger.info("JWT 생성 성공: {}", jwt);
            // JWT를 쿠키에 저장
            Cookie jwtCookie = new Cookie("companyJwt", jwt);
            jwtCookie.setHttpOnly(true);
            jwtCookie.setSecure(true); // HTTPS에서만 사용
            jwtCookie.setMaxAge(60 * 60 * 10); // 10시간
            jwtCookie.setPath("/Business");
            response.addCookie(jwtCookie);

            return ResponseEntity.ok(Map.of("companyJwt", jwt));
        } catch (Exception e) {
            logger.error("인증 실패: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                                 .body(Map.of("error", "Authentication failed"));
        }
    }

 

}
