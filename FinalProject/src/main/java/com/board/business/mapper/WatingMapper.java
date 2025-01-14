package com.board.business.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.business.dto.BookMarkListDto;
import com.board.business.dto.CountConfigDto;
import com.board.business.dto.ReservationTimeSlotDto;
import com.board.business.dto.ReservationUserDto;
import com.board.business.dto.StoreAddNoteDto;
import com.board.business.dto.StoreListDto;
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

	void getReservationWrite(HashMap<String, Object> map);

	StoreListDto getStoreShort(int store_idx);

	List<StoreListDto> getStoreCategory(int store_idx);

	CountConfigDto getCountConfig(HashMap<String, Object> map);

	ReservationUserDto getadvanceUser(int reservation_idx);

	void deleteReservation(int reservation_idx);

	WaitingDto getWaitingStatus(int waiting_idx);

	void updateWaitingOrderInt(int store_idx, int i, int j);

	void updateWaitingOrderUser(int waiting_idx, int myOrder, int newMyOrder);

	void updatePopcornDelay(int waiting_idx);

	void updatePopconNoShow(int waiting_idx);

	void updatePopCornWDelay(int waiting_idx);

	void updatePopCornWNo(int waiting_idx);

	List<BookMarkListDto> getBookMarkList(int user_idx);

	

}
