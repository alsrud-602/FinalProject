package com.board.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.admin.vo.AdminVo;

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

	void updateUserStatus(String userId, String status);













  
	


}
