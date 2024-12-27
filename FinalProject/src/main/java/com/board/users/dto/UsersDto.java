package com.board.users.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsersDto {
	
	//스토어 기본 정보
	private int store_idx;
	private int company_idx;
	private String title;
	private String age;
	private String brand1;
	private String brand2;
	private String cdate;
	private String status;
	private String ban;
	
	private int detail_idx;
	private String address;
	private String start_date;
	private String end_date;
	private String homepage;
	private String sns;
	private String introduction;
	private String content;
	private String parking;
	private String fare;
	private String age_limit;
	private String shooting;
	private int like;
	private int hit;
    private String goods;
    
    private String user_id;
    private int user_idx;
    private String nickname;
    private String id;
    private String password;
    private String email;
    private String birthdate;
    private String phone;
    private String social_id;
    private String social_type;
    private String name;
    
}
