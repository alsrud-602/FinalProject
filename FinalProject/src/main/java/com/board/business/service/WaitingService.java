package com.board.business.service;

import java.util.List;

import com.board.business.dto.StoreStatusDto;
import com.board.business.dto.WaitingDto;

public interface WaitingService {

	void insertWatingList(WaitingDto watingDto);

	List<WaitingDto> getWatingList(int store_idx);

	List<WaitingDto> updateWatingList(WaitingDto waitingDto);

	List<WaitingDto> sendWatingList(WaitingDto waitingDto);

	void updateOnsiteUse(StoreStatusDto storeStatusDTO);

	StoreStatusDto getStoreStauts(int store_idx);





	

	

	
	

}
