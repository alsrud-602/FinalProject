package com.board.exception;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.board.users.dto.User;
import com.board.users.repo.UserRepository;

@Component
public class DummyDataLoader implements CommandLineRunner {

    private final UserRepository userRepository; // UserRepository는 JPA를 사용하여 DB에 접근
    private final PasswordEncoder passwordEncoder;

    public DummyDataLoader(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) throws Exception {
        if (userRepository.count() <= 28) { 
            List<User> users = generateDummyUsers(100, 28); // 100개의 더미 사용자 생성, USER_IDX 28부터 시작
            userRepository.saveAll(users); // 사용자 저장
            System.out.println("더미 사용자가 생성되었습니다.");
        } else {
        }
    }

    private List<User> generateDummyUsers(int count, int startIdx) {
        List<User> users = new ArrayList<>();
        Random random = new Random();
        String[] names = {"Alice", "Bob", "Charlie", "David", "Eve"};
        String[] domains = {"example.com", "test.com", "demo.com"};

        for (int i = 0; i < count; i++) {
            User user = new User();
            user.setUserIdx((long) (startIdx + i)); // USER_IDX 설정
            user.setNickname("nickname" + (startIdx + i));
            user.setId("user" + (startIdx + i));
            user.setPassword(passwordEncoder.encode("password")); // 비밀번호 암호화
            user.setEmail("user" + (startIdx + i) + "@" + domains[random.nextInt(domains.length)]);
            user.setBirthdate(new Date()); // 현재 날짜로 설정 (예시)
            user.setPhone("0101234567" + (i % 10)); // 예시 전화번호
            user.setCompulsoryAgreement("N");
            user.setInfoAgreement("N");
            user.setMessageAgreement("N");
            user.setMarketingAgreement("N");
            user.setAlertAgreement("N");
            user.setCdate(new Date()); // 현재 날짜
            user.setStatus("ACTIVE"); // 예시 상태
            user.setEnabled(true); // ENABLED
            user.setRole("USER"); // ROLE
            user.setSocialId(null); // SOCIAL_ID
            user.setSocialType(null); // SOCIAL_TYPE
            user.setName(names[random.nextInt(names.length)]); // 랜덤 이름 설정

            users.add(user);
        }
        return users;
    }
}
