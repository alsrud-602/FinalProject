package com.board.companys.dto;

import java.util.Date;	

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Getter@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "companys")
public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "company_seq_gen")
    @SequenceGenerator(name = "company_seq_gen", sequenceName = "COMPANY_SEQ", allocationSize = 1)
    @Column(name = "COMPANY_IDX", length = 10)
    private Long companyIdx; // 유저 ID

    @Column(name = "NAME", length=100)
    private String name; //기업명
    
    @Column(name = "ID", length = 100)
    private String id; // 아이디

    @Column(name = "PASSWORD", length = 100)
    private String password; // 비밀번호

    @Column(name = "EMAIL", nullable = false, length = 500)
    private String email; // 이메일

    @Column(name = "CODE", length = 30)
    private String code; // 사업자 등록 번호

    @Column(name = "PHONE", length = 20)
    private String phone; // 번호

    @Column(name = "COMPULSORY_AGREEMENT", length = 3)
    private String compulsoryAgreement; // 필수약관1

    @Column(name = "INFO_AGREEMENT", length = 3)
    private String infoAgreement; // 필수약관2

    @Column(name = "MESSAGE_AGREEMENT", length = 3)
    private String messageAgreement; // 필수약관3

    @Column(name = "MARKETING_AGREEMENT", length = 3)
    private String marketingAgreement; // 선택약관1

    @Column(name = "ALERT_AGREEMENT", length = 3)
    private String alertAgreement; // 선택약관2

    @Column(name = "CDATE", columnDefinition = "DATE DEFAULT SYSDATE")
    @Temporal(TemporalType.DATE)
    private Date cdate; // 가입일

    @Column(name = "STATUS", length = 20, columnDefinition = "DEFAULT 회원")
    private String status; // 블락 상태 또는 우수 회원 또는 null(일반)
    
    @Column
    private Boolean enabled = false;
    
    @Column(name = "SOCIAL_TYPE", length = 20)
    private String socialType; // 소셜 로그인 타입 (KAKAO, NAVER)

    @Column(name = "SOCIAL_ID", length = 100)
    private String socialId; // 소셜 로그인 ID

    @Column(name = "ROLE", length = 20)
    private String role="company";
    
    // 약관 유효성 검사
    public boolean isValidAgreement(String agreement) {
        return "N".equals(agreement) || "Y".equals(agreement);
    }
    
    public String determineUserType() {
        return "company"; // 회사 사용자 유형
    }




}
