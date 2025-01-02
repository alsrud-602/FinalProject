package com.board.companys.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.board.companys.dto.Company;
import com.board.companys.repo.CompanyRepository;

@Service
public class CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private PasswordEncoder passwordEncoder; // PasswordEncoder 인터페이스 사용

    public Optional<Company> findByUserId(String id) {
        return companyRepository.findById(id);
    }

    public void registerUser(Company company) {
        // 비밀번호 암호화
    	company.setPassword(passwordEncoder.encode(company.getPassword()));
    	company.setEnabled(true); // 계정 활성화

        // 약관 유효성 검사
        if (!company.isValidAgreement(company.getCompulsoryAgreement()) || 
            !company.isValidAgreement(company.getInfoAgreement()) || 
            !company.isValidAgreement(company.getMessageAgreement())) {
            throw new IllegalArgumentException("필수 약관 동의는 Y 또는 N만 가능합니다.");
        }

        // 선택 약관 기본값 설정
        if (company.getMarketingAgreement() == null) {
        	company.setMarketingAgreement("N");
        }
        if (company.getAlertAgreement() == null) {
        	company.setAlertAgreement("N");
        }

        // 가입일 기본값
        company.setCdate(new java.util.Date());
        company.setRole("COMPANY");

        companyRepository.save(company);
    }
}
