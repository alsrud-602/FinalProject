package com.board.users.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.board.companys.dto.Company;
import com.board.companys.repo.CompanyRepository;
import com.board.users.dto.User;
import com.board.users.repo.UserRepository;
@Service
public class KakaoUserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CompanyRepository companyRepository;

    public UserDetails loadUserByKakaoUsername(String id) throws UsernameNotFoundException {
        Optional<User> userOpt = userRepository.findBySocialId(id);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            List<GrantedAuthority> authorities = List.of(new SimpleGrantedAuthority("ROLE_" + user.getRole()));
            return new org.springframework.security.core.userdetails.User(user.getId(), user.getPassword(), authorities);
        }

        Optional<Company> companyOpt = companyRepository.findBySocialId(id);
        if (companyOpt.isPresent()) {
            Company companyUser = companyOpt.get();
            if (!"company".equalsIgnoreCase(companyUser.getRole())) {
                throw new UsernameNotFoundException("Not authorized for role: " + companyUser.getRole());
            }
            List<GrantedAuthority> authorities = List.of(new SimpleGrantedAuthority("ROLE_" + companyUser.getRole()));
            return new org.springframework.security.core.userdetails.User(companyUser.getId(), companyUser.getPassword(), authorities);
        }

        throw new UsernameNotFoundException("User not found with ID: " + id);
    }
}