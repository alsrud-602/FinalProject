package com.board.business.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StoreCategoryDto {

	
	public StoreCategoryDto(int id) {
		this.category_id = id;
	}
	public StoreCategoryDto(int id, int store_idx) {
		this.category_id = id;
		this.store_idx = store_idx;
	}
	private int sc_idx;
	private int store_idx;
	private int category_id;
	
}
