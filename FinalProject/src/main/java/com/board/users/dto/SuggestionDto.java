package com.board.users.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor


public class SuggestionDto {
	
	private int uc_idx;
	private int user_idx;
	private int category_id;
	private int sc_idx;
	private int store_idx;
	private String title;
	private String start_date;
	private String end_date;
	private int category_idx;
	private String category_name;
	private String image_path;
}