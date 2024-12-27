package com.board.business.dto;

import java.util.Date;

import lombok.Data;

@Data
public class RequestDto {
	private int request_idx;
	private int store_idx;
	private String field;
	private String content;
	private String response;
	private Date cdate;
	private String status;
}
