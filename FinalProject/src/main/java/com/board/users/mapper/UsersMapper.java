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


	List<UsersDto> getClosesearchlist(@Param("search") String search);


	UsersDto getStoredetail(UsersDto usersdto);

	List<UsersDto> getStoretag(UsersDto usersdto);

	//메인화면
	int getOngoingcount();

	List<UsersDto> getPopuppaginglist(@Param("start") int start,@Param("size") int size);
	
    //메인화면 검색
	int getOngoingsearchcount(@Param("search") String search);
	List<UsersDto> getOpendsearchlist(@Param("search") String search, @Param("start") int start, @Param("size") int size);

	UsersDto getStoreReservation(UsersDto usersdto);

	UsersDto getStoreOperation(UsersDto usersdto);

	List<UsersDto> getStoreCategory(UsersDto usersdto);

	//igdate처리
	List<UsersDto> getPopupDate();

	//Map에서 리뷰 제목이나 내용가져오기 
	List<UsersDto> getPopupReview();




}
