package com.board.business.service;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.board.business.dto.ImageReivewDTO;
import com.board.business.dto.ImageStoreDTO;
import com.board.business.mapper.BusinessMapper;

@Service 
public class PdsServiceimpl implements PdsService {

	@Value("${part4.upload-path}")	
	private String uploadPath;
	@Autowired
	private BusinessMapper businessMapper;
	@Override
	public void serWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles) {
		
		int store_idx = businessMapper.getStoreIdxMax();
		map.put("store_idx", store_idx);
		map.put("uploadPath", uploadPath );
		//파일저장
		PdsFile.save(uploadfiles,map);	
		//db 저장
		System.out.println(map.get("fileList"));
		List<ImageStoreDTO> imageList = (List<ImageStoreDTO>)map.get("fileList");	
		System.out.println(imageList);
		if(imageList.size()>0)
	    businessMapper.setFileWriter(map);
		
	}
	@Override
	public List<ImageStoreDTO> getImageStorList(int store_idx) {
		List<ImageStoreDTO> isList = businessMapper.getImageStorList(store_idx);
		return isList;
	}
	@Override
	public void setUpdate(HashMap<String, Object> map, MultipartFile[] uploadfiles) {
		
		map.put("uploadPath", uploadPath );
		//파일저장
		PdsFile.save(uploadfiles,map);	
		//db 저장
		System.out.println(map.get("fileList"));
		List<ImageStoreDTO> imageList = (List<ImageStoreDTO>)map.get("fileList");	
		System.out.println(imageList);
		if(imageList.size()>0)
	    businessMapper.setFileWriter(map);
		
	}
	@Override
	public ImageStoreDTO getImageStore(int is_idx) {
		ImageStoreDTO stDto = businessMapper.getImageStore(is_idx);
		return stDto;
	}
	@Override
	public void deleteImageStore(int is_idx) {
		businessMapper.deleteImageStore(is_idx);
		
	}
	@Override
	public void setReviewWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles) {	
	    ImageReivewDTO irDto = businessMapper.getReview_idxMax();
		map.put("review_idx", irDto.getReview_idx());
		map.put("user_idx", irDto.getUser_idx());
		map.put("store_idx", irDto.getStore_idx());
		map.put("uploadPath", uploadPath );
		//파일저장
		PdsFile.reveiwSave(uploadfiles,map);	
		//db 저장
		System.out.println(map.get("fileList"));
		List<ImageReivewDTO> imageList = (List<ImageReivewDTO>)map.get("fileList");	
		System.out.println(imageList);
		if(imageList.size()>0)
	    businessMapper.setReviewFileWriter(map);
		
	}

	@Override
	public void deleteImageReview(int is_idx) {
		businessMapper.deleteImageReview(is_idx);
		
	}
	@Override
	public ImageReivewDTO getImageReview(int is_idx) {
		ImageReivewDTO irDto = businessMapper.getImageReview(is_idx);
		return irDto;
	}
	
	
	@Override
	public void updateReviewWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles) {	
	    ImageReivewDTO irDto = businessMapper.getReview_idxMax();
		map.put("uploadPath", uploadPath );
		//파일저장
		PdsFile.reveiwSave(uploadfiles,map);	
		//db 저장
		System.out.println(map.get("fileList"));
		List<ImageReivewDTO> imageList = (List<ImageReivewDTO>)map.get("fileList");	
		System.out.println(imageList);
		if(imageList.size()>0)
	    businessMapper.setReviewFileWriter(map);
		
	}
	   @Override
	   public void deleteReviewFull(int review_idx) {
	   
	      //실제 이미지삭제
	      List<ImageReivewDTO> irList =  businessMapper.getImageReviewAll(review_idx);
	      for (ImageReivewDTO irDTO : irList) {            
	      Path filePath = Paths.get(uploadPath).resolve(irDTO.getImage_path()).normalize();
	      String filep = filePath.toString(); 
	      File file = new File(filep);            
	      if( file.exists()) {
	         file.delete();
	        }
	      }
	      //이미지 테이블 삭제
	      businessMapper.deleteImageReviewAll(review_idx);

	      //리뷰 라이크 삭제
	      businessMapper.deleteReviewLikeAll(review_idx);
	      
	      //리뷰 조회수 삭제
	      businessMapper.deleteReviewHitAll(review_idx);            
	   }

}
