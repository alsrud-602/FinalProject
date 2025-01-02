package com.board.users.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.users.dto.UsersDto;

@Mapper
public interface UsersMapper {
    
	// 랭킹 팝업 리스트
	List<UsersDto> getRanklist();
	
	// 진행중 팝업 리스트
	List<UsersDto> getPopuplist();
    
	// 오픈예정 팝업 리스트
	List<UsersDto> getOpendpopuplist();
    
	// 종료된 팝업 리스트
	List<UsersDto> getclosepopuplist();
	
	
	// 메인화면 필터링
	List<UsersDto> getFilterlist(
			@Param("region") String region,
			@Param("age") String age,
			@Param("date") String date);
	
    // 메인화면 검색창
	List<UsersDto> getOngoingsearchlist(@Param("search") String search);

	List<UsersDto> getOpendsearchlist(@Param("search") String search);

	List<UsersDto> getClosesearchlist(@Param("search") String search);

	List<UsersDto> getPopupAdresses();

	


}
