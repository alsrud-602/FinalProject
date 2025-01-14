package com.board.business.dto;

import lombok.Data;

@Data
public class WaitingDto {


	private int waiting_idx;
	private int store_idx;
	private String wating_order;
	private int user_idx;
	private String status;
	private int reservation_number;
	private int total;
	private String edate;
	private String cdate;
	private String id;
	private String social_id;
	private String name;
	private String title;
}
