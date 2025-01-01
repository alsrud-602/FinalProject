package com.board.business.service;

import java.util.List;

import com.board.business.dto.WaitingDto;

public interface WaitingService {

	void insertWatingList(WaitingDto watingDto);

	List<WaitingDto> getWatingList(int store_idx);

	List<WaitingDto> updateWatingList(WaitingDto waitingDto);





	

	

	
	

}
