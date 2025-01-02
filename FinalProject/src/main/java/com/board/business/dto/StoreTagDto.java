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
public class StoreTagDto {


	public StoreTagDto(String tag) {
	this.tag_name =tag;	
	}
	
	public StoreTagDto(String tag, int store_idx) {
		this.tag_name =tag;		
		this.store_idx =store_idx;		
	}

	private int tage_idx;
	private int store_idx;
	private String tag_name;
	
}
