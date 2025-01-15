package com.board.users.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.users.dto.SuggestionDto;
import com.board.users.dto.UsersBookmarkDto;
import com.board.users.dto.UsersReviewListDto;

@Mapper
public interface UserBookmarkMapper {

	List<UsersBookmarkDto> getbookmark(int user_idx);

	List<UsersReviewListDto> getReview(int user_idx);
	
	int countReviewsByUserId(int user_idx);
	
	List<SuggestionDto> getSuggestion(int user_idx);

	List<SuggestionDto> getcategory(int user_idx);

	List<SuggestionDto> getstorelist(int user_idx);

	
}
