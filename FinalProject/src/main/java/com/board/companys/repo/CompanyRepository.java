package com.board.companys.repo;

import com.board.companys.dto.Company;
import com.board.users.dto.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CompanyRepository extends JpaRepository<Company, Long> {
    Optional<Company> findById(String id);
    
    // 소셜 로그인 타입 및 ID 기반 검색
    Optional<Company> findBySocialTypeAndSocialId(String socialType, String socialId);

    // 이메일 기반 검색 (소셜 로그인 연동 시 사용)
    Optional<Company> findByEmail(String email);

    Optional<Company> findBySocialId(String socialId);

}
