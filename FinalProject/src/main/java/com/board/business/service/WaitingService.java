package com.board.business.service;

import java.util.List;
import java.util.Map;

import com.board.business.dto.ReservationTimeSlotDto;
import com.board.business.dto.ReservationUserDto;
import com.board.business.dto.StoreAddNoteDto;
import com.board.business.dto.StoreStatusDto;
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



   

}
