package com.board.users.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.business.dto.ImageReivewDTO;
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
   List<UsersDto> getOngoingsearchlist(@Param("search") String search, @Param("start") int start, @Param("size") int size);
   
   List<UsersDto> getClosesearchlist(@Param("search") String search, @Param("start") int start, @Param("size") int size);
    
   
   int updateUserProfile(UsersDto usersDto);
   
   void deleteUser(Long userIdx);

   UsersDto getUserById(String userId);

   UsersDto getStoredetail(UsersDto usersdto);

   List<UsersDto> getStoretag(UsersDto usersdto);

   //메인화면
   int getOngoingcount();

   List<UsersDto> getPopuppaginglist(@Param("start") int start,@Param("size") int size);
   
    //메인화면 검색 - &페이징
   
   int getOpendsearchcount(@Param("search") String search);
   List<UsersDto> getOpendsearchlist(@Param("search") String search, @Param("start") int start, @Param("size") int size);
    
   // 상세 페이지 예약 구분
   UsersDto getStoreReservation(UsersDto usersdto);


   UsersDto getUserById1(Integer userIdx);


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
   List<UsersDto> gettotalreviews(@Param("store_idx") int store_idx,@Param("start") int start,@Param("size") int size);

   // 전체 리뷰,평점 계산 
   UsersDto getotalcount(UsersDto usersdto);

   // 핫리뷰 조회순 3개
   List<UsersDto> getHotReviews(UsersDto usersdto);


   // 리뷰 상세 페이지
   UsersDto getReviewDetail(@Param("storeidx") int storeidx,@Param("useridx") int useridx,@Param("review_idx") int review_idx);

   // 리뷰 수정 - store_idx로 스토어 디테일 데이터 불러오기
   UsersDto getStoredReviewtail(int storeidx);

   // 리뷰 수정 - 스토어 태그
   List<UsersDto> getStoreReviewtag(int storeidx);

   //전체 리뷰&조회수
   UsersDto getotalWriteCount(int storeidx);



   // 내가 쓴 리뷰 개수
   UsersDto getMyTotalReview(UsersDto usersdto, @Param("useruseridx") Long useruseridx);

   //igdate처리
   List<UsersDto> getPopupDate();

   //Map에서 리뷰 제목이나 내용가져오기 
   List<UsersDto> getPopupReview();




   // 이미지
   List<UsersDto> getPopupImgList(UsersDto usersdto);

   //특정 유저 팝콘 보유수
   UsersDto getTotalPopcorn(String username);


   // 리뷰 작성
   int insertReview(UsersDto usersdto);
   
   // 리뷰 수정
   int updateReview(UsersDto usersdto);


   //리뷰 삭제
   int deleteReview(@Param("storeidx") int storeidx,@Param("useridx") int useridx,@Param("review_idx") int review_idx);


   //지도 리뷰조회
   List<String> getStoresReviewAtMap(@Param("store_idx") int store_idx);
   
   //지도 팝업상세조회
   List<UsersDto> getStoresHitAtMap();


   // 전체 리뷰 조회
   UsersDto getselectReviewHit(@Param("storeidx") int storeidx,@Param("useridx") int useridx,@Param("review_idx") int review_idx, @Param("loginidx") int loginidx);
   
   // 리뷰 조회수 증가
   int insertReviewHit(@Param("storeidx") int storeidx,@Param("useridx") int useridx,@Param("review_idx") int review_idx, @Param("loginidx") int loginidx);

   // 리뷰 상세 이미지
   List<UsersDto> getReviewImgList(@Param("storeidx") int storeidx, @Param("useridx") int useridx, @Param("review_idx") int review_idx);

   
   //Wallet 코스추천
   List<UsersDto> getallStorelist();

   List<UsersDto> getAddressesByStoreIdx();
   
   // 모바일 핫리뷰(조회수 기준 2개)
   List<UsersDto> getMobileHotReviews(UsersDto usersdto);

   // 상세페이지 전체 리뷰 페이징용
   int gettotalPosts(@Param("store_idx") int store_idx);;
   
   //이미지 삽입
   List<ImageReivewDTO> getImageReview(int review_idx);

   ImageReivewDTO getImageReviewus(int review_idx);

   //Wallet 코스추천
   List<UsersDto> getallRegionlist();
   //user idx 로 ID 가져오기
   String getID(UsersDto usersdto);

}
