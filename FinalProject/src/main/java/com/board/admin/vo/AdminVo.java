package com.board.admin.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminVo {
	
	
	private long user_idx;               // 사용자 고유 id 
    private String nickname;             // 사용자 닉네임 
    private String id;                  // 사용자 id 
    private String password;            // 사용자 비밀번호 
    private String email;               // 사용자 이메일 
    private String birthdate;           // 사용자 생일 
    private String phone;               // 사용자 전화번호 
    private String compulsory_agreement; // 필수 동의 여부 
    private String info_agreement;       // 개인정보 동의 여부 
    private String message_agreement;    // 메시지 수신 동의 여부 
    private String marketing_agreement;  // 마케팅 수신 동의 여부 
    private String alert_agreement;      // 알림 수신 동의 여부 
    private String cdate;               // 회원 가입일 
    private String status;              // 사용자 상태 
    private int enabled;                // 활성화 여부 
    private String role;                // 사용자 역할 
    private String social_id;            // 소셜 id 
    private String social_type;          // 소셜 로그인 타입
    private String name;                // 사용자 이름 
	
	
    // 팝콘  	
	
	private int log_id; // SQL에서는 LOG_ID
	private String user_id; // SQL에서는 USER_ID
	private String content; // SQL에서는 CONTENT
	private int earned_points; // SQL에서는 EARNED_POINTS
	private int spent_points; // SQL에서는 SPENT_POINTS
	private int total_points; // SQL에서는 TOTAL_POINTS
	private String content_info; // SQL에서는 CONTENT_INFO
	private String add_date; // SQL에서는 ADD_DATE
	
	 // 출석 관련 필드
    private String attendance_status;  // 출석 상태 ('on', 'off')
    private String attendance_date;  // 출석 날짜
    private int consecutive_attendance_days;  // 연속 출석 일수
    private int total_attendance_days; 

    // 선택인원 모두 팝콘 지급 관련 필드 추가
    private List<String> userIds;  // 팝콘을 지급할 유저들의 ID 목록
    private String contentInfo;    // 지급 또는 차감 내용
    private int points;            // 지급 또는 차감할 포인트

    
    // 리뷰 조회
    private int review_idx;
    private int store_idx;
    private int SCORE;
    private int LIKE;
    private int HIT;
    
    
    
    
    
    // Getters and Setters
    public List<String> getUserIds() {
        return userIds;
    }

    public void setUserIds(List<String> userIds) {
        this.userIds = userIds;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
    
    
}

