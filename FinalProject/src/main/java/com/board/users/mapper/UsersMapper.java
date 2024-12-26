package com.board.users.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.users.dto.UsersDto;

@Mapper
public interface UsersMapper {
    
	// 팝업 전체 리스트
	List<UsersDto> getPopuplist();

}
