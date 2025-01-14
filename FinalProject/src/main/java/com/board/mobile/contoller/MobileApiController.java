package com.board.mobile.contoller;

import java.util.HashMap;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.business.mapper.BusinessMapper;
import com.board.business.service.BusinessService;
import com.board.companys.dto.Company;
import com.board.companys.repo.CompanyRepository;
import com.board.companys.service.CompanyService;
@RestController
@RequestMapping("/Mobile")
public class MobileApiController {

	@Autowired
	private BusinessMapper businessMapper;
	@Autowired
	private CompanyService companyService;
    @Autowired
    private CompanyRepository companyRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @RequestMapping("/Password/Config")
    public ResponseEntity<Boolean> infoUpdate(@RequestBody HashMap<String, Object> map) {
        // 요청에서 회사 ID와 비밀번호를 추출
        Long id = Long.valueOf(map.get("company_idx").toString());
        String inputPassword = map.get("password").toString();

        System.out.println("id : " + id);

        // ID로 회사 정보 조회
        Company company = companyRepository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("해당 회사 정보를 찾을 수 없습니다."));

        // 저장된 비밀번호와 입력한 비밀번호 비교
        boolean isPasswordMatch = passwordEncoder.matches(inputPassword, company.getPassword());

        System.out.println("company : " + company);
        System.out.println("company.getPassword() : " + company.getPassword());
        System.out.println("isPasswordMatch : " + isPasswordMatch);

        // 비밀번호 비교 결과 반환
        return ResponseEntity.status(HttpStatus.OK).body(isPasswordMatch);
    }


}
