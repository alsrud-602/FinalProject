package com.board.users.dto;

import lombok.Data;

@Data
public class LikeDto {
	private int store_idx;
	private int user_idx;
	private String cdate;
	private int review_idx;	
}
