package com.board.business.dto;

import lombok.Data;

@Data
public class CompanyDto {

	private int company_idx;
	private String id;
	private String password;
	private String name;
	private String code;
	private String email;
	private String phone;
	private String compulsory_agreement;
	private String info_agreement;
	private String message_agreement;
	private String marketing_agreement;
	private String alert_agreement;
	private String status;
	private String cdate;
	
}
