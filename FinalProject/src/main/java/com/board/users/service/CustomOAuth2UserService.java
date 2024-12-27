package com.board.users.service;

import java.util.Collections;
import java.util.Map;

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

import com.board.handle.UserAlreadyLinkedToSocialException;
import com.board.handle.UserNotFoundOAuth2Exception;
import com.board.users.dto.User;
import com.board.users.repo.UserRepository;
@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

    @Autowired
    private UserRepository userRepository;

    private final Logger logger = LoggerFactory.getLogger(CustomOAuth2UserService.class);

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = new DefaultOAuth2UserService().loadUser(userRequest);
        Map<String, Object> attributes = oAuth2User.getAttributes();

        String socialType = userRequest.getClientRegistration().getRegistrationId().toUpperCase(); // KAKAO
        String socialId = attributes.get("id").toString();
        
        String email = (String) ((Map<String, Object>) attributes.get("kakao_account")).get("email");
        String name = (String) ((Map<String, Object>) attributes.get("kakao_account")).get("name");
        String phone_number = (String) ((Map<String, Object>) attributes.get("kakao_account")).get("phone_number");
        // 1. 소셜 ID로 사용자 검색
        User kakaouser = userRepository.findBySocialTypeAndSocialId(socialType, socialId)
                .orElseGet(() -> userRepository.findByEmail(email).orElse(null));
        System.out.println("카카오 유저"+kakaouser);
     // 1. attributes에 User 엔티티의 id 값을 추가
        System.out.println("카카오 유저 아이디 기반 아이디"+kakaouser.getId());
        //attributes.put("userId", kakaouser.getId()); // User 엔티티의 id를 "userId"라는 키로 추가


        // 2. 회원가입
        // 기존 정보 없으면 카카오 로그인 클릭시 카카오로그인과 연동하려면 회원가입
        //기존정보는 있으나 카카오이메일도아니고 소셜아이디,타입도 없음. 
        //"카카오로그인과 연동하려면 팝콘회원가입이 필요해요~ 또는 기존정보로 로그인후 프로필에서 연동하세요" 회원가입시 카카오이메일,소셜아이디,타입 전달
        if (kakaouser == null) {
            // 신규 사용자 정보를 User 객체에만 설정 (저장하지 않음)
            User tempUser = new User();
            tempUser.setEmail(email);
            tempUser.setSocialType(socialType);
            tempUser.setSocialId(socialId);
            tempUser.setName(name);
            tempUser.setRole("USER");
            // 사용자 정의 예외로 User 객체 전달
            logger.error("소셜 로그인 사용자 회원가입 필요: email={}", email);
            throw new UserNotFoundOAuth2Exception("회원가입 필요", tempUser);
        }

        // 3. 기존 사용자에 소셜 정보 연동
        //기존정보(카카오이메일)가있는상태에서 
        //but 소셜아이디랑 타입은없음->"이미 등록된 회원이에요" 그냥로그인화면으로 가서 로그인하면 카카오로그인과 연동
        if (kakaouser.getSocialType() == null || kakaouser.getSocialId() == null) {
            if (kakaouser.getEmail().equals(email)) {
                // 사용 중인 계정에 소셜 정보 연동
            	kakaouser.setSocialType(socialType);
            	kakaouser.setSocialId(socialId);
                userRepository.save(kakaouser);

                // 알림 메시지와 함께 로그인 페이지로 이동
                logger.warn("이미 사용 중인 계정입니다: email={}", email);
                throw new UserAlreadyLinkedToSocialException("이미 사용 중인 계정입니다. 기존 정보로 로그인하시면 카카오 로그인과 연동됩니다.");
            }
        }

        // 4. 프로필에서 카카오 로그인 연동
        //"카카오로그인과 연동하려면 기존계정으로 로그인해주세요~ 로그인화면으로 보내는데 카카오이메일,소셜아이디,타입 전달"
        //카카오 아이디와 연동하기
        //if (kakaouser.getSocialType() == null || kakaouser.getSocialId() == null) {
        //if (!kakaouser.getEmail().equals(email)) {}}


        System.out.println("카카오 유저 아이디 기반 아이디"+kakaouser.getId());
        logger.info("SecurityContext 인증 정보: {}", SecurityContextHolder.getContext().getAuthentication());


        // 5. OAuth2User 반환
        oAuth2User = new DefaultOAuth2User(
            Collections.singleton(new SimpleGrantedAuthority("ROLE_USER")),
            attributes,
            "id"
        );
        logger.info("OAuth2 요청: clientName={}", userRequest.getClientRegistration().getClientName());
        logger.info("OAuth2 사용자 정보: {}", attributes);
        logger.info("OAuth2 사용자 정보2: {}", oAuth2User);

        return oAuth2User;
    }
}
