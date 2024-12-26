package com.board.business.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StoreDto {

	private int store_idx;
	private int company_idx;
	private String title;
	private String age;
	private String brand1;
	private String brand2;
	private Date cdate;
	private String status;
	private String ban;
	
}
