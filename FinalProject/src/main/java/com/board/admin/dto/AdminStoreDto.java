package com.board.admin.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminStoreDto {
	
	
	private int store_idx;
	private int company_idx;
	private String title;
	private String age;
	private String brand1;
	private String brand2;
	private String cdate;
	private String date;
	private String status;
	private String ban;
	
	private int user_idx;
	private String nickname;
	private String id;
	private String password;
	private String email;
	private String birthdate;
	private String phone;
	private String compulsory_agreement;
	private String info_agreement;
	private String message_agreement;
	private String marketing_agreement;
	private String alert_agreement;
	private int enabled;
	private String role;
	private String social_id;
	private String social_type;
	private String name;
	
	private int request_idx;
	private String field;
	private String content;
	private String response;
	private String restatus;
	
	private int detail_idx;
	private String address;
	private String start_date;
	private String end_date;
	private String homepage;
	private String sns;
	private String introduction;
	private String parking;
	private String fare;
	private String age_limit;
	private String shooting;
    private int LIKE;
    private String goods;
    private String igdate;
    private String code;
    
    private int category_idx;
    private String category_name;
    private int category_id;
    
    private int is_idx;
    private String imagename;
    private String imageext;
    private String image_path;
    
    private String search;
    private String filter;
}

