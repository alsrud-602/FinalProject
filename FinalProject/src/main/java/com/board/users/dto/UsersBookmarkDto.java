package com.board.users.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor


public class UsersBookmarkDto {
	
	private String title;
	private int store_idx;
	private int bookmark_idx;
	private int user_idx;
	private String start_date;
	private String end_date;


}