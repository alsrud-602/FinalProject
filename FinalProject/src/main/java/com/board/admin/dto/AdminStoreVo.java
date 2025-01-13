package com.board.admin.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminStoreVo {
	
	
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
    
}

