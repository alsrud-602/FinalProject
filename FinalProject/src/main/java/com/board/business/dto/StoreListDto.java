package com.board.business.dto;

import lombok.Data;

@Data
public class StoreListDto {
	private int store_idx;
	private String title;
	private String label;
	private String status;
	private String ban;
	private String category_name;
	private String start_date;
	private String end_date;
	private String rstatus;
	private String field;
	private String response;
	private int request_idx;
	

}
