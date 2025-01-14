package com.board.users.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageDto {
   
	private int is_idx; 
	private String imagename;
	private String imageext;
	private String image_path;
  
	private int reservation_idx;
	private int user_idx;
	private String status;
	private int reservation_number;
	private String cdate;
	private int rp_idx;
	private String reservation_date;
	private int store_idx;
	
	private int company_idx;
	private String title;
	private String age;
	private String brand1;
	private String brand2;
	private String ban;
	
	private String reservation_cdate;
	
	private String start_date;
	private String end_date;
	private String address;
	private String reservation_status;
}
