package com.board.users.service;

import java.util.HashMap;
import java.util.List;

import com.board.business.dto.CategoryDto;
import com.board.business.dto.CompanyDto;
import com.board.business.dto.RequestDto;
import com.board.business.dto.ReservationDateDto;
import com.board.business.dto.ReservationDateListDto;
import com.board.business.dto.ReservationPlanDto;
import com.board.business.dto.ReservationStoreDto;
import com.board.business.dto.ReservationUserListDto;

import com.board.business.dto.ResponseDto;
import com.board.business.dto.StoreCategoryDto;
import com.board.business.dto.StoreDto;
import com.board.business.dto.StoreListDto;
import com.board.business.dto.StoreTagDto;
import com.board.business.dto.StoreUpdateDto;

public interface LikeBookService {

	String insertLikeStore(HashMap<String, Object> map);

	Integer getIsIdx(HashMap<String, Object> map);

	String deleteLikeStore(HashMap<String, Object> map);

	Integer getLrIdx(HashMap<String, Object> map);

	String insertLikeReview(HashMap<String, Object> map);

	String deleteLikeReview(HashMap<String, Object> map);

	Integer getBookmarkIdx(HashMap<String, Object> map);

	void insertBook(HashMap<String, Object> map);

	void deleteBook(HashMap<String, Object> map);
	
	   void deleteBookStable(HashMap<String, Object> map);

	
	

}
