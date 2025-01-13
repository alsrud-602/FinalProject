package com.board.business.dto;

import lombok.Data;

@Data
public class StoreListDto {
	private int store_idx;
	private int rs_idx;
	private String link;
	private String title;
	private String age;
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
    private int review_count;         
    private double average_score;     
    private String brand1;
    private String brand2;
    private String address;
    private String introduction;
    private String tag_name;
    private int hit;
    private int like;
    private int waiting_count; 
}
