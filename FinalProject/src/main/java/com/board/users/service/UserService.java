package com.board.users.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.board.users.dto.User;
import com.board.users.repo.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder; // PasswordEncoder 인터페이스 사용

    public Optional<User> findByUserId(String id) {
        return userRepository.findById(id);
    }

    public void registerUser(User user) {
        // 비밀번호 암호화
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(true); // 계정 활성화

        // 약관 유효성 검사
        if (!user.isValidAgreement(user.getCompulsoryAgreement()) || 
            !user.isValidAgreement(user.getInfoAgreement()) || 
            !user.isValidAgreement(user.getMessageAgreement())) {
            throw new IllegalArgumentException("필수 약관 동의는 Y 또는 N만 가능합니다.");
        }

        // 선택 약관 기본값 설정
        if (user.getMarketingAgreement() == null) {
            user.setMarketingAgreement("N");
        }
        if (user.getAlertAgreement() == null) {
            user.setAlertAgreement("N");
        }

        // 가입일 기본값
        user.setCdate(new java.util.Date());
        user.setRole("USER");

        userRepository.save(user);
    }

	public Optional<User> findBySocialId(String id) {
        return userRepository.findBySocialId(id);
	}

    public String getEmailById(String id) {
        // ID로 사용자 정보 조회
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("사용자를 찾을 수 없습니다.")); // 사용자 없으면 예외 처리
        String email = user.getEmail();
        return email; // 사용자 이메일 반환
    }
}
