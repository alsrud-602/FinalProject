package com.board.users.service;

import java.util.Collections;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.board.users.dto.User;
import com.board.users.handle.UserAlreadyLinkedToSocialException;
import com.board.users.handle.UserNotFoundOAuth2Exception;
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

        // 1. 소셜 ID로 사용자 검색
        User user = userRepository.findBySocialTypeAndSocialId(socialType, socialId)
                .orElseGet(() -> userRepository.findByEmail(email).orElse(null));

        if (user == null) {
            // 신규 사용자 정보를 User 객체에만 설정 (저장하지 않음)
            User tempUser = new User();
            tempUser.setEmail(email);
            tempUser.setSocialType(socialType);
            tempUser.setSocialId(socialId);
            tempUser.setRole("USER");

            // 사용자 정의 예외로 User 객체 전달
            logger.error("소셜 로그인 사용자 회원가입 필요: email={}", email);
            throw new UserNotFoundOAuth2Exception("회원가입 필요", tempUser);
        }

        // 3. 기존 사용자에 소셜 정보 연동
        if (user.getSocialType() == null || user.getSocialId() == null) {
            if (user.getEmail().equals(email)) {
                // 사용 중인 계정에 소셜 정보 연동
                user.setSocialType(socialType);
                user.setSocialId(socialId);
                userRepository.save(user);

                // 알림 메시지와 함께 로그인 페이지로 이동
                logger.warn("이미 사용 중인 계정입니다: email={}", email);
                throw new UserAlreadyLinkedToSocialException("이미 사용 중인 계정입니다. 로그인 페이지로 이동합니다.");
            }
        }


        // 4. SecurityContext에 Authentication 설정
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
            user, null, Collections.singleton(new SimpleGrantedAuthority("ROLE_" + user.getRole()))
        );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        logger.debug("SecurityContext 인증 정보: {}", SecurityContextHolder.getContext().getAuthentication());


        // 5. OAuth2User 반환
        oAuth2User = new DefaultOAuth2User(
            Collections.singleton(new SimpleGrantedAuthority("ROLE_USER")),
            attributes,
            "id"
        );
        logger.debug("OAuth2 요청: clientName={}", userRequest.getClientRegistration().getClientName());
        logger.debug("OAuth2 사용자 정보: {}", attributes);

        return oAuth2User;
    }
}
