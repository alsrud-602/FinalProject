package com.board.users.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.users.mapper.LikeBookMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LikeBookServiceimpl  implements LikeBookService{
	
	@Autowired
	private LikeBookMapper likeBookMapper;
	
	@Override
	public String insertLikeStore(HashMap<String, Object> map) {
		
		likeBookMapper.insertLikeStore(map);
		String LikeCount = likeBookMapper.getLikeStoreCount(map);
		return LikeCount;
	}

	@Override
	public Integer getIsIdx(HashMap<String, Object> map) {
		Integer is_idx = likeBookMapper.getIsIdx(map);
		return is_idx;
	}

	@Override
	public String deleteLikeStore(HashMap<String, Object> map) {
	likeBookMapper.deleteLikeStore(map);
	String LikeCount = likeBookMapper.getLikeStoreCount(map);
		return LikeCount;
	}

	@Override
	public Integer getLrIdx(HashMap<String, Object> map) {
		Integer Lr_idx = likeBookMapper.getLrIdx(map);
		return Lr_idx;
	}

	@Override
	public String insertLikeReview(HashMap<String, Object> map) {
		
	likeBookMapper.insertLikeReview(map);
	String LikeCount = likeBookMapper.getLikeReviewCount(map);		
		return LikeCount;
	}

	@Override
	public String deleteLikeReview(HashMap<String, Object> map) {
		likeBookMapper.deleteLikeReview(map);
		String LikeCount = likeBookMapper.getLikeReviewCount(map);
		return LikeCount;
	}

	@Override
	public Integer getBookmarkIdx(HashMap<String, Object> map) {
		Integer bookmark_idx = likeBookMapper.getBookmarkIdx(map);
		return bookmark_idx;
	}

	@Override
	public void insertBook(HashMap<String, Object> map) {
		likeBookMapper.insertBook(map);
		
	}

	@Override
	public void deleteBook(HashMap<String, Object> map) {
		likeBookMapper.deleteBook(map);
		
	}
	
	   @Override
	   public void deleteBookStable(HashMap<String, Object> map) {
	      likeBookMapper.deleteBookStable(map);
	      
	   }
	
	
	
	
	

}
