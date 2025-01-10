package com.board.business.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ImageReivewDTO {


	
	public ImageReivewDTO(String fileName, String fileExt, String saveName2, Integer store_idx, Integer user_idx,
			Integer review_idx) {
		this.imagename = fileName;
		this.imageext = fileExt;
		this.image_path = saveName2;
		this.store_idx = store_idx;
		this.user_idx = user_idx;
		this.review_idx = review_idx;
		
		
		
	}
	private int is_idx;
	private String imagename;
	private String imageext;
	private String image_path;
	private int review_idx;
	private int user_idx;
	private int store_idx;
	
}
