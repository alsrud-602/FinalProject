package com.board.business.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.business.dto.ReservationTimeSlotDto;
import com.board.business.dto.ReservationUserDto;
import com.board.business.dto.StoreAddNoteDto;
import com.board.business.dto.StoreStatusDto;
import com.board.business.dto.WaitingDto;

@Mapper
public interface WatingMapper {

	void insertWatingList(WaitingDto watingDto);

	List<WaitingDto> getWatingList(int store_idx);

	void updateWatingList(WaitingDto waitingDto);

	void updateWaitingOrder(int store_idx, String wating_order, int newOrder);

	int getStore_idxWaiting(int waiting_idx);

	void updateOnsiteUse(StoreStatusDto storeStatusDTO);

	StoreStatusDto getStoreStauts(int store_idx);

	WaitingDto getUser_idxWating(int waiting_idx);

	WaitingDto getUserWaiting(int user_idx);

	List<WaitingDto> getUserWaitingList(int user_idx);

	List<ReservationUserDto> getadvanceList(int user_idx);

	List<WaitingDto> getonStieList(int user_idx);

	List<WaitingDto> getcheckWaiting(int user_idx);

	StoreAddNoteDto getStoreAddressNote(int store_idx);

	List<Map<String, String>> getWatingTime(int store_idx);

	List<ReservationTimeSlotDto> getadvanceTimeSlotList(int store_idx);

	List<ReservationTimeSlotDto> getadvanceDateList(int store_idx);

	

}
