package com.board.admin.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.admin.dto.AdminStoreDto;
import com.board.admin.dto.AdminVo;
import com.board.users.dto.UsersDto;

@Mapper
public interface AdminMapper {



   List<AdminVo> getPopcornLogByUserId(String userId);

   int getTotalPopcorn(String userId);

   int getPopcornEarnLogByUserId(String userId);

   int getPopcornSpentedLogByUserId(String userId);

   List<AdminVo> getalluserinfo();

   void PopcornPlusLogByUserId(String userId, String content, int plusPopcorn);

   void PopcornPlusWalletByUserId(String userId, int plusPopcorn);

   void PopcornMinusLogByUserId(String userId, String content, int minusPopcorn);

   void PopcornMinusWalletByUserId(String userId, int minusPopcorn);

   List<AdminVo> getUserinfo(String userId);




   void PlusPopcorns(Map<String, Object> params);


   void PopcornPlusLogs(String content1, int points1, String user);

   void PopcornMinusLogs(String content1, int points1, String user);

   void MinusPopcorns(Map<String, Object> params);

   List<AdminVo> getallReview();



   String getUserIdx(String userId);

   List<AdminVo> getUserReview(String selUserId);


	boolean updateUserStatus(@Param("userId") String userId, @Param("status") String status);


    //매니저관리
   List<AdminVo> getallcompanyinfo();
   List<Map<String, Object>> getPopupCountsByCompany();
   List<Map<String, Object>> getAllPopupByCompany();


   boolean UpdateCompnanyStatus(@Param("userId") String companyId, @Param("status") String status);


	
	int getTotalUsers();
	
	Map<String, Integer> getMonthlyStats();


   //모든 스토어 리스트
   List<AdminStoreDto> getTotalStore(@Param("start") int start,@Param("size") int size);

   //검색한 스토어 리스트
   List<AdminStoreDto> getSearchStoreList(@Param("search") String search, @Param("filter") String filter, @Param("start") int start,@Param("size") int size);


   Map<String, Integer> getMonthlyStatsByStores();
   

   //팝업카운트
   int getPopuplistCount();

   //List<Map<String, Object>> getStorePerformance(Map<String, String> dateRange);

   long getStoreCountForDate(@Param("companyIdx") int companyIdx, @Param("formattedDate") String formattedDate);

   long getLikeCountForDate(@Param("companyIdx") int companyIdx, @Param("formattedDate") String formattedDate);


   int getStorePerformanceRank(@Param("companyIdx") int companyIdx, @Param("startDate") String startDate, @Param("endDate") String endDate);


   // company_idx로 팝업정보 가져오기
   List<AdminStoreDto> getCompanyPopupDetail(@Param("company_idx") int company_idx,  @Param("start") int start,@Param("size") int size);

   // 회사 정보 가져오기
   AdminStoreDto getCompanyDetail(AdminStoreDto adminstoredto);

   // 스토어별 카테고리 불러오기
   List<AdminStoreDto> getCategoryList(@Param("storeIdx") Integer storeIdx, @Param("company_idx") int company_idx);
   // 페이징용 토탈 스토어
   int gettotalPosts();


   List<HashMap<String, Object>> getPopupManagerDetail();

   List<AdminVo> getPopupManagerDetailList();

   int updateBanStatus(int store_idx);


   // 서치용 토탈 스토어
   int gettotalStoreSearchPosts(@Param("search") String search, @Param("filter") String filter);

   //스토어 디테일 페이징 카운트
   int getStoreDetailPosts(AdminStoreDto adminstoredto);

   //서치후 팝업 정보 가져오기
   List<AdminStoreDto> getCompanyPopupSearchDetail(@Param("company_idx") int company_idx, @Param("search") String search);

   int getTotalStores();

  


}
