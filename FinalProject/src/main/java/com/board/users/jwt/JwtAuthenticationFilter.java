package com.board.users.jwt;

import java.io.IOException;
import java.util.Collections;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.SignatureException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtUtil jwtUtil;
    private final UserDetailsService userDetailsService;
    private final Logger logger = LoggerFactory.getLogger(JwtAuthenticationFilter.class);


    // Constructor to initialize JwtUtil and UserDetailsService
    public JwtAuthenticationFilter(JwtUtil jwtUtil, UserDetailsService userDetailsService) {
        this.jwtUtil = jwtUtil;
        this.userDetailsService = userDetailsService;
    }


	@Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        final String authorizationHeader = request.getHeader("Authorization");

        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {
            String jwt = authorizationHeader.substring(7);
            String username = jwtUtil.extractUsername(jwt);
            try {
                username = jwtUtil.extractUsername(jwt);
                if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
                    UserDetails userDetails = userDetailsService.loadUserByUsername(username);
                    System.out.println("필터 거침?"+userDetails);
                    
                    if (jwtUtil.validateToken(jwt, userDetails)) {
                        UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                        authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                        SecurityContextHolder.getContext().setAuthentication(authToken);
                        System.out.println("시큐리티 업데이트 완료"+authToken);
                    } else {
                        System.out.println("JWT 유효성 검사 실패");
                    }
                    logger.info("JWT 필터 통과, 사용자 정보: {}", username);
                }
            } catch (ExpiredJwtException e) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Token has expired");
                return;
            } catch (SignatureException e) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid token");
                return;
            }
        }

        if (SecurityContextHolder.getContext().getAuthentication() != null) {
            System.out.println("현재 SecurityContext 인증 정보: " + SecurityContextHolder.getContext().getAuthentication());
            System.out.println("Session ID: " + request.getSession(false));
            System.out.println("JWT 필터 경로: " + request.getServletPath());
            System.out.println("요청 헤더: " + Collections.list(request.getHeaderNames()));
            System.out.println("요청 파라미터: " + request.getParameterMap());
        } else {
            System.out.println("SecurityContext 인증 정보 없음 (익명 사용자)");
        }


        filterChain.doFilter(request, response);
    }
	
	@Override
	protected boolean shouldNotFilter(HttpServletRequest request) throws ServletException {
	    String path = request.getServletPath();
	    boolean shouldExclude = path.equals("/error") || path.startsWith("/css/") || path.startsWith("/images/") || path.startsWith("/img/") ||
	                            path.startsWith("/static/") || path.endsWith(".js") || path.startsWith("/Users/LoginForm") || path.startsWith("/Users/SignupForm") || path.startsWith("/Users/Signup");
	    //System.out.println("필터 제외 여부: " + shouldExclude + ", 경로: " + path);
	    logger.debug("필터 제외 여부: {}, 경로: {}", shouldExclude, path);
	    return shouldExclude;
	}




}
