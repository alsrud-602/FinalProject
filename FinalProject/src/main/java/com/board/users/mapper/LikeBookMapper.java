package com.board.users.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.users.dto.UsersDto;

@Mapper
public interface LikeBookMapper {

	void insertLikeStore(HashMap<String, Object> map);

	String getLikeStoreCount(HashMap<String, Object> map);

	Integer getIsIdx(HashMap<String, Object> map);

	void deleteLikeStore(HashMap<String, Object> map);

	Integer getLrIdx(HashMap<String, Object> map);

	void insertLikeReview(HashMap<String, Object> map);

	String getLikeReviewCount(HashMap<String, Object> map);

	void deleteLikeReview(HashMap<String, Object> map);

	String getLikeReviewCountR(int review_idx);

	Integer getBookmarkIdx(HashMap<String, Object> map);

	void insertBook(HashMap<String, Object> map);

	void deleteBook(HashMap<String, Object> map);
	
	void deleteBookStable(HashMap<String, Object> map);
    
	
	

}
