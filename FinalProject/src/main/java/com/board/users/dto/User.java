package com.board.users.dto;

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
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_seq_gen")
    @SequenceGenerator(name = "user_seq_gen", sequenceName = "USER_SEQ", allocationSize = 1)
    @Column(name = "USER_IDX", length = 10)
    private Long userIdx; // 유저 ID

    @Column(name = "NIKNAME", length = 30)
    private String nickname; // 닉네임

    @Column(name = "NAME", length=30)
    private String name; //이름
    
    @Column(name = "ID", length = 30)
    private String id; // 아이디

    @Column(name = "PASSWORD", length = 30)
    private String password; // 비밀번호

    @Column(name = "EMAIL", nullable = false, length = 500)
    private String email; // 이메일

    @Column(name = "BIRTHDATE")
    @Temporal(TemporalType.DATE)
    private Date birthdate; // 생일

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

    @Column(name = "STATUS", length = 20)
    private String status; // 블락 상태
    
    @Column
    private Boolean enabled = false;
    
    @Column(name = "SOCIAL_TYPE", length = 20)
    private String socialType; // 소셜 로그인 타입 (KAKAO, NAVER)

    @Column(name = "SOCIAL_ID", length = 100)
    private String socialId; // 소셜 로그인 ID

    @Column(name = "ROLE", length = 20)
    private String role; // 기본 역할 USER
    
    // 약관 유효성 검사
    public boolean isValidAgreement(String agreement) {
        return "N".equals(agreement) || "Y".equals(agreement);
    }




}
