package com.board.business.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.board.business.dto.CountConfigDto;
import com.board.business.dto.ReservationTimeSlotDto;
import com.board.business.dto.ReservationUserDto;
import com.board.business.dto.StoreAddNoteDto;
import com.board.business.dto.StoreListDto;
import com.board.business.dto.StoreStatusDto;
import com.board.business.dto.WaitingDelayDto;
import com.board.business.dto.WaitingDto;

public interface WaitingService {

	void insertWatingList(WaitingDto watingDto);

	List<WaitingDto> getWatingList(int store_idx);

	List<WaitingDto> updateWatingList(WaitingDto waitingDto);

	List<WaitingDto> sendWatingList(WaitingDto waitingDto);

	void updateOnsiteUse(StoreStatusDto storeStatusDTO);

	StoreStatusDto getStoreStauts(int store_idx);

	WaitingDto getUserWaiting(int user_idx);

	List<WaitingDto> getUserWaitingList(int user_idx);

	List<ReservationUserDto> getadvanceList(int user_idx);

	List<WaitingDto> getonStieList(int user_idx);

	List<WaitingDto> getcheckWaiting(int user_idx);
	
	StoreAddNoteDto getStoreAddressNote(int store_idx);

	List<Map<String, Object>> getTimeGrape(int store_idx);

	List<ReservationTimeSlotDto> getadvanceTimeSlotList(int store_idx);

	List<ReservationTimeSlotDto> getadvanceDateList(int store_idx);

	void getReservationWrite(HashMap<String, Object> map);

	StoreListDto getStoreShort(int store_idx);

	List<StoreListDto> getStoreCategory(int store_idx);

	CountConfigDto getCountConfig(HashMap<String, Object> map);

	ReservationUserDto getadvanceUser(int reservation_idx);

	void deleteReservation(int reservation_idx);

	WaitingDto getWaitingStatus(int waiting_idx);

	void getDelay(WaitingDelayDto waitingDelayDto);






	

	

	
	

}
