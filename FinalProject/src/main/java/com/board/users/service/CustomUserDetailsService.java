package com.board.users.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.board.companys.dto.Company;
import com.board.companys.repo.CompanyRepository;
import com.board.users.dto.User;
import com.board.users.repo.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CompanyRepository companyRepository;
    
    @Autowired
    private KakaoUserService kakaoUserService;

    private final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);
    
    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        logger.debug("CustomUserDetailsService - loadUserByUsername 호출: {}", id);

        // 일반 사용자 조회
        Optional<User> userOpt = userRepository.findById(id);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            logger.debug("일반 사용자 발견: {}", user);
            List<GrantedAuthority> authorities = List.of(new SimpleGrantedAuthority("ROLE_" + user.getRole()));
            return new org.springframework.security.core.userdetails.User(user.getId(), user.getPassword(), authorities);
        }

        // 회사 사용자 조회
        Optional<Company> companyOpt = companyRepository.findById(id);
        if (companyOpt.isPresent()) {
            Company companyUser = companyOpt.get();
            if (!"company".equalsIgnoreCase(companyUser.getRole())) {
                logger.warn("잘못된 역할: {}", companyUser.getRole());
                throw new UsernameNotFoundException("Not authorized for role: " + companyUser.getRole());
            }
            logger.debug("회사 사용자 발견: {}", companyUser);
            List<GrantedAuthority> authorities = List.of(new SimpleGrantedAuthority("ROLE_" + companyUser.getRole()));
            return new org.springframework.security.core.userdetails.User(companyUser.getId(), companyUser.getPassword(), authorities);
        }

        logger.warn("사용자 찾을 수 없음: {}", id);
        throw new UsernameNotFoundException("User not found with ID: " + id);
    }
    
    
    public UserDetails loadUserByKakaoUsername(String id) throws UsernameNotFoundException {
        return kakaoUserService.loadUserByKakaoUsername(id);  // KakaoUserService 호출
    }
    

}
