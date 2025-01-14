package com.board.users.service;

import java.util.Collections;	
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.board.exception.UserAlreadyLinkedToSocialException;
import com.board.exception.UserNotFoundOAuth2Exception;
import com.board.users.dto.User;
import com.board.users.repo.UserRepository;
@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

    @Autowired
    private UserRepository userRepository;

    private final Logger logger = LoggerFactory.getLogger(CustomOAuth2UserService.class);

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        System.out.println("Inside loadUser method");

        // userRequest 정보 출력
        System.out.println("Client Registration: " + userRequest.getClientRegistration());
        System.out.println("Access Token: " + userRequest.getAccessToken().getTokenValue());

        OAuth2User oAuth2User = new DefaultOAuth2UserService().loadUser(userRequest);
        
        if (oAuth2User != null) {
            System.out.println("Complete oAuth2User: " + oAuth2User.getAttributes());
        } else {
            System.out.println("oAuth2User is null");
        }
        Map<String, Object> attributes = oAuth2User.getAttributes();

        System.out.println("Complete attributes: " + attributes); 
        String socialType = userRequest.getClientRegistration().getRegistrationId().toUpperCase(); // KAKAO, NAVER 등
        String socialId;
        String email = null;
        String name = null;
        String phoneNumber = null;

        // 1. 소셜 ID로 사용자 검색
        if ("KAKAO".equals(socialType)) {
            socialId = attributes.get("id").toString();
            Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
            email = (String) kakaoAccount.get("email");
            name = (String) kakaoAccount.get("name");
            phoneNumber = formatPhoneNumber((String) kakaoAccount.get("phone_number"));
        } else if ("NAVER".equals(socialType)) {
            Map<String, Object> response = (Map<String, Object>) attributes.get("response");
            email = (String) response.get("email");
            socialId = (String) response.get("id");
            name = (String) response.get("name");
            phoneNumber = formatPhoneNumber((String) response.get("mobile"));
        } else {
            throw new OAuth2AuthenticationException("Unsupported social type: " + socialType);
        }

        // 2. 사용자 검색
        User user = userRepository.findBySocialTypeAndSocialId(socialType, socialId).orElse(null);

        // 3. 이메일로 사용자 검색
        if (user == null && email != null) {
            user = userRepository.findByEmail(email).orElse(null);
        }

     // 1. attributes에 User 엔티티의 id 값을 추가

        // 2. 회원가입
        // 기존 정보 없으면 카카오 로그인 클릭시 카카오로그인과 연동하려면 회원가입
        // 기존정보는 있으나 카카오이메일도아니고 소셜아이디,타입도 없음. 
        //"카카오로그인과 연동하려면 팝콘회원가입이 필요해요~ 또는 기존정보로 로그인후 프로필에서 연동하세요" 회원가입시 카카오이메일,소셜아이디,타입 전달
        if (user == null) {
            logger.info("소셜 로그인 사용자 회원가입 필요: email={}", email);
            User tempUser = new User();
            tempUser.setEmail(email);
            tempUser.setSocialType(socialType);
            tempUser.setSocialId(socialId);
            tempUser.setName(name);
            tempUser.setPhone(phoneNumber);
            tempUser.setRole("USER");
            throw new UserNotFoundOAuth2Exception("회원가입 필요합니다", tempUser);
        }

        // 3. 기존 사용자에 소셜 정보 연동
        //기존정보(카카오이메일)가있는상태에서 
        //but 소셜아이디랑 타입은없음->"이미 등록된 회원이에요" 그냥로그인화면으로 가서 로그인하면 카카오로그인과 연동
        if (user.getSocialType() == null || user.getSocialId() == null) {
            if (user.getEmail().equals(email)) {
                // 사용 중인 계정에 소셜 정보 연동
            	user.setSocialType(socialType);
            	user.setSocialId(socialId);
            	user.setRole("USER");
                userRepository.save(user);

                // 알림 메시지와 함께 로그인 페이지로 이동
                logger.warn("이미 사용 중인 계정입니다: email={}", email);
                throw new UserAlreadyLinkedToSocialException("이미 사용 중인 계정입니다. 기존 정보로 로그인하시면 카카오 로그인과 연동됩니다.");
            }
        }

        // 4. 프로필에서 카카오 로그인 연동
        //"카카오이메일,소셜아이디,타입 전달"
        //카카오 아이디와 연동하기
        //if (kakaouser.getSocialType() == null || kakaouser.getSocialId() == null) {
        //    if (!kakaouser.getEmail().equals(email) && 기존 아이디가 있을때) {

        logger.info("SecurityContext 인증 정보: {}", SecurityContextHolder.getContext().getAuthentication());


        // 5. OAuth2User 반환
        String key = "id";
        if ("NAVER".equals(socialType)) {
            key = "response"; // 네이버의 경우 response를 key로 설정
        }

        oAuth2User = new DefaultOAuth2User(
            Collections.singleton(new SimpleGrantedAuthority("ROLE_USER")),
            attributes,
            key
        );
        logger.info("OAuth2 요청: clientName={}", userRequest.getClientRegistration().getClientName());
        logger.info("OAuth2 사용자 정보: {}", attributes);
        logger.info("OAuth2 사용자 정보2: {}", oAuth2User);

        return oAuth2User;
    }

    private String formatPhoneNumber(String phoneNumber) {
        if (phoneNumber == null) return null;

        StringBuilder formattedNumber = new StringBuilder();

        // "+82"를 "0"으로 변경
        if (phoneNumber.startsWith("+82")) {
            formattedNumber.append("0");
            phoneNumber = phoneNumber.substring(3); // "+82" 제거
        }

        // 하이픈과 공백 제거
        for (char ch : phoneNumber.toCharArray()) {
            if (ch != '-' && ch != ' ') {
                formattedNumber.append(ch);
            }
        }

        return formattedNumber.toString();
    }


}
