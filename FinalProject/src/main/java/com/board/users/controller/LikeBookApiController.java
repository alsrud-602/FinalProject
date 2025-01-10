package com.board.users.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.users.service.LikeBookService;

@RestController
@RequestMapping("/Popup")
public class LikeBookApiController {
     
	@Autowired
	private LikeBookService likeBookService;
	
	@PostMapping("/Like/Write")
	public ResponseEntity <String> LikeWrite(@RequestBody HashMap<String, Object> map) {
		String LikeCount = likeBookService.insertLikeStore(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( LikeCount );
	}
	@PostMapping("/Like/Config")
	public ResponseEntity <Integer> LikeConfig(@RequestBody HashMap<String, Object> map) {
		Integer ls_idx = likeBookService.getIsIdx(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( ls_idx );
	}

	@DeleteMapping("/Like/Delete")
	public ResponseEntity <String> LikeDelete(@RequestBody HashMap<String, Object> map) {
		String LikeCount = likeBookService.deleteLikeStore(map);	
		return    ResponseEntity.status(HttpStatus.OK).body( LikeCount );
	}
	
	@PostMapping("/Like/Review/Config")
	public ResponseEntity <Integer> LikeReviewConfig(@RequestBody HashMap<String, Object> map) {
		Integer lr_idx = likeBookService.getLrIdx(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( lr_idx );
	}
	@PostMapping("/Like/Review/Write")
	public ResponseEntity <String> LikeReviewWrite(@RequestBody HashMap<String, Object> map) {					
		String LikeCount = likeBookService.insertLikeReview(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( LikeCount );
	}	
	
	@DeleteMapping("/Like/Reivew/Delete")
	public ResponseEntity <String> LikeReivewDelete(@RequestBody HashMap<String, Object> map) {					
		String LikeCount = likeBookService.deleteLikeReview(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( LikeCount );
	}
	
	@PostMapping("/Bookmark/Config")
	public ResponseEntity <Integer> BookingConfig(@RequestBody HashMap<String, Object> map) {
		Integer bookmark_idx = likeBookService.getBookmarkIdx(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( bookmark_idx );
	}	
		
	@PostMapping("/Bookmark/Write")
	public ResponseEntity <String> BookingwWrite(@RequestBody HashMap<String, Object> map) {					
		likeBookService.insertBook(map);		
		String result = "완료";
		return    ResponseEntity.status(HttpStatus.OK).body( result );
	}	
	
	@DeleteMapping("/Bookmark/Delete")
	public ResponseEntity <String> BookmarkDelete(@RequestBody HashMap<String, Object> map) {					
		String  result = "삭제완료";
	   likeBookService.deleteBook(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( result );
	}

}
