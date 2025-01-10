package com.board.business.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageStoreDTO {
	
	public ImageStoreDTO(String fileName, String fileExt, String saveName2, Integer store_idx) {
	      this.imageext = fileExt;
	      this.image_path = saveName2;
	      this.imagename = fileName;
	      this.store_idx = store_idx;
	   }
	
	private int is_idx;
	private String imagename;
	private String imageext;
	private String image_path;
	private Integer store_idx;
	

	
	
}
