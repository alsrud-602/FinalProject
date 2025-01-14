package com.board.business.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.board.business.dto.ImageReivewDTO;
import com.board.business.dto.ImageStoreDTO;

public interface PdsService {

	void serWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles);

	List<ImageStoreDTO> getImageStorList(int store_idx);

	void setUpdate(HashMap<String, Object> map, MultipartFile[] uploadfiles);

	ImageStoreDTO getImageStore(int is_idx);

	void deleteImageStore(int is_idx);

	void setReviewWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles);

	void deleteImageReview(int is_idx);

	ImageReivewDTO getImageReview(int is_idx);

	void updateReviewWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles);

}
