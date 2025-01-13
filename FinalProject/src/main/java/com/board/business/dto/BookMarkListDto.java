package com.board.business.dto;

import lombok.Data;

@Data
public class BookMarkListDto {

	
	private int bookmark_idx; 
	private String store_idx;
	private String title;
	private String start_date; 
	private String end_date; 
	private String image_path;
}
