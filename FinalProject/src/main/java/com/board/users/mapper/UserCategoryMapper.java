package com.board.users.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.users.dto.UserCategory;
import com.board.users.dto.UsersDto;

@Mapper
public interface UserCategoryMapper {

	     List<Integer> getUserCategories(int userIdx); // 반환형을 List<Integer>로 변경

	     void insertUserCategory(UserCategory userCategory);

	     /*void deleteUserCategory(int userIdx, int categoryId);*/
	     
	     int deleteUserCategory(@Param("userIdx") int userIdx, @Param("categoryId") int categoryId);
	     
	     List<String> getCategoryNamesByUserId(Long userIdx);
	}


