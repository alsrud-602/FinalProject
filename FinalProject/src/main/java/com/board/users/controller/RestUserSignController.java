package com.board.users.controller;

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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
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

import com.board.users.dto.LoginRequest;
import com.board.users.dto.User;
import com.board.users.handle.UserAlreadyLinkedToSocialException;
import com.board.users.handle.UserNotFoundOAuth2Exception;
import com.board.users.jwt.JwtUtil;
import com.board.users.repo.UserRepository;
import com.board.users.service.CustomOAuth2UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
@RestController
@RequestMapping
@RequiredArgsConstructor
public class RestUserSignController {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;
    private final Logger logger = LoggerFactory.getLogger(RestUserSignController.class);

    @Value("${spring.security.oauth2.client.registration.kakao.client-id}")
    private String kakaoClientId;

    @Value("${spring.security.oauth2.client.registration.kakao.redirect-uri}")
    private String kakaoRedirectUri;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private CustomOAuth2UserService customOAuth2UserService;
    
    @PostMapping("/Users/Login")
    public ResponseEntity<Map<String, String>> login(@RequestBody LoginRequest loginRequest) {
        try {
            Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getId(), loginRequest.getPassword())
            );
            logger.info("인증 성공: {}", authentication);

            SecurityContextHolder.getContext().setAuthentication(authentication);

            String jwt = jwtUtil.generateToken(authentication.getName());
            logger.info("JWT 생성 성공: {}", jwt);

            return ResponseEntity.ok(Map.of("token", jwt));
        } catch (Exception e) {
            logger.error("인증 실패: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                                 .body(Map.of("error", "Authentication failed"));
        }
    }

    @GetMapping("/oauth2/callback/kakao")
    public ResponseEntity<Void> kakaoCallback(@RequestParam String code, HttpServletResponse response) {
        try {
            // 1. 액세스 토큰 요청
            String accessToken = getKakaoAccessToken(code);

            // 2. OAuth2UserRequest 객체 생성
            OAuth2UserRequest oAuth2UserRequest = createOAuth2UserRequest(accessToken);

            // 3. CustomOAuth2UserService를 사용하여 사용자 정보 가져오기
            OAuth2User oAuth2User = customOAuth2UserService.loadUser(oAuth2UserRequest);

            // 4. JWT 토큰 생성
            String jwt = jwtUtil.generateToken(oAuth2User.getName());

            // SecurityContext에 인증 설정
            Authentication authentication = new UsernamePasswordAuthenticationToken(
                oAuth2User.getName(), null, oAuth2User.getAuthorities()
            );
            SecurityContextHolder.getContext().setAuthentication(authentication);
            logger.info("SecurityContext 설정 완료: {}", SecurityContextHolder.getContext().getAuthentication());

            // 5. 쿠키에 JWT 저장 (HttpOnly 설정)
            Cookie jwtCookie = new Cookie("token", jwt);
            jwtCookie.setHttpOnly(true); // 스크립트에서 접근 불가
            jwtCookie.setSecure(true); // HTTPS에서만 전송
            jwtCookie.setPath("/"); // 모든 경로에서 쿠키 사용 가능
            jwtCookie.setMaxAge(7 * 24 * 60 * 60); // 쿠키 유효 기간 설정 (7일)
            response.addCookie(jwtCookie);

            // 리다이렉트
            return ResponseEntity.status(HttpStatus.FOUND)
                    .header("Location", "/")
                    .build();

        } catch (Exception e) {
            logger.error("Kakao 로그인 처리 중 오류 발생: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.FOUND)
                    .header("Location", "/Users/LoginForm?error=true")
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
        OAuth2AccessToken oAuth2AccessToken = new OAuth2AccessToken(
            OAuth2AccessToken.TokenType.BEARER,
            accessToken,
            null,
            null
        );

        return new OAuth2UserRequest(
            ClientRegistration.withRegistrationId("kakao")
                .clientId(kakaoClientId)
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .redirectUri(kakaoRedirectUri)
                .authorizationUri("https://kauth.kakao.com/oauth/authorize")
                .tokenUri("https://kauth.kakao.com/oauth/token")
                .userInfoUri("https://kapi.kakao.com/v2/user/me")
                .userNameAttributeName("id")
                .clientName("Kakao")
                .build(),
            oAuth2AccessToken
        );
    }




}
