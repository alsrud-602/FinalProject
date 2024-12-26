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
}
