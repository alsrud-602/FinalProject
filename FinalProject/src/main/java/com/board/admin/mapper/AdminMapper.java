package com.board.admin.mapper;

import java.util.List;

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



  
	


}
