package com.board.users.repo;

import com.board.users.dto.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findById(String id);
    
    // 소셜 로그인 타입 및 ID 기반 검색
    Optional<User> findBySocialTypeAndSocialId(String socialType, String socialId);

    // 이메일 기반 검색 (소셜 로그인 연동 시 사용)
    Optional<User> findByEmail(String email);

}
