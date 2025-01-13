package com.board.business.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.business.dto.ImageReivewDTO;
import com.board.business.dto.ImageStoreDTO;
import com.board.business.service.PdsService;

@RestController
public class PdsController {
	@Value("${part4.upload-path}")	
	private String uploadPath;
	
	@Autowired
	private PdsService pdsService;
	
	@RequestMapping("/DeleteImage")
	public void deleteImage(@RequestParam ("is_idx") int is_idx ) {
			
	//실제 파일 삭제 
    ImageStoreDTO isDto = pdsService.getImageStore(is_idx); 		
    Path filePath = Paths.get(uploadPath).resolve(isDto.getImage_path()).normalize();
    String filep = filePath.toString(); 
	File file = new File(filep);
	

	if( file.exists()) {
		file.delete();
	}	
	//files 테이블 삭제
	pdsService.deleteImageStore(is_idx);
	
	} 
	@RequestMapping("/DeleteImageReveiw")
	public void deleteImageReveiw(@RequestParam ("is_idx") int is_idx ) {
		
		//실제 파일 삭제 	
		ImageReivewDTO irDTO =  pdsService.getImageReview(is_idx);
		Path filePath = Paths.get(uploadPath).resolve(irDTO.getImage_path()).normalize();
		String filep = filePath.toString(); 
		File file = new File(filep);
				
		if( file.exists()) {
			file.delete();
		}	
		//files 테이블 삭제
		pdsService.deleteImageReview(is_idx);
		
	} 
	
	
	
}
