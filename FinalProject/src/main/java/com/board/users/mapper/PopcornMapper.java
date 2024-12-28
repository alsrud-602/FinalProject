package com.board.users.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.users.vo.PopcornVo;

@Mapper
public interface PopcornMapper {

	List<PopcornVo> getLogByUserId(String userId);

	void updateAttendance(PopcornVo existingLog);

	void insertNewLog(PopcornVo newLog);

	PopcornVo getCheckAttend(String userId);


	boolean AttendToUser(String userId);

	PopcornVo checkWallet(String userId);

	boolean addPointsToUser(String userId, int earnpoint);

	boolean addPopcornLog(String userId, int earnedPoints);

	void updateAttendanceStatus(String userId);

	void updateNewWeekAttend(String userId);





}