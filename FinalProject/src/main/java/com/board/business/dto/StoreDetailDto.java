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
public class StoreDetailDto {

	private int detail_idx;
	private int store_idx;
	private String address;
	private Date start_date;
	private Date end_date;
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
	
}
