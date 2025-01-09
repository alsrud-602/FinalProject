package com.board.mobile.contoller;

import java.net.URI;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.board.exception.UserAlreadyLinkedToSocialException;
import com.board.exception.UserNotFoundOAuth2Exception;
import com.board.users.dto.LoginRequest;
import com.board.users.dto.User;
import com.board.users.dto.UsersDto;
import com.board.users.repo.UserRepository;
import com.board.users.service.CustomOAuth2UserService;
import com.board.users.service.UserService;
import com.board.util.JwtUtil;
import com.warrenstrange.googleauth.GoogleAuthenticator;
import com.warrenstrange.googleauth.GoogleAuthenticatorKey;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/Mobile")
@RequiredArgsConstructor
public class MobileRestUserSignController {

	private final AuthenticationManager authenticationManager;
	private final JwtUtil jwtUtil;
	private final Logger logger = LoggerFactory.getLogger(MobileRestUserSignController.class);

	@Value("${spring.security.oauth2.client.registration.kakao.client-id}")
	private String kakaoClientId;

	private String kakaoRedirectUri = "http://192.168.100.133:9090/oauth2/callback/kakao";

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CustomOAuth2UserService customOAuth2UserService;

	@Autowired
	private UserDetailsService userDetailsService; // UserDetailsService 주입

	@Autowired
	private UserService userService;

	@PostMapping("/Users/Login")
	public ResponseEntity<Map<String, String>> login(@RequestBody LoginRequest loginRequest,
			HttpServletResponse response, HttpSession session) {
		try {
			Authentication authentication = authenticationManager.authenticate(
					new UsernamePasswordAuthenticationToken(loginRequest.getId(), loginRequest.getPassword()));
			logger.info("인증 성공: {}", authentication);

			SecurityContextHolder.getContext().setAuthentication(authentication);

			// 관리자 여부 확인
			boolean isAdmin = authentication.getAuthorities().stream()
					.anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"));

			if (isAdmin) {
				// 관리자용 OTP 비밀 키 생성
				generateSecretKeyForAdmin(session);

				// 2FA를 위해 JWT 생성 (is2faAuthenticated=false)
				String jwt = jwtUtil.generateToken(authentication.getName(), "ADMIN", isAdmin);
				logger.info("관리자용 JWT 생성 성공: {}", jwt);
				session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());

				// JWT를 쿠키에 저장
				Cookie jwtCookie = new Cookie("adminjwt", jwt);
				jwtCookie.setHttpOnly(true);
				jwtCookie.setSecure(true); // HTTPS에서만 사용
				jwtCookie.setMaxAge(60 * 60 * 10); // 10시간
				jwtCookie.setPath("/");
				response.addCookie(jwtCookie);

				// 2FA 페이지로 리다이렉트
				return ResponseEntity.ok(Map.of("adminjwt", jwt, "redirect", "/Users/2fa"));
			}

			String jwt = jwtUtil.generateToken(authentication.getName(), "user", false);

			logger.info("JWT 생성 성공: {}", jwt);
			// JWT를 쿠키에 저장
			Cookie jwtCookie = new Cookie("userJwt", jwt);
			jwtCookie.setHttpOnly(false);
			jwtCookie.setSecure(false);
			jwtCookie.setMaxAge(60 * 60*24); // 2시간
			jwtCookie.setPath("/");
			response.addCookie(jwtCookie);

			return ResponseEntity.ok(Map.of("userJwt", jwt));
		} catch (Exception e) {
			logger.error("인증 실패: {}", e.getMessage());
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("error", "Authentication failed"));
		}
	}

	@GetMapping("/Users/CheckCookie")
	public ResponseEntity<Map<String, String>> checkCookie(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();

		System.out.println("모바일 아이디" + cookies);
		String jwtToken = null;
		boolean isKakaoUser = false; // 카카오 사용자 여부를 판단하는 변수

		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				Cookie cookie = cookies[i];
				 System.out.println("Cookie Name: " + cookie.getName() + ", Cookie Value: " + cookie.getValue());
				if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
					jwtToken = cookie.getValue();
					System.out.println("토큰1 : " + jwtToken);
					if ("kakaoAccessToken".equals(cookie.getName())) {
						isKakaoUser = true; // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
					}
					System.out.println("토큰: " + jwtToken);
					break;
				}
			}
		}
		String username = null;

		System.out.println("모바일 토큰" + jwtToken);
		if (jwtToken != null) {
			username = jwtUtil.extractUsername(jwtToken);
			System.out.println("사용자 정보1: " + username);

			if (isKakaoUser) {
				// 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
				Optional<User> kakaouser = userService.findBySocialId(username); // 카카오 소셜 ID로 사용자 조회
				System.out.println("카카오 사용자 정보: " + kakaouser);

				// 카카오 회원의 ID 사용
				if (kakaouser.isPresent()) {
					username = kakaouser.get().getId();
					return ResponseEntity.ok(Map.of("status", "authenticated", "kakaoAccessToken", jwtToken));
				} else {
					return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("status", "unauthenticated"));
				}
			} else {
				// 일반 사용자라면 기존 방식으로 사용자 조회
				Optional<User> user = userService.getUserByUsername(username);
				System.out.println("사용자 정보: " + user);
				return ResponseEntity.ok(Map.of("status", "authenticated", "userJwt", jwtToken));
			}
		} else {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("status", "unauthenticated"));
		}
	}

	public String generateSecretKeyForAdmin(HttpSession session) {
		GoogleAuthenticator gAuth = new GoogleAuthenticator();
		GoogleAuthenticatorKey key = gAuth.createCredentials();
		System.out.println("Generated Admin OTP Secret Key: " + key);
		session.setAttribute("adminOtpSecretKey", key.getKey());
		String secretKey = key.getKey();
		System.out.println("Generated Admin OTP Secret Key: " + secretKey);
		return secretKey;
	}

	@GetMapping("/oauth2/callback/kakao")
	public ResponseEntity<Map<String, String>> kakaoCallback(@RequestParam String code, HttpServletResponse response,
			HttpServletRequest request) {
		System.out.println("Kakao code received: " + code); // 요청 확인 로그
		try {
			// 1. 액세스 토큰 요청

			String accessToken = getKakaoAccessToken(code);

			// 2. OAuth2UserRequest 객체 생성
			OAuth2UserRequest oAuth2UserRequest = createOAuth2UserRequest(accessToken);

			// 3. CustomOAuth2UserService를 사용하여 사용자 정보 가져오기
			OAuth2User oAuth2User = customOAuth2UserService.loadUser(oAuth2UserRequest);

			// 4. OAuth2 인증 객체 생성
			OAuth2AuthenticationToken authenticationToken = new OAuth2AuthenticationToken(oAuth2User,
					oAuth2User.getAuthorities(), "kakao");
			HttpSession session = request.getSession();

			// ClientRegistration과 OAuth2AccessToken 저장
			session.setAttribute("clientRegistration", createOAuth2UserRequest(accessToken).getClientRegistration());
			session.setAttribute("accessToken", accessToken);

			// 5. SecurityContext에 인증 설정
			// SecurityContext 명시적 설정
			logger.info("SecurityContext before setting: {}", SecurityContextHolder.getContext().getAuthentication());
			SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
			securityContext.setAuthentication(authenticationToken);
			SecurityContextHolder.setContext(securityContext);
			SecurityContextHolder.getContext().setAuthentication(authenticationToken);
			logger.info("SecurityContext after setting: {}", SecurityContextHolder.getContext().getAuthentication());
			// 6. JWT 토큰 생성
			String jwt = jwtUtil.generateToken(oAuth2User.getName(), "user", false);
			// JWT를 쿠키에 저장
			Cookie jwtCookie = new Cookie("kakaoAccessToken", jwt);
			jwtCookie.setHttpOnly(false);
			jwtCookie.setSecure(false); // HTTPS에서만 사용
			jwtCookie.setMaxAge(60 * 120); // 2시간
			jwtCookie.setPath("/");
			response.addCookie(jwtCookie);

			logger.info("JWT 생성 성공: {}", jwt);
			logger.info("JWT 쿠키 생성 성공: {}", jwtCookie);
			logger.info("SecurityContext 설정 완료: {}", SecurityContextHolder.getContext().getAuthentication());

			logger.info("사용자 인증:{}", authenticationToken);

			// 7. JWT를 헤더에 저장
			HttpHeaders headers = new HttpHeaders();
			headers.set("Authorization", "Bearer " + jwt);

			// 8. 세션에 값을 저장
			session.setAttribute("token", jwt);

			// 클라이언트 페이지로 리다이렉트
			headers.setLocation(URI.create("http://192.168.100.133:9090/Mobile/Users/KakaoCallBack"));
			return ResponseEntity.status(HttpStatus.FOUND).headers(headers).build();
		} catch (UserNotFoundOAuth2Exception e) {
			throw e;
		} catch (UserAlreadyLinkedToSocialException e) {
			throw e;
		} catch (Exception e) {
			logger.error("Kakao 로그인 처리 중 오류 발생: {}", e.getMessage());
			return ResponseEntity.status(HttpStatus.FOUND).header("Location", "http://192.168.100.133:9090/Mobile/Users/LoginForm?error=true")
					.build();
		}
	}

	private String getKakaoAccessToken(String code) {
		String tokenUrl = "https://kauth.kakao.com/oauth/token";
		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", kakaoClientId);
		params.add("redirect_uri", kakaoRedirectUri);
		params.add("code", code);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);

		ResponseEntity<Map> response = restTemplate.postForEntity(tokenUrl, request, Map.class);
		return (String) response.getBody().get("access_token");
	}

	private OAuth2UserRequest createOAuth2UserRequest(String accessToken) {
		OAuth2AccessToken oAuth2AccessToken = new OAuth2AccessToken(OAuth2AccessToken.TokenType.BEARER, accessToken,
				null, null);

		return new OAuth2UserRequest(ClientRegistration.withRegistrationId("kakao").clientId(kakaoClientId)
				.authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE).redirectUri(kakaoRedirectUri)
				.authorizationUri("https://kauth.kakao.com/oauth/authorize")
				.tokenUri("https://kauth.kakao.com/oauth/token").userInfoUri("https://kapi.kakao.com/v2/user/me")
				.userNameAttributeName("id").clientName("Kakao").build(), oAuth2AccessToken);
	}

}
