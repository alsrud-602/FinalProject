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
    
	// 메인화면 검색창
	List<UsersDto> getClosesearchlist(@Param("search") String search);

	List<UsersDto> getPopupAdresses();

	UsersDto getStoredetail(UsersDto usersdto);

	List<UsersDto> getStoretag(UsersDto usersdto);

	//메인화면
	int getOngoingcount();

	List<UsersDto> getPopuppaginglist(@Param("start") int start,@Param("size") int size);
	
    //메인화면 검색
	int getOngoingsearchcount(@Param("search") String search);
	List<UsersDto> getOpendsearchlist(@Param("search") String search, @Param("start") int start, @Param("size") int size);
    
	// 상세 페이지 예약 구분
	UsersDto getStoreReservation(UsersDto usersdto);

	// 상세페이지 운영시간 
	UsersDto getStoreOperation(UsersDto usersdto);
    
	//상세 페이지 카테고리
	List<UsersDto> getStoreCategory(UsersDto usersdto);
    
	//전체 조회수 조회
	List<UsersDto> getSelectStoreHit(@Param("store_idx") int store_idx, @Param("username") String username);
	
	//조회수 증가
	int insertStoreHit(@Param("store_idx") int store_idx, @Param("username") String username);
    
	// 디테일 랭킹
	List<UsersDto> getRankdetaillist();
    
	// 조회수 조회
	UsersDto getStoreHit(UsersDto usersdto);
    
	//좋아요 조회
	UsersDto getStoreLike(UsersDto usersdto);
    
	//전체 리뷰 조회
	List<UsersDto> gettotalreviews(UsersDto usersdto);

	// 전체 리뷰,평점 계산 
	UsersDto getotalcount(UsersDto usersdto);

	// 핫리뷰 조회순 3개
	List<UsersDto> getHotReviews(UsersDto usersdto);


	// 리뷰 상세 페이지
	UsersDto getReviewDetail(@Param("storeidx") int storeidx,@Param("useridx") int useridx);

	// 리뷰 수정 - store_idx로 스토어 디테일 데이터 불러오기
	UsersDto getStoredReviewtail(int storeidx);

	// 리뷰 수정 - 스토어 태그
	List<UsersDto> getStoreReviewtag(int storeidx);

	UsersDto getotalWriteCount(int storeidx);




	UsersDto getUserById(Integer userIdx);

	


}
