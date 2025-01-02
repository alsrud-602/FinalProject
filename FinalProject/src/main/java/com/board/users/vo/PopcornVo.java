package com.board.users.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PopcornVo {
	private int log_id; // SQL에서는 LOG_ID
	private String user_id; // SQL에서는 USER_ID
	private String content; // SQL에서는 CONTENT
	private int earned_points; // SQL에서는 EARNED_POINTS
	private int spent_points; // SQL에서는 SPENT_POINTS
	private int total_points; // SQL에서는 TOTAL_POINTS
	private String content_info; // SQL에서는 CONTENT_INFO
	private String add_date; // SQL에서는 ADD_DATE
	
	
    private String attendance_status;  // 출석 상태 ('on', 'off')
    private String attendance_date;  // 출석 날짜
    private int consecutive_attendance_days;  // 연속 출석 일수
    private int total_attendance_days; 

}

