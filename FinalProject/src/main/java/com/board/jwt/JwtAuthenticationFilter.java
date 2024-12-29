package com.board.jwt;

import java.io.IOException;
import java.util.Collections;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.SignatureException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class JwtAuthenticationFilter extends OncePerRequestFilter {

	private final JwtUtil jwtUtil;
	private final UserDetailsService userDetailsService;
	private final OAuth2UserService oAuth2UserService;
	private final Logger logger = LoggerFactory.getLogger(JwtAuthenticationFilter.class);

	// Constructor
	public JwtAuthenticationFilter(JwtUtil jwtUtil, UserDetailsService userDetailsService,  OAuth2UserService oAuth2UserService) {
		this.jwtUtil = jwtUtil;
		this.userDetailsService = userDetailsService;
		this.oAuth2UserService = oAuth2UserService;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		final String authorizationHeader = request.getHeader("Authorization");
		String jwt = null;

		// 1. Authorization 헤더가 없으면 쿠키에서 JWT 확인
		if (authorizationHeader == null) {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("token")) {
						jwt = cookie.getValue();
						break;
					}
				}
			}
		} else if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {

			jwt = authorizationHeader.substring(7);
			
			String username = jwtUtil.extractUsername(jwt);
			String userType = jwtUtil.extractUserType(jwt); // JWT에서 사용자 유형 추출
			try {
				if (request.getRequestURI().startsWith("/oauth2/callback")) {
				    processOAuth2Authentication(request, jwt);
				} else {
				    processJwtAuthentication(request, jwt);
				}

			} catch (ExpiredJwtException e) {
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Token has expired");
				return;
			} catch (SignatureException e) {
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid token");
				return;
			} catch (Exception e) {
				// 에러 로그 추가
				logger.error("JWT 필터 처리 중 오류 발생: {}", e.getMessage());
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Authentication Failed");
			}
		}

		// 2. JWT 검증
		/*
		 * if (jwt == null || !jwtUtil.validatableToken(jwt)) {
		 * response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // HTTP 401 상태 설정
		 * response.getWriter().write("Invalid Token"); // 응답 메시지 작성 (선택 사항) return; //
		 * 메서드 종료 }
		 */
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
		boolean shouldExclude = path.equals("/error") || path.startsWith("/static/")
				|| path.startsWith("/Users/LoginForm") || path.startsWith("/Users/SignupForm")
				|| path.startsWith("/Users/Signup") || path.startsWith("/Users/CheckDuplication")
				|| path.startsWith("/CompanyAuth/Signup") || path.startsWith("/CompanyAuth/SignupForm")
				|| path.startsWith("/CompanyAuth/LoginForm") || path.startsWith("/CompanyAuth/CheckDuplication");
		// System.out.println("필터 제외 여부: " + shouldExclude + ", 경로: " + path);
		logger.debug("필터 제외 여부: {}, 경로: {}", shouldExclude, path);
		return shouldExclude;
	}

	private String determineUserType(OAuth2User oauthUser) {
		// 예시: OAuth2 사용자 속성에서 역할을 기반으로 사용자 유형 결정
		String role = (String) oauthUser.getAttributes().get("role"); // 사용자 속성에서 역할을 추출

		if ("ROLE_ADMIN".equals(role)) {
			return "admin"; // 관리자
		} else if ("ROLE_COMPANY".equals(role)) {
			return "company"; // 회사 사용자
		} else {
			return "user"; // 기본값: 일반 사용자
		}
	}
	
	private void processOAuth2Authentication(HttpServletRequest request, String jwt) {
		logger.info("jwt",jwt);
	    try {
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            ClientRegistration clientRegistration = (ClientRegistration) session.getAttribute("clientRegistration");
	            OAuth2AccessToken accessToken = (OAuth2AccessToken) session.getAttribute("accessToken");

	            if (clientRegistration != null && accessToken != null) {
	                OAuth2User oauth2User = oAuth2UserService.loadUser(new OAuth2UserRequest(clientRegistration, accessToken));
	                if (jwtUtil.validateToken(jwt, oauth2User)) {
	                    UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
	                            oauth2User, null, oauth2User.getAuthorities());
	                    SecurityContextHolder.getContext().setAuthentication(authToken);
	                    authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
	                    session.removeAttribute("clientRegistration");
	                    session.removeAttribute("accessToken");
	                } else {
	                    throw new SignatureException("Invalid OAuth2 JWT");
	                }
	            }
	        }
	    } catch (Exception e) {
	        logger.error("OAuth2 인증 처리 중 오류 발생: {}", e.getMessage());
	    }
	}

	private void processJwtAuthentication(HttpServletRequest request, String jwt) {
	    try {
	        String username = jwtUtil.extractUsername(jwt);
	        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
	            UserDetails userDetails = userDetailsService.loadUserByUsername(username);
	            if (jwtUtil.validateToken(jwt, userDetails)) {
	                UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
	                        userDetails, null, userDetails.getAuthorities());
	                SecurityContextHolder.getContext().setAuthentication(authToken);
	                authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
	            } else {
	                throw new SignatureException("Invalid JWT");
	            }
	        }
	    } catch (Exception e) {
	        logger.error("JWT 인증 처리 중 오류 발생: {}", e.getMessage());
	    }
	}

}
